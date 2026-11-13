BEGIN;

SET search_path = public, pg_catalog;

-- Marks a parameter (currently only meaningful for EnvironmentVariable-typed
-- parameters) whose value must never be persisted in plaintext outside the
-- Kubernetes Secret vice-operator injects it through: not in saved-launch
-- configs, not in job submission JSON, not in any admin-facing listing.
-- See cyverse-de/app-exposer's VICESpec.SensitiveEnvironment /
-- vicebuild/secrets.go for the consumer side of this flag.
ALTER TABLE IF EXISTS ONLY parameters
    ADD IF NOT EXISTS is_sensitive boolean NOT NULL DEFAULT false;

-- Recreate task_param_listing to surface the new column; see
-- migrations/000017_views.up.sql for the view this supersedes.
CREATE OR REPLACE VIEW task_param_listing AS
    SELECT t.id AS task_id,
           p.parameter_group_id,
           p.id,
           p.name,
           p.label,
           p.description,
           p.ordering,
           p.display_order,
           p.required,
           p.omit_if_blank,
           p.is_visible,
           pt.name AS parameter_type,
           vt.name AS value_type,
           f.retain,
           f.is_implicit,
           f.repeat_option_flag,
           it.name AS info_type,
           df.name AS data_format,
           ds.name AS data_source,
           p.is_sensitive
    FROM parameters p
        INNER JOIN parameter_types pt ON pt.id = p.parameter_type
        INNER JOIN value_type vt ON vt.id = pt.value_type_id
        LEFT JOIN file_parameters f ON f.parameter_id = p.id
        LEFT JOIN info_type it ON f.info_type = it.id
        LEFT JOIN data_formats df ON f.data_format = df.id
        LEFT JOIN data_source ds ON f.data_source_id = ds.id
        INNER JOIN parameter_groups g ON g.id = p.parameter_group_id
        INNER JOIN tasks t ON t.id = g.task_id;

COMMIT;
