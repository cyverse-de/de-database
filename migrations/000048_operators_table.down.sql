BEGIN;

SET search_path = public, pg_catalog;

-- Restore operator_name and populate it from the operators table before
-- dropping it, so rollback is not destructive.
ALTER TABLE IF EXISTS ONLY jobs
    ADD COLUMN IF NOT EXISTS operator_name text DEFAULT NULL;

UPDATE jobs j
SET operator_name = o.name
FROM operators o
WHERE j.operator_id = o.id;

ALTER TABLE IF EXISTS ONLY jobs
    DROP CONSTRAINT IF EXISTS jobs_operator_id_fkey,
    DROP COLUMN IF EXISTS operator_id;

DROP TRIGGER IF EXISTS trigger_operators_updated_at ON operators;
DROP FUNCTION IF EXISTS update_operators_updated_at();
DROP INDEX IF EXISTS operators_reconciliation_idx;
DROP TABLE IF EXISTS operators;

COMMIT;
