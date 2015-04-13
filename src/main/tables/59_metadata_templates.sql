SET search_path = public, pg_catalog;

--
-- Stores a list of metadata templates.
--
CREATE TABLE metadata_templates (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(64) NOT NULL,
    deleted boolean DEFAULT FALSE NOT NULL,
    created_by uuid NOT NULL,
    modified_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    modified_on timestamp DEFAULT now() NOT NULL
);
