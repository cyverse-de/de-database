\set ON_ERROR_STOP ON

BEGIN;

-- Add edited_date column for transformation_activity.
ALTER TABLE transformation_activity ADD COLUMN edited_date TIMESTAMP;

-- Drop and re-create the analysis listing view, including the edited_date and the overall job type.
DROP VIEW analysis_listing;
CREATE VIEW analysis_listing AS
    SELECT analysis.hid,
           analysis.id,
           analysis."name",
           analysis.description,
           integration.integrator_name,
           integration.integrator_email,
           analysis.integration_date,
           analysis.edited_date,
           analysis.wikiurl,
           CAST(COALESCE(AVG(ratings.rating), 0.0) AS DOUBLE PRECISION) AS average_rating,
           EXISTS (
               SELECT *
               FROM template_group_template tgt
               JOIN template_group tg ON tgt.template_group_id = tg.hid
               JOIN workspace w ON tg.workspace_id = w.id
               WHERE analysis.hid = tgt.template_id
               AND w.is_public IS TRUE
           ) AS is_public, (
               SELECT COUNT(*)
               FROM transformation_task_steps tts
               WHERE tts.transformation_task_id = analysis.hid
           ) AS step_count,
           analysis.deleted,
           analysis.disabled,
           CASE WHEN COUNT(DISTINCT dc."type") = 0 THEN 'unknown'
                WHEN COUNT(DISTINCT dc."type") > 1 THEN 'mixed'
                ELSE MAX(dc."type")
           END AS overall_job_type
    FROM transformation_activity analysis
         LEFT JOIN integration_data integration ON analysis.integration_data_id = integration.id
         LEFT JOIN ratings ON analysis.hid = ratings.transformation_activity_id
         LEFT JOIN transformation_task_steps tts ON analysis.hid = tts.transformation_task_id
         LEFT JOIN transformation_steps ts ON tts.transformation_step_id = ts.id
         LEFT JOIN transformations tx ON ts.transformation_id = tx.id
         LEFT JOIN template t ON tx.template_id = t.id
         LEFT JOIN deployed_components dc ON t.component_id = dc.id
    GROUP BY analysis.hid,
             analysis.id,
             analysis."name",
             analysis.description,
             integration.integrator_name,
             integration.integrator_email,
             analysis.integration_date,
             analysis.edited_date,
             analysis.wikiurl,
             analysis.deleted,
             analysis.disabled;

-- Create a separate view that lists analysis IDs and job types.
CREATE VIEW analysis_job_types AS
    SELECT a.hid AS analysis_id,
           dc.type AS job_type
    FROM transformation_activity a
        JOIN transformation_task_steps tts ON a.hid = tts.transformation_task_id
        JOIN transformation_steps ts ON tts.transformation_step_id = ts.id
        JOIN transformations tx ON ts.transformation_id = tx.id
        JOIN template t ON tx.template_id::text = t.id::text
        JOIN deployed_components dc ON t.component_id::text = dc.id::text;

COMMIT;
