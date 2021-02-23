BEGIN;

SET search_path = public, pg_catalog;

DROP VIEW IF EXISTS vice_analyses;
DROP VIEW IF EXISTS task_param_listing;
DROP VIEW IF EXISTS job_listings;
DROP VIEW IF EXISTS rating_listing;
DROP VIEW IF EXISTS tool_listing;
DROP VIEW IF EXISTS app_listing;
DROP VIEW IF EXISTS app_job_types;
DROP VIEW IF EXISTS app_category_listing;

COMMIT;
