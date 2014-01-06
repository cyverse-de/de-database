SET search_path = public, pg_catalog;

--
-- Stores known metadata field information.
--
CREATE TABLE metadata_attributes (
    id uuid NOT NULL,
    template_id uuid NOT NULL REFERENCES metadata_templates(id),
    name varchar(64) NOT NULL,
    description varchar(1024) NOT NULL,
    required boolean NOT NULL,
    display_order integer NOT NULL,
    value_type_id uuid NOT NULL REFERENCES metadata_value_types(id),
    PRIMARY KEY (id)
);

--
-- Creates an index on the template_id column.
--
CREATE INDEX metadata_attributes_template_id
ON metadata_attributes(template_id);
