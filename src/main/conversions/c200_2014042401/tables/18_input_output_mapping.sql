SET search_path = public, pg_catalog;

--
-- Renames the existing dataobject_mapping table to input_output_mapping and adds updated columns.
--
ALTER TABLE dataobject_mapping RENAME TO input_output_mapping;
ALTER TABLE ONLY input_output_mapping RENAME COLUMN mapping_id TO mapping_id_v187;
ALTER TABLE ONLY input_output_mapping RENAME COLUMN input TO input_v187;
ALTER TABLE ONLY input_output_mapping RENAME COLUMN output TO output_v187;
ALTER TABLE ONLY input_output_mapping ADD COLUMN mapping_id UUID;
ALTER TABLE ONLY input_output_mapping ADD COLUMN input UUID;
ALTER TABLE ONLY input_output_mapping ADD COLUMN output UUID;

