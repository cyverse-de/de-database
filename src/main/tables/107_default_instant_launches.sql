SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS default_instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    version SERIAL NOT NULL,

    instant_launches JSONB NOT NULL DEFAULT '{}'::JSONB,

    added_by UUID NOT NULL,

    added_on TIMESTAMP NOT NULL DEFAULT now(),

    last_modified TIMESTAMPTZ NOT NULL DEFAULT now()
);

DROP TRIGGER IF EXISTS dil_last_mod_trigger
    ON default_instant_launches;
CREATE TRIGGER dil_last_mod_trigger
    BEFORE UPDATE ON default_instant_launches
    FOR EACH ROW EXECUTE FUNCTION trigger_last_modified();