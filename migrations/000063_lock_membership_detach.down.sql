BEGIN;

SET search_path = permissions, public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_group_memberships_lock_for_closure ON group_memberships;
DROP FUNCTION IF EXISTS group_memberships_lock_for_closure();

-- Restores the insert-only lock from 000062.
CREATE OR REPLACE FUNCTION group_memberships_lock_nested_member() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    IF NEW.member_type = 'group' THEN
        PERFORM subject_id FROM groups WHERE subject_id = NEW.member_id FOR UPDATE;
    END IF;
    RETURN NEW;
END;
$$;

COMMENT ON FUNCTION group_memberships_lock_nested_member() IS
    'Locks a group as it is attached to a parent, so the attach serializes against any concurrent recomputation of that group. Without it the new parent misses members added concurrently, permanently and with no error.';

DROP TRIGGER IF EXISTS group_memberships_lock_nested_member ON group_memberships;
CREATE TRIGGER group_memberships_lock_nested_member
    BEFORE INSERT ON group_memberships
    FOR EACH ROW EXECUTE FUNCTION group_memberships_lock_nested_member();

-- Restores the 000057 comment.
COMMENT ON TABLE group_effective_members IS
    'Derived: every user reachable from a group through any depth of nesting. '
    'Maintained on write by the groups service; reconcile by recomputing from '
    'group_memberships and diffing. Deleting a nested group cascades away the '
    'membership row without updating this table, so the service must collect the '
    'containing groups BEFORE issuing the delete and recompute them after -- once '
    'the cascade fires, the path is gone and they can no longer be found. Stale '
    'rows here grant access that direct membership no longer justifies.';

COMMIT;
