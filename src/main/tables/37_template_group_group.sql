SET search_path = public, pg_catalog;

--
-- Name: template_group_group; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE template_group_group (
    parent_group_id bigint NOT NULL,
    subgroup_id bigint NOT NULL,
    hid integer NOT NULL
);
