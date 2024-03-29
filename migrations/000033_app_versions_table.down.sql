BEGIN;

SET search_path = public, pg_catalog;

--
-- Drop views that depend on columns which will be dropped,
-- or that will change view columns.
--
DROP VIEW IF EXISTS tool_listing;
DROP VIEW IF EXISTS app_listing;
DROP VIEW IF EXISTS job_listings;

--
-- Repopulate `apps` data from `app_versions` table
--
ALTER TABLE ONLY apps
    ADD COLUMN IF NOT EXISTS deleted boolean DEFAULT false;
ALTER TABLE ONLY apps
    ADD COLUMN IF NOT EXISTS disabled boolean DEFAULT false;
ALTER TABLE ONLY apps
    ADD COLUMN IF NOT EXISTS integration_data_id uuid;
ALTER TABLE ONLY apps
    ADD COLUMN IF NOT EXISTS integration_date timestamp without time zone;
ALTER TABLE ONLY apps
    ADD COLUMN IF NOT EXISTS edited_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP;

UPDATE apps SET (
    deleted,
    disabled,
    integration_data_id,
    integration_date,
    edited_date
) = (
    SELECT
        deleted,
        disabled,
        integration_data_id,
        integration_date,
        edited_date
    FROM app_versions
    WHERE app_versions.app_id = apps.id
    ORDER BY version_order DESC
    LIMIT 1
);

ALTER TABLE ONLY apps
    ALTER COLUMN deleted SET NOT NULL;
ALTER TABLE ONLY apps
    ALTER COLUMN disabled SET NOT NULL;
ALTER TABLE ONLY apps
    ALTER COLUMN integration_data_id SET NOT NULL;

ALTER TABLE ONLY app_steps
    ADD COLUMN IF NOT EXISTS app_id uuid;
UPDATE app_steps
    SET app_id = (
        SELECT app_id
        FROM app_versions
        WHERE app_steps.app_version_id = app_versions.id
        ORDER BY version_order DESC
        LIMIT 1
    );
ALTER TABLE ONLY app_steps
    ALTER COLUMN app_id SET NOT NULL;
ALTER TABLE ONLY app_steps
    DROP COLUMN IF EXISTS app_version_id;

--
-- Foreign Key for `app_id` column in `app_steps` table.
--
ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS app_steps_app_id ON app_steps(app_id);

ALTER TABLE ONLY jobs
    DROP COLUMN IF EXISTS app_version_id;

ALTER TABLE ONLY quick_launches
    DROP COLUMN IF EXISTS app_version_id;

ALTER TABLE ONLY workflow_io_maps
    ADD COLUMN IF NOT EXISTS app_id uuid;
UPDATE workflow_io_maps
    SET app_id = (
        SELECT app_id
        FROM app_versions
        WHERE workflow_io_maps.app_version_id = app_versions.id
        ORDER BY version_order DESC
        LIMIT 1
    );
ALTER TABLE ONLY workflow_io_maps
    ALTER COLUMN app_id SET NOT NULL;
ALTER TABLE ONLY workflow_io_maps
    DROP COLUMN IF EXISTS app_version_id;

--
-- Foreign Key for `app_id` column in `workflow_io_maps` table.
--
ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS workflow_io_maps_app_id ON workflow_io_maps(app_id);

ALTER TABLE ONLY workflow_io_maps
    ADD UNIQUE (app_id, target_step, source_step);

ALTER TABLE ONLY app_documentation
    ADD COLUMN IF NOT EXISTS app_id uuid;
UPDATE app_documentation
    SET app_id = (
        SELECT app_id
        FROM app_versions
        WHERE app_documentation.app_version_id = app_versions.id
        ORDER BY version_order DESC
        LIMIT 1
    );
ALTER TABLE ONLY app_documentation
    ALTER COLUMN app_id SET NOT NULL;
ALTER TABLE ONLY app_documentation
    DROP COLUMN IF EXISTS app_version_id;

