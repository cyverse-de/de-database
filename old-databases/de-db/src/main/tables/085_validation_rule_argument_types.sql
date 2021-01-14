SET search_path = public, pg_catalog;

--
-- validation_rule_argument_types table
--
CREATE TABLE validation_rule_argument_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(64) NOT NULL
);
