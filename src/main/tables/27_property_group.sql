SET search_path = public, pg_catalog;

--
-- property_group table
--
CREATE TABLE property_group (
    hid bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    label character varying(255),
    group_type character varying(255),
    is_visible boolean
);


