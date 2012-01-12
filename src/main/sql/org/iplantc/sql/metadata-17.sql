\set ON_ERROR_STOP ON

BEGIN;

-- Add a column for file retention policy.  All outputs are retained by default; all inputs are not.
ALTER TABLE dataobjects ADD COLUMN retain BOOLEAN DEFAULT FALSE;
UPDATE dataobjects d SET retain = TRUE
    WHERE EXISTS (
        SELECT * FROM template_output t
        WHERE t.output_id = d.hid
    );

COMMIT;