--
-- `app_documentation` table primary key.
--
ALTER TABLE app_documentation
    ADD CONSTRAINT app_documentation_pkey
    PRIMARY KEY (app_id);

--
-- Foreign Key for `app_id` column in `app_documentation` table.
--
ALTER TABLE ONLY app_documentation
    ADD CONSTRAINT app_documentation_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_references
    ADD COLUMN IF NOT EXISTS app_id uuid;
UPDATE app_references
    SET app_id = (
        SELECT app_id
        FROM app_versions
        WHERE app_references.app_version_id = app_versions.id
        ORDER BY version_order DESC
        LIMIT 1
    );
ALTER TABLE ONLY app_references
    ALTER COLUMN app_id SET NOT NULL;
ALTER TABLE ONLY app_references
    DROP COLUMN IF EXISTS app_version_id;

--
-- Foreign Key for `app_id` column in `app_references` table.
--
ALTER TABLE ONLY app_references
    ADD CONSTRAINT app_references_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS app_references_app_id ON app_references(app_id);

ALTER TABLE ONLY apps_htcondor_extra
    ADD COLUMN IF NOT EXISTS apps_id uuid;
UPDATE apps_htcondor_extra
    SET apps_id = (
        SELECT app_id
        FROM app_versions
        WHERE apps_htcondor_extra.app_version_id = app_versions.id
        ORDER BY version_order DESC
        LIMIT 1
    );
ALTER TABLE ONLY apps_htcondor_extra
    ALTER COLUMN apps_id SET NOT NULL;
ALTER TABLE ONLY apps_htcondor_extra
    DROP COLUMN IF EXISTS app_version_id;

--
-- Foreign Key for `apps_id` column in `apps_htcondor_extra` table.
--
ALTER TABLE ONLY apps_htcondor_extra
    ADD CONSTRAINT apps_htcondor_extra_apps_id_fkey
    FOREIGN KEY (apps_id)
    REFERENCES apps(id) ON DELETE CASCADE;

--
-- `apps_htcondor_extra` table primary key.
--
ALTER TABLE apps_htcondor_extra
    ADD CONSTRAINT apps_htcondor_extra_pkey
    PRIMARY KEY (apps_id);

--
-- A view containing the top-level information needed for the app listing
-- service.
--
CREATE VIEW app_listing AS
    SELECT apps.id,
           apps."name",
           lower(apps."name") AS lower_case_name,
           apps.description,
           integration.integrator_name,
           integration.integrator_email,
           apps.integration_date,
           apps.edited_date,
           apps.wiki_url,
           (   SELECT CAST(COALESCE(AVG(rating), 0.0) AS DOUBLE PRECISION)
               FROM ratings
               WHERE app_id = apps.id
           ) AS average_rating,
           (   SELECT COUNT(rating)
               FROM ratings
               WHERE app_id = apps.id
           ) AS total_ratings,
           EXISTS (
               SELECT *
               FROM app_category_app aca
               JOIN app_categories ac ON aca.app_category_id = ac.id
               JOIN workspace w ON ac.workspace_id = w.id
               WHERE apps.id = aca.app_id
               AND w.is_public IS TRUE
           ) AS is_public,
           COUNT(steps.*) AS step_count,
           COUNT(t.tool_id) AS tool_count,
           COUNT(t.external_app_id) AS external_app_count,
           COUNT(t.id) AS task_count,
           apps.deleted,
           apps.disabled,
           CASE WHEN COUNT(DISTINCT tt.name) = 0 THEN 'unknown'
                WHEN COUNT(DISTINCT tt.name) > 1 THEN 'mixed'
                ELSE MAX(tt.name)
           END AS overall_job_type,
           integration.user_id AS integrator_id,
           u.username AS integrator_username,
           array_agg(tt.name) as job_types
    FROM apps
         LEFT JOIN integration_data integration ON apps.integration_data_id = integration.id
         LEFT JOIN users u ON integration.user_id = u.id
         LEFT JOIN app_steps steps ON apps.id = steps.app_id
         LEFT JOIN tasks t ON steps.task_id = t.id
         LEFT JOIN tools tool ON t.tool_id = tool.id
         LEFT JOIN tool_types tt ON tool.tool_type_id = tt.id
    GROUP BY apps.id,
             apps."name",
             apps.description,
             integration.integrator_name,
             integration.integrator_email,
             integration.user_id,
             u.username,
             apps.integration_date,
             apps.edited_date,
             apps.wiki_url,
             apps.deleted,
             apps.disabled;

