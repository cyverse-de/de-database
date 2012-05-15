SET search_path = public, pg_catalog;

--
-- Name: value_type; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE value_type (
    hid bigint NOT NULL,
    id character varying(40) NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(255) NOT NULL
);
