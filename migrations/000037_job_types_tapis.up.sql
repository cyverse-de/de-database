BEGIN;

SET search_path = public, pg_catalog;

--
-- Add the Tapis job type.
--
INSERT INTO job_types (name, system_id) VALUES ('Tapis', 'tapis');

COMMIT;
