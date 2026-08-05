BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Removing a member, concurrently with the group being attached to a new
-- parent, left the parent's closure permanently stale -- the same silent
-- failure 000059 fixed for additions, in the over-permissive direction: the
-- removed user kept every permission granted to the new parent.
--
-- 000059 works for additions for a reason it did not state: inserting a
-- membership row takes an FK KEY SHARE lock on the group's row, which
-- conflicts with the attach trigger's FOR UPDATE, so the two writers meet. A
-- DELETE performs no referential-integrity check and takes no lock at all on
-- the group row, so the remover never waits for an in-flight attach and its
-- ancestor set is computed from a snapshot that predates it.
--
-- One function now takes the locks for every membership write. On INSERT or
-- UPDATE it locks a group-typed member as before, and additionally refuses a
-- group-typed member with no groups row -- reachable only by direct SQL, but
-- silently orphaned closure rows are worth an error. On DELETE it locks the
-- group being detached from, and the member itself when the member is a
-- group, so removals serialize against concurrent attaches of either side.
--
-- Callers must still write the membership change first and only then compute
-- group_ancestors and recompute, in the same transaction: the ancestor query
-- reads a fresh snapshot only after these locks have forced any concurrent
-- attach to commit or wait.
--
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

DROP TRIGGER IF EXISTS group_memberships_lock_nested_member ON group_memberships;
DROP FUNCTION IF EXISTS group_memberships_lock_nested_member();

DROP TRIGGER IF EXISTS trigger_group_memberships_lock_for_closure ON group_memberships;
CREATE TRIGGER trigger_group_memberships_lock_for_closure
    BEFORE INSERT OR UPDATE OR DELETE ON group_memberships
    FOR EACH ROW EXECUTE FUNCTION group_memberships_lock_for_closure();

-- The 000054 comment told the service to collect containers before deleting a
-- group, which groups_detach_before_delete has done automatically since then;
-- following the old instruction would double-recompute.
COMMENT ON TABLE group_effective_members IS
    'Derived: every user reachable from a group through any depth of nesting. '
    'Maintained by the groups service, which must write the direct membership '
    'change first and then recompute the ancestors'' closures in the same '
    'transaction. Group deletion is handled by the trigger on groups, which '
    'detaches and recomputes the containers itself. Reconcile by recomputing '
    'from group_memberships and diffing; stale rows here grant access that '
    'direct membership no longer justifies.';

COMMIT;
