SET search_path = public, pg_catalog;

--
-- Name: deployed_component_data_files_id_seq; Type: SEQUENCE; Schema: public; Owner: de
--
CREATE SEQUENCE deployed_component_data_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: deployed_component_data_files; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE deployed_component_data_files (
    id bigint DEFAULT nextval('deployed_component_data_files_id_seq'::regclass) NOT NULL,
    filename character varying(1024) NOT NULL,
    input_file boolean DEFAULT true,
    deployed_component_id bigint
);
