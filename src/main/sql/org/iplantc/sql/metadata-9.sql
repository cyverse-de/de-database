\set ON_ERROR_STOP ON

BEGIN;

-- Add a new column to indicate whether a property should be omitted if if
-- its value is blank.
ALTER TABLE property ADD COLUMN omit_if_blank BOOLEAN DEFAULT TRUE;

COMMIT;