--
-- A view containing the tool information needed for the app listing service.
--
CREATE VIEW tool_listing AS
    SELECT row_number() OVER (ORDER BY apps.id, steps.step) AS id,
           apps.id AS app_id,
           apps.is_public,
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
    FROM app_listing AS apps
         JOIN app_steps steps ON apps.id = steps.app_id
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
-- app_job_types view that lists app IDs and job types.
--
CREATE OR REPLACE VIEW app_job_types AS
    SELECT
        apps.id AS app_id,
        tt.name AS job_type,
        tt.hidden
    FROM apps
        JOIN app_steps steps ON apps.id = steps.app_id
        JOIN tasks t ON steps.task_id = t.id
        JOIN tools tool ON t.tool_id = tool.id
        JOIN tool_types tt ON tool.tool_type_id = tt.id;

---
--- View containing info needed by VICE for its analysis listing.
---
CREATE OR REPLACE VIEW vice_analyses AS
      SELECT j.id,
             j.job_name,
             j.app_name,
             j.subdomain,
             j.start_date,
             j.end_date,
             j.status,
             u.id AS user_id,
             u.username,
             j.job_description,
             j.app_id,
             j.result_folder_path,
             j.planned_end_date,
             a.description AS app_description,
             a.edited_date AS app_edited_date,
             l.id AS tool_id,
             l.name AS tool_name,
             l.description AS tool_description,
             l.version AS tool_version,
             c.working_directory,
             c.entrypoint,
             c.uid,
             c.min_cpu_cores,
             c.max_cpu_cores,
             c.memory_limit,
             c.pids_limit,
             c.skip_tmp_mount,
             p.container_port,
             i.id AS image_id,
             i.name AS image_name,
             i.tag AS image_tag,
             i.url AS image_url,
             s.step
      FROM jobs j
      JOIN users u ON j.user_id = u.id
      JOIN apps a ON j.app_id = CAST(a.id as character varying)
      JOIN app_steps s ON a.id = s.app_id
      JOIN tasks k ON s.task_id = k.id
      JOIN tools l ON k.tool_id = l.id
      JOIN container_settings c ON l.id = c.tools_id
      JOIN container_images i ON l.container_images_id = i.id
      JOIN container_ports p ON c.id = p.container_settings_id
     WHERE j.deleted = false
       AND l.interactive = true
  ORDER BY s.step ASC;

--
-- A function that counts the number of apps in an app group hierarchy rooted
-- at the node with the given identifier.
--
CREATE OR REPLACE FUNCTION app_count(uuid) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE NOT a.deleted
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
$$ LANGUAGE SQL;

--
-- Another version of the same function that allows us to exclude apps
-- containing external steps.
--
CREATE OR REPLACE FUNCTION app_count(uuid, boolean) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE NOT a.deleted
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
    AND CASE
        WHEN $2 THEN TRUE
        ELSE NOT EXISTS (
            SELECT * FROM app_steps s
            JOIN tasks t ON t.id = s.task_id
            WHERE s.app_id = a.id
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
    WHERE NOT a.deleted
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
    AND a.id = ANY ($3::uuid[])
    AND CASE
        WHEN $2 THEN TRUE
        ELSE NOT EXISTS (
            SELECT * FROM app_steps s
            JOIN tasks t ON t.id = s.task_id
            WHERE s.app_id = a.id
            AND t.external_app_id IS NOT NULL
        )
    END
$$ LANGUAGE SQL;

--
-- Drop app_versions table.
--
DROP TABLE IF EXISTS app_versions;

COMMIT;
