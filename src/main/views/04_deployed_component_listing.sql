SET search_path = public, pg_catalog;

--
-- Name: deployed_component_listing; Type: VIEW; Schema: public; Owner: de
--
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
