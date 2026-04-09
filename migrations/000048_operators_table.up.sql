BEGIN;

SET search_path = public, pg_catalog;

--
-- table for VICE operators
--
CREATE TABLE IF NOT EXISTS operators (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL UNIQUE,
    url text NOT NULL,
    insecure boolean NOT NULL DEFAULT false,
    auth_user text NOT NULL,
    auth_password_encrypted text NOT NULL,
    last_reconciled_at timestamp with time zone,
    reconciled_by text,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    PRIMARY KEY (id)
);

--
-- add operator_id to jobs table as a foreign key and drop redundant operator_name
--
ALTER TABLE IF EXISTS ONLY jobs
    ADD IF NOT EXISTS operator_id uuid DEFAULT NULL,
    ADD CONSTRAINT jobs_operator_id_fkey FOREIGN KEY (operator_id) REFERENCES operators(id),
    DROP COLUMN IF EXISTS operator_name;

--
-- Index for reconciliation polling. 
-- We index last_reconciled_at to support efficient sorting and filtering.
--
CREATE INDEX IF NOT EXISTS operators_reconciliation_idx 
    ON operators (last_reconciled_at);

COMMIT;
