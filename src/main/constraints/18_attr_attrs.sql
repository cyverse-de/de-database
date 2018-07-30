SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the parent_id field of the attr_attrs table.
--
ALTER TABLE ONLY attr_attrs
ADD CONSTRAINT attr_attrs_parent_id_fkey
FOREIGN KEY (parent_id)
REFERENCES attributes(id) ON DELETE CASCADE;

--
-- Foreign key constraint for the child_id field of the attr_attrs table.
--
ALTER TABLE ONLY attr_attrs
ADD CONSTRAINT attr_attrs_child_id_fkey
FOREIGN KEY (child_id)
REFERENCES attributes(id) ON DELETE CASCADE;

--
-- Check constraint to avoid cyclical hierarchies.
--
ALTER TABLE ONLY attr_attrs
ADD CONSTRAINT attr_attrs_parent_different_from_child
CHECK (parent_id != child_id);
