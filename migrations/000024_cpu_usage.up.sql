BEGIN;

SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS cpu_usage_event_types (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    name character varying(32) NOT NULL,
    description text,
    last_modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)
);

DROP TRIGGER IF EXISTS cpu_usage_event_types_last_modified_trigger ON cpu_usage_event_types CASCADE;
CREATE TRIGGER cpu_usage_event_types_last_modified_trigger
    BEFORE UPDATE ON cpu_usage_event_types
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (last_modified);

CREATE TABLE IF NOT EXISTS cpu_usage_events (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    record_date timestamp NOT NULL,
    effective_date timestamp NOT NULL,
    event_type_id uuid NOT NULL,
    value bigint NOT NULL,
    created_by uuid NOT NULL,
    last_modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE (created_by, event_type_id, record_date, effective_date),

    FOREIGN KEY (event_type_id) REFERENCES cpu_usage_event_types(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    PRIMARY KEY (id)
);

DROP TRIGGER IF EXISTS cpu_usage_events_last_modified_trigger ON cpu_usage_events CASCADE;
CREATE TRIGGER cpu_usage_events_last_modified_trigger
    BEFORE UPDATE ON cpu_usage_events
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (last_modified);

CREATE TABLE IF NOT EXISTS cpu_usage_totals (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    user_id uuid NOT NULL,
    total bigint NOT NULL DEFAULT 0,
    effective_range tsrange NOT NULL,
    last_modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT effective_range_exclusion EXCLUDE USING GIST (user_id WITH =, effective_range WITH &&),

    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

DROP TRIGGER IF EXISTS cpu_usage_totals_last_modified_trigger ON cpu_usage_totals CASCADE;
CREATE TRIGGER cpu_usage_totals_last_modified_trigger
    BEFORE UPDATE ON cpu_usage_totals
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (last_modified);

COMMIT;
