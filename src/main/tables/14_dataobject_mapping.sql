SET search_path = public, pg_catalog;

--
-- Name: dataobject_mapping; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE dataobject_mapping (
    mapping_id bigint NOT NULL,
    input character varying(255) NOT NULL,
    output character varying(255) NOT NULL
);
