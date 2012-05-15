SET search_path = public, pg_catalog;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: de
--
CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE users (
    id bigint DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    username character varying(512) NOT NULL
);
