BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS cpu_usage_events
    ALTER COLUMN value TYPE bigint;

ALTER TABLE IF EXISTS cpu_usage_totals
    ALTER COLUMN total TYPE bigint;

COMMIT;