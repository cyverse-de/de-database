SET search_path = public, pg_catalog;

--
-- job_limits table
--
CREATE TABLE job_limits (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    launcher text default NULL,
    concurrent_jobs int NOT NULL
);
