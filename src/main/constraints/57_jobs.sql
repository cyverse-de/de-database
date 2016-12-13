SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the user_id field of the jobs table.
--
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

--
-- Foreign key constraint for the parent_id field of the jobs table.
--
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_parent_id_fkey
    FOREIGN KEY (parent_id)
    REFERENCES jobs(id);

--
-- Foreign key constraint for the job_type_id field of the jobs table.
--
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_job_type_id_fkey
    FOREIGN KEY (job_type_id)
    REFERENCES job_types(id);
