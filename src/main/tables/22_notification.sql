SET search_path = public, pg_catalog;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE notification (
    hid bigint NOT NULL,
    id character varying(255),
    name character varying(255),
    sender character varying(255),
    type character varying(255)
);
