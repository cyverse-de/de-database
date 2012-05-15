SET search_path = public, pg_catalog;

--
-- Name: suggested_groups; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE suggested_groups (
    transformation_activity_id bigint NOT NULL,
    template_group_id bigint NOT NULL
);
