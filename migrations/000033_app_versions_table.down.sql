BEGIN;

SET search_path = public, pg_catalog;

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

--
-- A view containing the top-level information needed for the app listing
-- service.
--
CREATE OR REPLACE VIEW app_listing AS
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
CREATE OR REPLACE VIEW tool_listing AS
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
-- Drop app_versions table.
--
DROP TABLE IF EXISTS app_versions;

COMMIT;
