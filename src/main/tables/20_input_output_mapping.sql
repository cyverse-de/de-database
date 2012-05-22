SET search_path = public, pg_catalog;

--
-- input_output_mapping table
--
CREATE TABLE input_output_mapping (
    hid bigint NOT NULL,
    source bigint NOT NULL,
    target bigint NOT NULL
);
