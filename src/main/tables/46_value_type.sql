SET search_path = public, pg_catalog;

--
-- A table to store value types associated with various property types.
--
CREATE TABLE value_type (
    hid bigint NOT NULL,
    id character varying(40) NOT NULL,
    name character varying(40) NOT NULL,
    description character varying(255) NOT NULL
);
