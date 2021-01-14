SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the job_id field of the job_steps table.
--
ALTER TABLE ONLY job_steps
    ADD CONSTRAINT job_steps_job_id_fkey
    FOREIGN KEY (job_id)
    REFERENCES jobs(id);

--
-- Foreign key constraint for the type_type_id field of the job_steps table.
--
ALTER TABLE ONLY job_steps
    ADD CONSTRAINT job_steps_job_type_id_fkey
    FOREIGN KEY (job_type_id)
    REFERENCES job_types(id);
