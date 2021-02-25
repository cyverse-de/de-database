BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS app_hierarchy_version;

DROP TABLE IF EXISTS suggested_groups;
DROP TABLE IF EXISTS app_category_app;
DROP TABLE IF EXISTS app_category_group;
ALTER TABLE workspace DROP CONSTRAINT IF EXISTS workspace_root_category_id_fkey;
DROP TABLE IF EXISTS app_categories;
DROP TABLE IF EXISTS workspace;

COMMIT;
