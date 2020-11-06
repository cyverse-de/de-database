SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS user_instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    user_id UUID UNIQUE NOT NULL,

    instant_launches JSONB NOT NULL DEFAULT '{}'::JSONB

    -- Could be an admin.
    added_by UUID NOT NULL, 

    -- Could be useful for support issues.
    added_on TIMESTAMP NOT NULL DEFAULT now(),

    last_modified TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- There's no CREATE TRIGGER IF NOT EXISTS, so have to do this.
DROP TRIGGER IF EXISTS uil_last_mod_trigger
    ON user_instant_launches;
CREATE TRIGGER uil_last_mod_trigger
    BEFORE UPDATE ON user_instant_launches
    FOR EACH ROW EXECUTE FUNCTION trigger_last_modified();