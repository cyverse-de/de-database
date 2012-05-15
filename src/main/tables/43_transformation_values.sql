SET search_path = public, pg_catalog;

--
-- Name: transformation_values_id_seq; Type: SEQUENCE; Schema: public; Owner: de
--
CREATE SEQUENCE transformation_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: transformation_values; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE transformation_values (
    transformation_id bigint NOT NULL,
    value character varying(255) NOT NULL,
    property character varying(255) NOT NULL,
    id bigint DEFAULT nextval('transformation_values_id_seq'::regclass) NOT NULL
);
