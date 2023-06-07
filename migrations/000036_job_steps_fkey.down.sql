BEGIN;

SET search_path = public, pg_catalog;

--
-- Remove the foreign key if it already exists.
--
ALTER TABLE IF EXISTS job_steps
    DROP CONSTRAINT job_steps_job_id_fkey;

--
-- Add the foreign key back to the table without the cascade.
--
ALTER TABLE IF EXISTS job_steps
    ADD CONSTRAINT job_steps_job_id_fkey
    FOREIGN KEY (job_id)
    REFERENCES jobs (id);

COMMIT;
