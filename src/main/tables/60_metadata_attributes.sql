SET search_path = public, pg_catalog;

--
-- Stores known metadata field information.
--
CREATE TABLE metadata_attributes (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(64) NOT NULL,
    description text NOT NULL,
    required boolean NOT NULL,
    value_type_id uuid NOT NULL,
    created_by uuid NOT NULL,
    modified_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    modified_on timestamp DEFAULT now() NOT NULL
);
