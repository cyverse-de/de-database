BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Deleting several nested groups in one statement failed.
--
-- The BEFORE DELETE trigger recomputes the closure of every group containing
-- the one being deleted. When a set of nested groups goes at once -- a cascade
-- from subjects deletes them row by row -- a container can already be gone by
-- the time its child is deleted, and recomputing it inserts group_effective_
-- members rows for a group no longer in `groups`, violating the foreign key.
-- The whole statement then fails, so the deletion cannot be performed at all.
--
-- A container that is itself being deleted has no closure worth rebuilding: its
-- rows are cascading away regardless. Skipping those is enough, and leaves the
-- single-group case, which is what the service does, unchanged.
--
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

COMMIT;
