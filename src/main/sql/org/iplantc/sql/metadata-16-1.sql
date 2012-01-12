\set ON_ERROR_STOP ON

BEGIN;

-- Delete the analysis, Convert GFF to GTF.
UPDATE transformation_activity
    SET deleted = TRUE
    WHERE "name" = 'Convert GFF to GTF';

COMMIT;
