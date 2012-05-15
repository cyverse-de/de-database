SET search_path = public, pg_catalog;

--
-- Name: integration_data_id_seq; Type: SEQUENCE; Schema: public; Owner: de
--
CREATE SEQUENCE integration_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: integration_data; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE integration_data (
    id bigint DEFAULT nextval('integration_data_id_seq'::regclass) NOT NULL,
    integrator_name character varying(255),
    integrator_email character varying(255)
);


