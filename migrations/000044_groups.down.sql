BEGIN;

SET search_path = public, pg_catalog;

-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS group_attributes;
DROP TABLE IF EXISTS group_type_names;
DROP TABLE IF EXISTS permission_assignments;
DROP TABLE IF EXISTS permission_actions;
DROP TABLE IF EXISTS attribute_names;
DROP TABLE IF EXISTS attribute_definitions;
DROP TABLE IF EXISTS folder_privileges;
DROP TABLE IF EXISTS group_privileges;
DROP TABLE IF EXISTS group_members;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS folders;

-- Drop custom types
DROP TYPE IF EXISTS permission_assignment_type;
DROP TYPE IF EXISTS folder_privilege_type;
DROP TYPE IF EXISTS group_privilege_type;

COMMIT;
