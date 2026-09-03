BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Every write that touches the group graph now serializes on one advisory lock.
--
-- The invariant these functions need is that a closure recomputation's read of
-- the descendant subtree cannot race an attach or detach anywhere in that
-- subtree. Row locks on individual groups cannot express it: the recomputation
-- reads the whole subtree below the groups it rebuilds but locks only the
-- groups it rebuilds, so a membership change one level further down and an
-- attach above it lock disjoint rows, neither waits, and both commit. The
-- deeper change is then missing from -- or, for a removal, still present in --
-- the newly attached ancestor's effective membership, permanently and with no
-- error.
--
-- Group-graph writes are rare next to the permission reads that consume the
-- closure, so serializing all of them globally costs little, and it removes the
-- deadlock the row-lock ordering could not rule out.
--
CREATE OR REPLACE FUNCTION recompute_group_closure(group_ids uuid[]) RETURNS void
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    PERFORM pg_advisory_xact_lock(hashtext('permissions.group_closure'));

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
    'Rebuilds the effective membership of the given groups. Serializes against every other group-graph write on a transaction-scoped advisory lock: the recursive read of the descendant subtree must not overlap an attach or detach anywhere within it.';

CREATE OR REPLACE FUNCTION group_memberships_lock_for_closure() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    PERFORM pg_advisory_xact_lock(hashtext('permissions.group_closure'));

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
    'Serializes every membership write against concurrent closure recomputations on a transaction-scoped advisory lock, and locks the groups the write touches. A membership change below the group being attached elsewhere would otherwise leave the new ancestor stale, permanently and with no error.';

CREATE OR REPLACE FUNCTION groups_detach_before_delete() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
DECLARE
    containers uuid[];
BEGIN
    PERFORM pg_advisory_xact_lock(hashtext('permissions.group_closure'));

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

COMMENT ON FUNCTION groups_detach_before_delete() IS
    'Detaches a group from its containers and recomputes them before the row is deleted, under the same advisory lock as every other group-graph write so the ancestor set is read from a graph no concurrent attach can be changing.';

COMMIT;
