SET search_path = public, pg_catalog;

ALTER TABLE ONLY job_limits
    ADD CONSTRAINT job_limits_launcher_unique
    UNIQUE (launcher);
