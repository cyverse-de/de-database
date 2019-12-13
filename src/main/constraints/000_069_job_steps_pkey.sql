SET search_path = public, pg_catalog;

--
-- The primary key for the job_steps table.
--
ALTER TABLE ONLY job_steps
    ADD CONSTRAINT job_steps_pkey
    PRIMARY KEY (job_id, step_number);
