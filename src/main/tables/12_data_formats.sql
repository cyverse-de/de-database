SET search_path = public, pg_catalog;

--
-- Name: data_formats; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE SEQUENCE data_formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: data_formats; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE data_formats (
    id bigint DEFAULT nextval('data_formats_id_seq'::regclass) NOT NULL,
    guid character varying(40) NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(255),
    display_order integer DEFAULT 999
);
