BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY jobs
    DROP IF EXISTS operator_name CASCADE;

COMMIT;
