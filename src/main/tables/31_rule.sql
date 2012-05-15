SET search_path = public, pg_catalog;

--
-- Name: rule; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE rule (
    hid bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    label character varying(255),
    rule_type bigint
);
