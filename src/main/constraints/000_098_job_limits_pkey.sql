SET search_path = public, pg_catalog;

ALTER TABLE ONLY job_limits
    ADD CONSTRAINT job_limits_pkey
    PRIMARY KEY(id);
