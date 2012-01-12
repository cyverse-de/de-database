-- guilty-party: lenards, Andrew Lenards <lenards@iplantcollaborative.org>
-- date: April 28, 2010

\set ON_ERROR_STOP ON

BEGIN;

-- place modifications and addition to the schema for Release 0.4 (version 3)

-- update the version 
UPDATE "version" SET "version" = 3;

COMMIT;
