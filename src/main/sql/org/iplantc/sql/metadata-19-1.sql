\set ON_ERROR_STOP ON

BEGIN;

-- A view containing the top-level information needed for the analysis group listing service.
CREATE VIEW analysis_group_listing AS
    SELECT g.hid,
           g.id,
           g."name",
           g.description,
           g.workspace_id,
           w.is_public
    FROM template_group g
         LEFT JOIN workspace w ON g.workspace_id = w.id;

-- A view containing the top-level information needed for the analysis listing service.
CREATE VIEW analysis_listing AS
    SELECT analysis.hid,
           analysis.id,
           analysis."name",
           analysis.description,
           integration.integrator_name,
           integration.integrator_email,
           analysis.integration_date,
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
           ) AS step_count
    FROM transformation_activity analysis
         LEFT JOIN integration_data integration ON analysis.integration_data_id = integration.id
         LEFT JOIN ratings ON analysis.hid = ratings.transformation_activity_id
    WHERE analysis.deleted IS FALSE
    GROUP BY analysis.hid,
             analysis.id,
             analysis."name",
             analysis.description,
             integration.integrator_name,
             integration.integrator_email,
             analysis.integration_date,
             analysis.wikiurl;

-- A view containing the analysis rating information needed for the analysis listing service.
CREATE VIEW rating_listing AS
    SELECT row_number() OVER (ORDER BY analysis.hid, u.id) AS id,
           analysis.hid AS analysis_id,
           u.id AS user_id,
           ur.rating AS user_rating
    FROM transformation_activity analysis
         CROSS JOIN users u
         LEFT JOIN ratings ur ON analysis.hid = ur.transformation_activity_id AND ur.user_id = u.id;

-- A view containing the deployed component information needed for the analysis listing service.
CREATE VIEW deployed_component_listing AS
    SELECT row_number() OVER (ORDER BY analysis.hid, tts.hid) AS id,
           analysis.hid AS analysis_id,
           tts.hid AS execution_order,
           dc.hid AS deployed_component_hid,
           dc.id AS deployed_component_id,
           dc."name",
           dc.description,
           dc.location,
           dc."type",
           dc.version,
           dc.attribution
    FROM transformation_activity analysis
         JOIN transformation_task_steps tts ON analysis.hid = tts.transformation_task_id
         JOIN transformation_steps ts ON tts.transformation_step_id = ts.id
         JOIN transformations tx ON ts.transformation_id = tx.id
         JOIN template t ON tx.template_id = t.id
         JOIN deployed_components dc ON t.component_id = dc.id;

COMMIT;
