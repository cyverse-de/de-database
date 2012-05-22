SET search_path = public, pg_catalog;

--
-- A table to store rule subtypes.
--
CREATE TABLE rule_subtype (
    hid bigint NOT NULL,
    id character varying(40) NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(255) NOT NULL
);
