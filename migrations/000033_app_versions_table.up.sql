BEGIN;

SET search_path = public, pg_catalog;

--
-- Drop obsolete views that will not work with versions.
--
DROP VIEW IF EXISTS app_job_types;
DROP VIEW IF EXISTS vice_analyses;

--
-- Drop views that depend on columns which will be dropped,
-- or that will add new view columns.
--
DROP VIEW IF EXISTS tool_listing;
DROP VIEW IF EXISTS app_listing;
DROP VIEW IF EXISTS job_listings;

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
    UNIQUE (app_id, version),
    UNIQUE (app_id, version_order)
);

CREATE INDEX IF NOT EXISTS app_versions_app_id ON app_versions(app_id);

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
-- Add `app_version_id` column to the `jobs` table.
--
ALTER TABLE ONLY jobs
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE jobs
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE jobs.app_id = CAST(app_versions.app_id AS character varying)
    );

--
-- Foreign Key for `app_version_id` column in `jobs` table.
--
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS jobs_app_version_id ON jobs(app_version_id);

--
-- Add `app_version_id` column to the `quick_launches` table.
--
ALTER TABLE ONLY quick_launches
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE quick_launches
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE quick_launches.app_id = app_versions.app_id
    );
ALTER TABLE ONLY quick_launches
    ALTER COLUMN app_version_id SET NOT NULL;

--
-- Foreign Key for `app_version_id` column in `quick_launches` table.
--
ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS quick_launches_app_version_id ON quick_launches(app_version_id);

--
-- Replace the `app_id` column in the `workflow_io_maps` table
-- with a new `app_version_id` column.
--
ALTER TABLE ONLY workflow_io_maps
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE workflow_io_maps
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE workflow_io_maps.app_id = app_versions.app_id
    );
ALTER TABLE ONLY workflow_io_maps
    ALTER COLUMN app_version_id SET NOT NULL;
ALTER TABLE ONLY workflow_io_maps
    DROP COLUMN IF EXISTS app_id;

--
-- Foreign Key for `app_version_id` column in `workflow_io_maps` table.
--
ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS workflow_io_maps_app_version_id ON workflow_io_maps(app_version_id);

ALTER TABLE ONLY workflow_io_maps
    ADD UNIQUE (app_version_id, target_step, source_step);

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
-- Replace the `apps_id` column in the `apps_htcondor_extra` table
-- with a new `app_version_id` column.
--
ALTER TABLE ONLY apps_htcondor_extra
    ADD COLUMN IF NOT EXISTS app_version_id uuid;
UPDATE apps_htcondor_extra
    SET app_version_id = (
        SELECT id
        FROM app_versions
        WHERE apps_htcondor_extra.apps_id = app_versions.app_id
    );
ALTER TABLE ONLY apps_htcondor_extra
    ALTER COLUMN app_version_id SET NOT NULL;
ALTER TABLE ONLY apps_htcondor_extra
    DROP COLUMN IF EXISTS apps_id;

--
-- `apps_htcondor_extra` table primary key.
--
ALTER TABLE apps_htcondor_extra
    ADD CONSTRAINT apps_htcondor_extra_pkey
    PRIMARY KEY (app_version_id);

--
-- Foreign Key for `app_version_id` column in `apps_htcondor_extra` table.
--
ALTER TABLE ONLY apps_htcondor_extra
    ADD CONSTRAINT apps_htcondor_extra_app_version_id_fkey
    FOREIGN KEY (app_version_id)
    REFERENCES app_versions(id) ON DELETE CASCADE;

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
CREATE VIEW app_listing AS
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
CREATE VIEW tool_listing AS
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

--
-- A view containing the job information needed to produce a job listing.
--
CREATE VIEW job_listings AS
    SELECT j.id,
           j.job_name,
           j.app_name,
           j.start_date,
           j.end_date,
           j.status,
           j.deleted,
           j.notify,
           u.username,
           j.job_description,
           j.app_id,
           j.app_version_id,
           j.app_wiki_url,
           j.app_description,
           j.result_folder_path,
           j.submission,
           t.name AS job_type,
           j.parent_id,
           EXISTS (
               SELECT * FROM jobs child
               WHERE child.parent_id = j.id
           ) AS is_batch,
           t.system_id,
           j.planned_end_date,
           j.user_id
    FROM jobs j
    JOIN users u ON j.user_id = u.id
    JOIN job_types t ON j.job_type_id = t.id;

--
-- A function that counts the number of apps in an app group hierarchy rooted
-- at the node with the given identifier.
--
CREATE OR REPLACE FUNCTION app_count(uuid) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE EXISTS (
        SELECT deleted
        FROM app_versions v
        WHERE v.app_id = a.id
        AND v.deleted IS FALSE
    )
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
$$ LANGUAGE SQL;

--
-- Another version of the same function that allows us to exclude apps
-- containing external steps.
--
CREATE OR REPLACE FUNCTION app_count(uuid, boolean) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE EXISTS (
        SELECT deleted
        FROM app_versions v
        WHERE v.app_id = a.id
        AND v.deleted IS FALSE
    )
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
    AND CASE
        WHEN $2 THEN TRUE
        ELSE NOT EXISTS (
            SELECT * FROM app_steps s
            JOIN tasks t ON t.id = s.task_id
            JOIN app_versions v ON s.app_version_id = v.id
            WHERE v.app_id = a.id
            AND t.external_app_id IS NOT NULL
        )
    END
$$ LANGUAGE SQL;

--
-- Yet another version of the same function that allows us to limit the
-- count to certain app IDs.
--
CREATE OR REPLACE FUNCTION app_count(uuid, boolean, anyarray) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE EXISTS (
        SELECT deleted
        FROM app_versions v
        WHERE v.app_id = a.id
        AND v.deleted IS FALSE
    )
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
    AND a.id = ANY ($3::uuid[])
    AND CASE
        WHEN $2 THEN TRUE
        ELSE NOT EXISTS (
            SELECT * FROM app_steps s
            JOIN tasks t ON t.id = s.task_id
            JOIN app_versions v ON s.app_version_id = v.id
            WHERE v.app_id = a.id
            AND t.external_app_id IS NOT NULL
        )
    END
$$ LANGUAGE SQL;

COMMIT;
