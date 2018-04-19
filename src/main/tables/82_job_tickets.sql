SET search_path = public, pg_catalog;

--
-- Records iRODS tickets that were generated for DE jobs.
--
CREATE TABLE job_tickets(
   job_id uuid NOT NULL,
   ticket varchar(100) NOT NULL,
   irods_path text NOT NULL,
   deleted boolean DEFAULT FALSE,
   primary key (job_id, ticket)
);

--
-- An index on the job_id field of the job_tickets table.
--
CREATE INDEX IF NOT EXISTS job_tickets_job_id_index
    ON job_tickets (job_id);
