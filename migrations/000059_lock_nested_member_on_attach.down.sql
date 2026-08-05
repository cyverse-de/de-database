BEGIN;
SET search_path = permissions, public, pg_catalog;
DROP TRIGGER IF EXISTS group_memberships_lock_nested_member ON group_memberships;
DROP FUNCTION IF EXISTS group_memberships_lock_nested_member();
COMMIT;
