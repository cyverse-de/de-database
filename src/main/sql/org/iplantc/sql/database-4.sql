-- guilty-party: dennis, Dennis Roberts <dennis@iplantcollaborative.org>
-- date: July 8, 2011

\set ON_ERROR_STOP ON

BEGIN;

-- place modifications and addition to the schema for Release 0.4 ASPB (version 4)

-- update the version 
UPDATE "version" SET "version" = 4;

-- set the user_id for the default workspace to ipctest rather than ana.
UPDATE "workspace" SET "user_id" = 'ipctest' WHERE "id" = 1;

-- Per CORE-2260, the de_test user should be removed as it is no longer needed.
-- (Refer to the JIRA for more information).
DELETE FROM workspace WHERE user_id = 'de_testdata@iplantcollaborative.org';

COMMIT;
