BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS tools;
DROP TABLE IF EXISTS container_images;
DROP TABLE IF EXISTS tool_types;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS job_types;
DROP TABLE IF EXISTS apps;
DROP TABLE IF EXISTS integration_data;

DROP TYPE IF EXISTS notification_types;

COMMIT;
