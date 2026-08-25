BEGIN;

SET search_path = public, pg_catalog;

--
-- Resource presets provide named sets of resource settings that users can
-- select when launching analyses, instead of choosing CPU/memory/GPU values
-- individually.
--
CREATE TABLE resource_presets (
    id                 uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    label              text NOT NULL UNIQUE,
    description        text,
    max_cpu_cores      decimal(6,3) NOT NULL,
    min_memory_limit   bigint NOT NULL,
    max_gpus           integer NOT NULL DEFAULT 0,
    time_limit_seconds integer,
    display_order      integer NOT NULL DEFAULT 0,
    is_default         boolean NOT NULL DEFAULT false,
    is_enabled         boolean NOT NULL DEFAULT true,

    CONSTRAINT resource_presets_cpu_positive CHECK (max_cpu_cores > 0),
    CONSTRAINT resource_presets_memory_positive CHECK (min_memory_limit > 0),
    CONSTRAINT resource_presets_gpus_non_negative CHECK (max_gpus >= 0),
    CONSTRAINT resource_presets_time_limit_positive CHECK (time_limit_seconds IS NULL OR time_limit_seconds > 0)
);

-- Enforce at most one row may be marked as the default preset.
CREATE UNIQUE INDEX resource_presets_single_default_idx
    ON resource_presets (is_default)
    WHERE is_default = true;

COMMIT;
