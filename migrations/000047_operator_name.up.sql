BEGIN;

SET search_path = public, pg_catalog;

-- Track which VICE operator manages each analysis.
-- NULL means the analysis was launched before the operator system (legacy direct deployment).
ALTER TABLE IF EXISTS ONLY jobs
    ADD IF NOT EXISTS operator_name text DEFAULT NULL;

COMMIT;
