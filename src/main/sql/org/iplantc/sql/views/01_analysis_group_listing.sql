SET search_path = public, pg_catalog;

--
-- analysis_group_listing view
--
CREATE VIEW analysis_group_listing AS
    SELECT
        g.hid,
        g.id,
        g.name,
        g.description,
        g.workspace_id,
        w.is_public
    FROM (template_group g LEFT JOIN workspace w ON ((g.workspace_id = w.id)));

