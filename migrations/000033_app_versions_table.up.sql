BEGIN;

SET search_path = public, pg_catalog;

--
-- Drop obsolete views that will not work with versions.
--
DROP VIEW IF EXISTS app_job_types;
DROP VIEW IF EXISTS vice_analyses;

--
-- app_versions table
--
CREATE TABLE IF NOT EXISTS app_versions (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    app_id uuid NOT NULL,
    version varchar(255) NOT NULL,
    version_order int NOT NULL DEFAULT 0,
    deleted boolean NOT NULL DEFAULT false,
    disabled boolean NOT NULL DEFAULT false,
    integration_data_id uuid NOT NULL,
    integration_date timestamp without time zone,
    edited_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    UNIQUE (app_id, version_order)
);

CREATE INDEX IF NOT EXISTS app_versions_app_id ON app_versions(app_id);
CREATE INDEX IF NOT EXISTS app_versions_version_order ON app_versions(version_order);

--
-- Initial app_versions data
--
INSERT INTO app_versions (
    app_id,
    version,
    deleted,
    disabled,
    integration_data_id,
    integration_date,
    edited_date
)
    SELECT
        id AS app_id,
        'Unversioned' AS version,
        deleted,
        disabled,
        integration_data_id,
        integration_date,
        edited_date
    FROM apps
    ON CONFLICT DO NOTHING;

--
-- Replace the `app_id` column in the `app_steps` table
-- with a new `app_version_id` column.
--
ALTER TABLE ONLY app_steps
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE app_steps
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE app_steps.app_id = app_versions.app_id
    );
ALTER TABLE ONLY app_steps
    ALTER COLUMN app_version_id SET NOT NULL;
ALTER TABLE ONLY app_steps
    DROP COLUMN IF EXISTS app_id;

--
-- Foreign Key for `app_version_id` column in `app_steps` table.
--
ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS app_steps_app_version_id ON app_steps(app_version_id);

--
-- Replace the `app_id` column in the `app_documentation` table
-- with a new `app_version_id` column.
--
ALTER TABLE ONLY app_documentation
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE app_documentation
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE app_documentation.app_id = app_versions.app_id
    );
ALTER TABLE ONLY app_documentation
    ALTER COLUMN app_version_id SET NOT NULL;
ALTER TABLE ONLY app_documentation
    DROP COLUMN IF EXISTS app_id;

--
-- `app_documentation` table primary key.
--
ALTER TABLE app_documentation
    ADD CONSTRAINT app_documentation_pkey
    PRIMARY KEY (app_version_id);

--
-- Foreign Key for `app_version_id` column in `app_documentation` table.
--
ALTER TABLE ONLY app_documentation
    ADD CONSTRAINT app_documentation_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

--
-- Replace the `app_id` column in the `app_references` table
-- with a new `app_version_id` column.
--
ALTER TABLE ONLY app_references
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE app_references
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE app_references.app_id = app_versions.app_id
    );
ALTER TABLE ONLY app_references
    ALTER COLUMN app_version_id SET NOT NULL;
ALTER TABLE ONLY app_references
    DROP COLUMN IF EXISTS app_id;

--
-- Foreign Key for `app_version_id` column in `app_references` table.
--
ALTER TABLE ONLY app_references
    ADD CONSTRAINT app_references_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS app_references_app_version_id ON app_references(app_version_id);

--
-- Drop duplicate columns from the `apps` table
--
ALTER TABLE ONLY apps
    DROP COLUMN IF EXISTS deleted;
ALTER TABLE ONLY apps
    DROP COLUMN IF EXISTS disabled;
ALTER TABLE ONLY apps
    DROP COLUMN IF EXISTS integration_data_id;
ALTER TABLE ONLY apps
    DROP COLUMN IF EXISTS integration_date;
ALTER TABLE ONLY apps
    DROP COLUMN IF EXISTS edited_date;

