SET search_path = public, pg_catalog;

--
-- Name: validator; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE validator (
    hid bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    label character varying(255),
    required boolean DEFAULT false
);
