BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY jobs
    DROP CONSTRAINT IF EXISTS jobs_operator_id_fkey,
    DROP COLUMN IF EXISTS operator_id,
    ADD COLUMN IF NOT EXISTS operator_name text DEFAULT NULL;

DROP INDEX IF EXISTS operators_reconciliation_idx;
DROP TABLE IF EXISTS operators;

COMMIT;
