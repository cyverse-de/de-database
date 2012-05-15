SET search_path = public, pg_catalog;

--
-- Name: rule_argument; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE rule_argument (
    rule_id bigint NOT NULL,
    argument_value character varying(255),
    hid integer NOT NULL
);
