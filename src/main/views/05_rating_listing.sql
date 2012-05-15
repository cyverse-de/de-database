SET search_path = public, pg_catalog;

--
-- Name: rating_listing; Type: VIEW; Schema: public; Owner: de
--
CREATE VIEW rating_listing AS
    SELECT row_number() OVER (ORDER BY analysis.hid, u.id) AS id,
           analysis.hid AS analysis_id,
           u.id AS user_id,
           ur.rating AS user_rating
    FROM transformation_activity analysis
         CROSS JOIN users u
         LEFT JOIN ratings ur
              ON analysis.hid = ur.transformation_activity_id
              AND ur.user_id = u.id;
