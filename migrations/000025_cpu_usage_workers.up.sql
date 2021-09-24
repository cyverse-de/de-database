BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY cpu_usage_events 
    ADD IF NOT EXISTS claimed boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS claimed_by string,
    ADD IF NOT EXISTS claimed_on timestamp,
    ADD IF NOT EXISTS claim_expires on timestamp,
    ADD IF NOT EXISTS processed boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS processed_on timestamp,
    ADD IF NOT EXISTS max_processing_attempts int NOT NULL DEFAULT 3,
    ADD IF NOT EXISTS attempts int NOT NULL DEFAULT 0;

CREATE TRIGGER cpu_usage_events_claimed_on_trigger
    AFTER UPDATE OF cpu_usage_events
    FOR EACH ROW
    WHEN (NOT OLD.claimed AND NEW.claimed)
    EXECUTE PROCEDURE moddatetime (claimed_on);

CREATE TRIGGER cpu_usage_events_processed_on_trigger
    AFTER UPDATE OF cpu_usage_events
    FOR EACH ROW
    WHEN (NOT OLD.processed AND NEW.processed)
    EXECUTE PROCEDURE moddatetime (claimed_on);
