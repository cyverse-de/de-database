BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS job_limits;
DROP TABLE IF EXISTS job_status_updates;
DROP TABLE IF EXISTS job_tickets;
DROP TABLE IF EXISTS job_steps;

COMMIT;
