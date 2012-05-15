SET search_path = public, pg_catalog;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: de
--
CREATE SEQUENCE ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- Name: ratings; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE ratings (
    id bigint DEFAULT nextval('ratings_id_seq'::regclass) NOT NULL,
    user_id bigint,
    transformation_activity_id bigint,
    rating integer NOT NULL,
    comment_id bigint
);
