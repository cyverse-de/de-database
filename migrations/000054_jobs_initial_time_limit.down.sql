BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY jobs
    DROP COLUMN initial_time_limit_seconds;

COMMIT;
