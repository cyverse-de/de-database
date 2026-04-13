BEGIN;

SET search_path = public, pg_catalog;

--
-- Explicit scheduling priority for operators. Lower values are tried first.
-- Default 0 so existing operators share the same priority and fall back to
-- creation time as a tiebreaker.
--
ALTER TABLE IF EXISTS operators
    ADD COLUMN IF NOT EXISTS priority integer NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS operators_priority_idx
    ON operators (priority ASC, created_at ASC);

COMMIT;
