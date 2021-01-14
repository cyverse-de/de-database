SET search_path = public, pg_catalog;

--
-- The join table for parent and child metadata attributes.
--
CREATE TABLE attr_attrs (
    parent_id uuid NOT NULL,
    child_id uuid NOT NULL,
    display_order integer NOT NULL
);

--
-- Creates an index on the parent_id column.
--
CREATE INDEX attr_attrs_parent_id
ON attr_attrs(parent_id);

--
-- Creates an index on the child_id column. For the time being, a child attribute may have at most one parent.
--
CREATE UNIQUE INDEX attr_attrs_child_id
ON attr_attrs(child_id);
