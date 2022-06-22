BEGIN;

SET search_path = public, pg_catalog;

DROP VIEW IF EXISTS app_listing;
DROP VIEW IF EXISTS app_versions_listing;

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

COMMIT;
