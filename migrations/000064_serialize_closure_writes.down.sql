BEGIN;

SET search_path = permissions, public, pg_catalog;

-- Restores the row-lock-only forms from 000059, 000060 and 000063, under which
-- a membership change below a group being attached elsewhere is lost.
CREATE OR REPLACE FUNCTION recompute_group_closure(group_ids uuid[]) RETURNS void
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    PERFORM subject_id
       FROM groups
      WHERE subject_id = ANY(group_ids)
      ORDER BY subject_id
        FOR UPDATE;

    DELETE FROM group_effective_members WHERE group_id = ANY(group_ids);

    INSERT INTO group_effective_members (group_id, member_id)
    WITH RECURSIVE reachable(root, member_id, member_type) AS (
        SELECT gm.group_id, gm.member_id, gm.member_type
          FROM group_memberships gm
         WHERE gm.group_id = ANY(group_ids)
        UNION
        SELECT r.root, gm.member_id, gm.member_type
          FROM reachable r
          JOIN group_memberships gm ON gm.group_id = r.member_id
         WHERE r.member_type = 'group'
    )
    SELECT DISTINCT root, member_id FROM reachable WHERE member_type = 'user';
END;
$$;

COMMENT ON FUNCTION recompute_group_closure(uuid[]) IS
    'Rebuilds the effective membership of the given groups. Locks them in id order first: concurrent recomputations of a shared ancestor otherwise collide on the primary key, and a concurrently-attached parent is never recomputed at all.';

CREATE OR REPLACE FUNCTION group_memberships_lock_for_closure() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        -- The group row may already be gone when this fires from the groups
        -- delete cascade; there is nothing left to serialize against then.
        PERFORM subject_id FROM groups WHERE subject_id = OLD.group_id FOR UPDATE;
        IF OLD.member_type = 'group' THEN
            PERFORM subject_id FROM groups WHERE subject_id = OLD.member_id FOR UPDATE;
        END IF;
        RETURN OLD;
    END IF;

    IF NEW.member_type = 'group' THEN
        PERFORM subject_id FROM groups WHERE subject_id = NEW.member_id FOR UPDATE;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'group-typed member % has no groups row; the member group does not exist or was deleted concurrently', NEW.member_id
                USING ERRCODE = 'foreign_key_violation';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

COMMENT ON FUNCTION group_memberships_lock_for_closure() IS
    'Locks the groups a membership write touches so concurrent closure recomputations serialize instead of losing each other''s work. Covers both directions: an attach waits for recomputations of the group being attached, and a removal waits for an in-flight attach of the group it detaches from.';

CREATE OR REPLACE FUNCTION groups_detach_before_delete() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
DECLARE
    containers uuid[];
BEGIN
    SELECT array_agg(a) INTO containers
      FROM group_ancestors(ARRAY[OLD.subject_id]) AS a
     WHERE a <> OLD.subject_id
       AND EXISTS (SELECT 1 FROM groups g WHERE g.subject_id = a);

    -- Detach first so the recomputation observes the graph without this group.
    DELETE FROM group_memberships WHERE member_id = OLD.subject_id;

    IF containers IS NOT NULL THEN
        PERFORM recompute_group_closure(containers);
    END IF;

    RETURN OLD;
END;
$$;

COMMENT ON FUNCTION groups_detach_before_delete() IS NULL;

COMMIT;
