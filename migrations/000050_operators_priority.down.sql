BEGIN;

SET search_path = public, pg_catalog;

DROP INDEX IF EXISTS operators_priority_idx;

ALTER TABLE IF EXISTS operators
    DROP COLUMN IF EXISTS priority;

COMMIT;
