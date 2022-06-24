BEGIN;

SET search_path = public, pg_catalog;

--
-- A view containing the top-level information needed for app version listings.
--
CREATE OR REPLACE VIEW app_versions_listing AS
    SELECT apps.id,
           apps."name",
           apps.description,
           apps.wiki_url,
           integration.integrator_name,
           integration.integrator_email,
           v.id AS version_id,
           v.version,
           v.version_order,
           v.deleted,
           v.disabled,
           v.integration_date,
           v.edited_date,
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
         LEFT JOIN app_versions v ON apps.id = v.app_id
         LEFT JOIN integration_data integration ON integration.id = v.integration_data_id
         LEFT JOIN users u ON integration.user_id = u.id
         LEFT JOIN app_steps steps ON steps.app_version_id = v.id
         LEFT JOIN tasks t ON steps.task_id = t.id
         LEFT JOIN tools tool ON t.tool_id = tool.id
         LEFT JOIN tool_types tt ON tool.tool_type_id = tt.id
    GROUP BY apps.id,
             integration.integrator_name,
             integration.integrator_email,
             integration.user_id,
             u.username,
             v.id;

COMMIT;
