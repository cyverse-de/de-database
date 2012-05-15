SET search_path = public, pg_catalog;

--
-- Name: transformation_activity_references_id_seq; Type: SEQUENCE; Schema: public; Owner: de
--
CREATE SEQUENCE transformation_activity_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: transformation_activity_references; Type: TABLE; Schema: public; Owner: de;
-- Tablespace: 
--
CREATE TABLE transformation_activity_references (
    id bigint DEFAULT nextval('transformation_activity_references_id_seq'::regclass) NOT NULL,
    transformation_activity_id bigint NOT NULL,
    reference_text text NOT NULL
);
