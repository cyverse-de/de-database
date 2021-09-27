BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY cpu_usage_events
    DROP If EXISTS claimed CASCADE,
    DROP IF EXISTS claimed_by CASCADE,
    DROP IF EXISTS claimed_on CASCADE,
    DROP IF EXISTS claim_expires_on CASCADE,
    DROP IF EXISTS processed CASCADE,
    DROP IF EXISTS processed_on CASCADE,
    DROP IF EXISTS max_processing_attempts CASCADE,
    DROP IF EXISTS attempts CASCADE;

DROP TRIGGER IF EXISTS cpu_usage_events_claimed_on_trigger ON cpu_usage_events CASCADE;
DROP TRIGGER IF EXISTS cpu_usage_events_processed_on_trigger ON cpu_usage_events CASCADE;

COMMIT;
