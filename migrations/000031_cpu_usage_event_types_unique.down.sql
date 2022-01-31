BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS cpu_usage_event_types DROP CONSTRAINT IF EXISTS cpu_usage_event_types_name_unique;

COMMIT;