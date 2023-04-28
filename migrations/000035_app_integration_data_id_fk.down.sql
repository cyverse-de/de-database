BEGIN;

SET search_path = public, pg_catalog;

--
-- Foreign Key for `integration_data_id` column in `app_versions` table.
--
ALTER TABLE IF EXISTS app_versions
    DROP CONSTRAINT IF EXISTS app_integration_data_id_fk;

DROP INDEX IF EXISTS app_versions_integration_data_id;

COMMIT;
