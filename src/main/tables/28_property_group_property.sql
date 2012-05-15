SET search_path = public, pg_catalog;

--
-- Name: property_group_property; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE property_group_property (
    property_group_id bigint NOT NULL,
    property_id bigint NOT NULL,
    hid integer NOT NULL
);
