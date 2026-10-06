BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY jobs
    DROP IF EXISTS gpus_reserved CASCADE;

COMMIT;
