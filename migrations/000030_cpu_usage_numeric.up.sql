BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY cpu_usage_events
    ALTER COLUMN value TYPE numeric;

ALTER TABLE IF EXISTS ONLY cpu_usage_totals
    ALTER COLUMN total TYPE numeric;

COMMIT;
