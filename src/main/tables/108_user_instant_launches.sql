SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS user_instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Indicates the format version of the instant launch
    -- JSON. Should help us put together conversions between
    -- format versions without breaking currently running
    -- services.
    version SERIAL,

    user_id UUID UNIQUE NOT NULL,

    -- Here's an example of how the instant_launches field
    -- is supposed to map info types and glob patterns to 
    -- instant launches. The kind field tells the caller how
    -- use the top-level key. The default field tells you
    -- what the default instant launch should be and the
    -- compatible list contains instant launches that are
    -- also acceptable for the kind of pattern but aren't the
    -- default.
    --
    -- {
    --     "*.py" : {
    --         "kind" : "pattern",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible: [
    --             "<instant_launch_uuid>",
    --         ],
    --     },

    --     "<info_type_uuid>" : {
    --         "kind" : "info-type",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible" : [
    --             "<instant_launch_uuid>",
    --         ],
    --     },
    -- }
    --
    instant_launches JSONB NOT NULL DEFAULT '{}'::JSONB,

    -- Could be an admin.
    added_by UUID NOT NULL, 

    -- Could be useful for support issues.
    added_on TIMESTAMP NOT NULL DEFAULT now()
);