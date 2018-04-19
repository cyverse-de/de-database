SET search_path = public, pg_catalog;

--
-- Foreign key constraint for for the job ID field in the job_tickets table.
--
ALTER TABLE ONLY job_tickets
    ADD CONSTRAINT job_tickets_job_id_fkey
    FOREIGN KEY (job_id)
    REFERENCES jobs(id)
    ON DELETE CASCADE;
