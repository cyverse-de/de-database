BEGIN;

SET search_path = permissions, public, pg_catalog;

-- Restores the form from 000057, which cannot delete a set of nested groups in
-- one statement.
CREATE OR REPLACE FUNCTION groups_detach_before_delete() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
DECLARE
    containers uuid[];
BEGIN
    SELECT array_agg(a) INTO containers
      FROM group_ancestors(ARRAY[OLD.subject_id]) AS a
     WHERE a <> OLD.subject_id;

    -- Detach first so the recomputation observes the graph without this group.
    DELETE FROM group_memberships WHERE member_id = OLD.subject_id;

    IF containers IS NOT NULL THEN
        PERFORM recompute_group_closure(containers);
    END IF;

    RETURN OLD;
END;
$$;

COMMIT;
