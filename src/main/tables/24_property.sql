SET search_path = public, pg_catalog;

--
-- property table
--
CREATE TABLE property (
    hid bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    label character varying(255),
    defalut_value character varying(255),
    is_visible boolean,
    ordering integer,
    property_type bigint,
    validator bigint,
    dataobject_id bigint,
    omit_if_blank boolean DEFAULT true
);
