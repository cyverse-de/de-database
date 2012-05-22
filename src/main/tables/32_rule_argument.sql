SET search_path = public, pg_catalog;

--
-- rule_argument table
--
CREATE TABLE rule_argument (
    rule_id bigint NOT NULL,
    argument_value character varying(255),
    hid integer NOT NULL
);