--
-- A view containing the top-level information needed for app listings.
--
CREATE OR REPLACE VIEW app_listing AS
    SELECT apps.id,
           apps."name",
           lower(apps."name") AS lower_case_name,
           apps.description,
           integration.integrator_name,
           integration.integrator_email,
           COALESCE(
                latest_version_undeleted.version,
                latest_version.version
           ) AS version,
           COALESCE(
                latest_version_undeleted.id,
                latest_version.id
           ) AS version_id,
           (   SELECT EVERY(deleted)
               FROM app_versions
               WHERE app_id = apps.id
           ) AS deleted,
           (   SELECT EVERY(disabled)
               FROM app_versions
               WHERE app_id = apps.id
           ) AS disabled,
           CASE WHEN latest_version_undeleted.id IS NOT NULL
                THEN latest_version_undeleted.integration_date
                ELSE latest_version.integration_date
           END AS integration_date,
           CASE WHEN latest_version_undeleted.id IS NOT NULL
                THEN latest_version_undeleted.edited_date
                ELSE latest_version.edited_date
           END AS edited_date,
           apps.wiki_url,
           (   SELECT CAST(COALESCE(AVG(rating), 0.0) AS DOUBLE PRECISION)
               FROM ratings
               WHERE app_id = apps.id
           ) AS average_rating,
           (   SELECT COUNT(rating)
               FROM ratings
               WHERE app_id = apps.id
           ) AS total_ratings,
           COUNT(steps.*) AS step_count,
           COUNT(t.tool_id) AS tool_count,
           COUNT(t.external_app_id) AS external_app_count,
           COUNT(t.id) AS task_count,
           CASE WHEN COUNT(DISTINCT tt.name) = 0 THEN 'unknown'
                WHEN COUNT(DISTINCT tt.name) > 1 THEN 'mixed'
                ELSE MAX(tt.name)
           END AS overall_job_type,
           integration.user_id AS integrator_id,
           u.username AS integrator_username,
           array_agg(tt.name) as job_types
    FROM apps
         LEFT JOIN app_versions latest_version_undeleted ON apps.id = latest_version_undeleted.app_id
              AND latest_version_undeleted.version_order = (
                  SELECT MAX(version_order)
                  FROM app_versions
                  WHERE app_id = latest_version_undeleted.app_id AND deleted = false
              )
         LEFT JOIN app_versions latest_version ON apps.id = latest_version.app_id
              AND latest_version.version_order = (
                  SELECT MAX(version_order)
                  FROM app_versions
                  WHERE app_id = latest_version.app_id
              )
         LEFT JOIN integration_data integration ON integration.id = COALESCE(
             latest_version_undeleted.integration_data_id,
             latest_version.integration_data_id
         )
         LEFT JOIN users u ON integration.user_id = u.id
         LEFT JOIN app_steps steps ON steps.app_version_id = COALESCE(
             latest_version_undeleted.id,
             latest_version.id
         )
         LEFT JOIN tasks t ON steps.task_id = t.id
         LEFT JOIN tools tool ON t.tool_id = tool.id
         LEFT JOIN tool_types tt ON tool.tool_type_id = tt.id
    GROUP BY apps.id,
             apps."name",
             apps.description,
             apps.wiki_url,
             integration.integrator_name,
             integration.integrator_email,
             integration.user_id,
             u.username,
             latest_version_undeleted.id,
             latest_version_undeleted.version,
             latest_version.id,
             latest_version.version,
             latest_version.integration_date,
             latest_version.edited_date;

--
-- A view containing the tool information needed for the app listing service.
--
CREATE OR REPLACE VIEW tool_listing AS
    SELECT row_number() OVER (ORDER BY apps.id, versions.id, steps.step) AS id,
           apps.id AS app_id,
           versions.id AS app_version_id,
           steps.step AS execution_order,
           tool.id AS tool_id,
           tool."name",
           tool.description,
           tool.location,
           tt."name" AS "type",
           tt.hidden,
           tool.version,
           tool.attribution,
           tool.container_images_id
    FROM apps
         JOIN app_versions versions ON apps.id = versions.app_id
         JOIN app_steps steps ON versions.id = steps.app_version_id
         JOIN tasks t ON steps.task_id = t.id
         JOIN tools tool ON t.tool_id = tool.id
         JOIN tool_types tt ON tool.tool_type_id = tt.id;

COMMIT;
