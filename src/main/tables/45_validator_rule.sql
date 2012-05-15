SET search_path = public, pg_catalog;

--
-- Name: validator_rule; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE validator_rule (
    validator_id bigint NOT NULL,
    rule_id bigint NOT NULL,
    id integer NOT NULL
);
