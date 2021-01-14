SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS default_instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Indicates the format version of the instant launch
    -- JSON. Should help us put together conversions between
    -- format versions without breaking currently running
    -- services.
    version SERIAL,

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

    --     "<info_type_name>" : {
    --         "kind" : "info-type",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible" : [
    --             "<instant_launch_uuid>",
    --         ],
    --     },
    -- }
    --

    instant_launches JSONB NOT NULL DEFAULT '{}'::JSONB,

    added_by UUID NOT NULL,

    added_on TIMESTAMP NOT NULL DEFAULT now()
);