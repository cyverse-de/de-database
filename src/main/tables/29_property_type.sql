SET search_path = public, pg_catalog;

--
-- property_type table
--
CREATE TABLE property_type (
    hid bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    label character varying(255),
    deprecated boolean DEFAULT false,
    display_order integer DEFAULT 999,
    value_type_id bigint
);
