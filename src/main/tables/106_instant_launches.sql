SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    quick_launch_id UUID NOT NULL,

    added_by UUID NOT NULL,

    added_on TIMESTAMP NOT NULL DEFAULT now(),

    last_modified TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

DROP TRIGGER IF EXISTS il_last_mod_trigger
    ON instant_launches;
CREATE TRIGGER il_last_mod_trigger
    BEFORE UPDATE ON instant_launches
    FOR EACH ROW EXECUTE FUNCTION trigger_last_modified();