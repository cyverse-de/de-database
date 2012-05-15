SET search_path = public, pg_catalog;

--
-- Name: transformation_activity_mappings; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE transformation_activity_mappings (
    transformation_activity_id bigint NOT NULL,
    mapping_id bigint NOT NULL,
    hid integer NOT NULL
);
