BEGIN;

SET search_path = public, pg_catalog;

INSERT INTO cpu_usage_event_types (name, description)
    SELECT * FROM (
        VALUES ('cpu.hours.add', 'Add more CPU hours to the total for a user.') 
    ) AS t (varchar, text)
    WHERE (
        SELECT name FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.add'
    ) IS NULL;

INSERT INTO cpu_usage_event_types (name, description)
    SELECT * FROM (
        VALUES ('cpu.hours.subtract', 'Remove CPU hours from the total for a user.')
    ) AS t (varchar, text)
    WHERE (
        SELECT name FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.subtract'
    ) IS NULL;

INSERT INTO cpu_usage_event_types (name, description)
    SELECT * FROM (
        VALUES ('cpu.hours.reset', 'Reset the CPU hours total for a user to a new value.')
    ) AS t (varchar, text)
    WHERE (
        SELECT name FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.reset'
    ) IS NULL;

INSERT INTO cpu_usage_event_types (name, description)
    SELECT * FROM (
        VALUES ('cpu.hours.calculate', '(Re)Calculate the CPU hours total for a user.')
    ) AS t (varchar, text)
    WHERE (
        SELECT name FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.calculate'
    ) IS NULL;

CREATE TABLE IF NOT EXISTS cpu_usage_workers (
    id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),
    added_on timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    name character varying(32) NOT NULL,
    active bool NOT NULL DEFAULT true,
    activation_expires_on timestamp,
    deactivated_on timestamp,
    activated_on timestamp,
    getting_work bool NOT NULL DEFAULT false,
    getting_work_on timestamp,
    getting_work_expires_on timestamp,
    working bool NOT NULL DEFAULT false,
    working_on timestamp,
    last_modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)
);

DROP TRIGGER IF EXISTS cpu_usage_workers_last_modified_trigger ON cpu_usage_workers CASCADE;
CREATE TRIGGER cpu_usage_workers_last_modified_trigger
    BEFORE UPDATE ON cpu_usage_workers
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (last_modified);

DROP TRIGGER IF EXISTS cpu_usage_workers_activated_on_trigger ON cpu_usage_workers CASCADE;
CREATE TRIGGER cpu_usage_workers_activated_on_trigger
    BEFORE UPDATE ON cpu_usage_workers
    FOR EACH ROW
    WHEN (NOT OLD.active AND NEW.active)
    EXECUTE PROCEDURE moddatetime (activated_on);

DROP TRIGGER IF EXISTS cpu_usage_workers_deactivated_on_trigger ON cpu_usage_workers CASCADE;
CREATE TRIGGER cpu_usage_workers_deactivated_on_trigger
    BEFORE UPDATE ON cpu_usage_workers
    FOR EACH ROW
    WHEN (OLD.active AND NOT NEW.active)
    EXECUTE PROCEDURE moddatetime (deactivated_on);

DROP TRIGGER IF EXISTS cpu_usage_workers_getting_work_on_trigger ON cpu_usage_workers CASCADE;
CREATE TRIGGER cpu_usage_workers_getting_work_on_trigger
    BEFORE UPDATE ON cpu_usage_workers
    FOR EACH ROW
    WHEN (NOT OLD.getting_work AND NEW.getting_work)
    EXECUTE PROCEDURE moddatetime (getting_work_on);

ALTER TABLE IF EXISTS ONLY cpu_usage_events 
    ADD IF NOT EXISTS claimed boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS claimed_by uuid REFERENCES cpu_usage_workers(id),
    ADD IF NOT EXISTS claimed_on timestamp,
    ADD IF NOT EXISTS claim_expires_on timestamp,
    ADD IF NOT EXISTS processed boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS processing boolean NOT NULL DEFAULT false,
    ADD IF NOT EXISTS processed_on timestamp,
    ADD IF NOT EXISTS max_processing_attempts int NOT NULL DEFAULT 3,
    ADD IF NOT EXISTS attempts int NOT NULL DEFAULT 0;

DROP TRIGGER IF EXISTS cpu_usage_events_claimed_on_trigger ON cpu_usage_events CASCADE;
CREATE TRIGGER cpu_usage_events_claimed_on_trigger
    BEFORE UPDATE ON cpu_usage_events
    FOR EACH ROW
    WHEN (NOT OLD.claimed AND NEW.claimed)
    EXECUTE PROCEDURE moddatetime (claimed_on);

DROP TRIGGER IF EXISTS cpu_usage_events_processed_on_trigger ON cpu_usage_events CASCADE;
CREATE TRIGGER cpu_usage_events_processed_on_trigger
    BEFORE UPDATE ON cpu_usage_events
    FOR EACH ROW
    WHEN (NOT OLD.processed AND NEW.processed)
    EXECUTE PROCEDURE moddatetime (processed_on);

COMMIT;