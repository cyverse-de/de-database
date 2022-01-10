BEGIN;

SET search_path = public, pg_catalog;

DROP TRIGGER IF EXISTS user_data_usage_last_modified_trigger ON cpu_usage_events CASCADE;
DROP TRIGGER IF EXISTS user_data_usage_last_modified_trigger ON user_data_usage CASCADE;

COMMIT;
