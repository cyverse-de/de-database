BEGIN;

SET search_path = public, pg_catalog;

DROP TRIGGER IF EXISTS cpu_usage_event_types_last_modified_trigger ON cpu_usage_event_types CASCADE;
DROP TRIGGER IF EXISTS cpu_usage_events_last_modified_trigger ON cpu_usage_events CASCADE;
DROP TRIGGER IF EXISTS cpu_usage_totals_last_modified_trigger ON cpu_usage_totals CASCADE;

DROP TABLE IF EXISTS cpu_usage_events;
DROP TABLE IF EXISTS cpu_usage_totals;
DROP TABLE IF EXISTS cpu_usage_event_types;

COMMIT;