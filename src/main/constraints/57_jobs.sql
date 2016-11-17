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
-- Indices on the jobs table to speed up job listing queries.
--
CREATE INDEX jobs_parent_id_index ON jobs(parent_id);
CREATE INDEX jobs_user_id_index ON jobs(user_id);
CREATE INDEX jobs_app_id_index ON jobs(app_id);
CREATE INDEX jobs_status_index ON jobs(status);
CREATE INDEX jobs_start_date_index ON jobs(start_date);
CREATE INDEX jobs_end_date_index ON jobs(end_date);
