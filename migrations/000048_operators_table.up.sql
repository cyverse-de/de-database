BEGIN;

SET search_path = public, pg_catalog;

--
-- Registry of VICE operators -- services that manage interactive analysis
-- workloads on behalf of the DE. Each operator targets a specific
-- Kubernetes cluster.
--
CREATE TABLE IF NOT EXISTS operators (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL UNIQUE CHECK (name ~ '\S'),
    url text NOT NULL UNIQUE CHECK (url ~ '\S'),
    -- When true, skip TLS certificate verification for this operator's endpoint.
    tls_skip_verify boolean NOT NULL DEFAULT false,
    auth_user text NOT NULL CHECK (auth_user ~ '\S'),
    -- Application-layer encrypted credential; decryption is handled by the service, not the DB.
    auth_password_encrypted text NOT NULL CHECK (auth_password_encrypted ~ '\S'),
    -- NULL pair means the operator has never been reconciled.
    last_reconciled_at timestamp with time zone,
    -- Identifier of the service or user that performed the last reconciliation.
    reconciled_by text,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    PRIMARY KEY (id),
    CHECK (
        (last_reconciled_at IS NULL AND reconciled_by IS NULL)
        OR (last_reconciled_at IS NOT NULL AND reconciled_by IS NOT NULL)
    )
);

-- Automatically maintain updated_at on row modification.
CREATE OR REPLACE FUNCTION update_operators_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_operators_updated_at ON operators;
CREATE TRIGGER trigger_operators_updated_at
    BEFORE UPDATE ON operators
    FOR EACH ROW
    EXECUTE FUNCTION update_operators_updated_at();

--
-- Replace the free-text operator_name with a foreign key to the operators
-- table, ensuring referential integrity and centralizing operator metadata.
--
ALTER TABLE IF EXISTS ONLY jobs
    ADD IF NOT EXISTS operator_id uuid DEFAULT NULL,
    DROP COLUMN IF EXISTS operator_name;

-- Separate statement: ADD CONSTRAINT has no IF NOT EXISTS guard, so we
-- check pg_constraint to make the migration idempotent.
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'jobs_operator_id_fkey'
    ) THEN
        -- Prevent deletion of an operator while jobs still reference it.
        ALTER TABLE jobs
            ADD CONSTRAINT jobs_operator_id_fkey
            FOREIGN KEY (operator_id) REFERENCES operators(id) ON DELETE RESTRICT;
    END IF;
END$$;

-- operator_id is nullable: NULL indicates the analysis predates the operator
-- system (legacy direct deployment).
COMMENT ON COLUMN jobs.operator_id IS
    'FK to operators. NULL means the job was launched before the operator system.';

--
-- Supports periodic reconciliation queries that find operators by staleness
-- (e.g., WHERE last_reconciled_at < now() - interval ''5 minutes'' ORDER BY last_reconciled_at).
--
CREATE INDEX IF NOT EXISTS operators_reconciliation_idx
    ON operators (last_reconciled_at);

COMMIT;
