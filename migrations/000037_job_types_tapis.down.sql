BEGIN;

SET search_path = public, pg_catalog;

--
-- Delete the Tapis job type.
--
DELETE FROM job_types WHERE system_id = 'tapis';

COMMIT;
