BEGIN;

SET search_path = public, pg_catalog;

DROP TRIGGER IF EXISTS user_data_usage_last_modified_trigger ON user_data_usage CASCADE;
DROP TRIGGER IF EXISTS user_data_usage_last_modified_trigger ON cpu_usage_totals CASCADE;
CREATE TRIGGER user_data_usage_last_modified_trigger
    BEFORE UPDATE ON user_data_usage
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (last_modified);

COMMIT;
