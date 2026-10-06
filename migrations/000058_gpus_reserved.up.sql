BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY jobs
    ADD IF NOT EXISTS gpus_reserved int NOT NULL DEFAULT 0;

COMMIT;
