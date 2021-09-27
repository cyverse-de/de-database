BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY cpu_usage_events 
    ADD IF NOT EXISTS claimed boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS claimed_by UUID REFERENCES users(id),
    ADD IF NOT EXISTS claimed_on timestamp,
    ADD IF NOT EXISTS claim_expires_on timestamp,
    ADD IF NOT EXISTS processed boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS processing boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS processed_on timestamp,
    ADD IF NOT EXISTS max_processing_attempts int NOT NULL DEFAULT 3,
    ADD IF NOT EXISTS attempts int NOT NULL DEFAULT 0;

DROP TRIGGER IF EXISTS cpu_usage_events_claimed_on_trigger ON cpu_usage_events CASCADE;
CREATE TRIGGER cpu_usage_events_claimed_on_trigger
    AFTER UPDATE ON cpu_usage_events
    FOR EACH ROW
    WHEN (NOT OLD.claimed AND NEW.claimed)
    EXECUTE PROCEDURE moddatetime (claimed_on);

DROP TRIGGER IF EXISTS cpu_usage_events_processed_on_trigger ON cpu_usage_events CASCADE;
CREATE TRIGGER cpu_usage_events_processed_on_trigger
    AFTER UPDATE ON cpu_usage_events
    FOR EACH ROW
    WHEN (NOT OLD.processed AND NEW.processed)
    EXECUTE PROCEDURE moddatetime (claimed_on);

COMMIT;