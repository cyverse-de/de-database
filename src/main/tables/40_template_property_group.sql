SET search_path = public, pg_catalog;

--
-- Name: template_property_group; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE template_property_group (
    template_id bigint NOT NULL,
    property_group_id bigint NOT NULL,
    hid integer NOT NULL
);
