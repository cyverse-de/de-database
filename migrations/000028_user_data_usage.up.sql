BEGIN;

SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS user_data_usage (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    user_id uuid NOT NULL,
    total bigint NOT NULL DEFAULT 0,
    time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_modified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

    UNIQUE (user_id, time),

    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

DROP TRIGGER IF EXISTS user_data_usage_last_modified_trigger ON user_data_usage CASCADE;
CREATE TRIGGER user_data_usage_last_modified_trigger
    BEFORE UPDATE ON cpu_usage_totals
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (last_modified);

COMMIT;
