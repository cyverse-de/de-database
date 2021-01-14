SET search_path = public, pg_catalog;

--
-- The primary key for the jobs table.
--
ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey
    PRIMARY KEY (id);
