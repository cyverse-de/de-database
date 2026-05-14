BEGIN;

SET search_path = public, pg_catalog;

--
-- Restore the job listing view without operator_id. CREATE OR REPLACE cannot
-- drop a column, so the view is dropped and recreated. Nothing else depends
-- on job_listings, so no CASCADE is needed.
--
-- The is_batch subquery uses SELECT 1 rather than SELECT * so the recreated
-- view does not capture a frozen dependency on jobs.operator_id (which still
-- exists at this point). A SELECT * here would expand to include operator_id
-- and block migration 000048's down step from dropping that column.
--
DROP VIEW IF EXISTS job_listings;

CREATE VIEW job_listings AS
    SELECT j.id,
           j.job_name,
           j.app_name,
           j.start_date,
           j.end_date,
           j.status,
           j.deleted,
           j.notify,
           u.username,
           j.job_description,
           j.app_id,
           j.app_version_id,
           j.app_wiki_url,
           j.app_description,
           j.result_folder_path,
           j.submission,
           t.name AS job_type,
           j.parent_id,
           EXISTS (
               SELECT 1 FROM jobs child
               WHERE child.parent_id = j.id
           ) AS is_batch,
           t.system_id,
           j.planned_end_date,
           j.user_id
    FROM jobs j
    JOIN users u ON j.user_id = u.id
    JOIN job_types t ON j.job_type_id = t.id;

ALTER TABLE IF EXISTS ONLY operators
    DROP COLUMN IF EXISTS base_url;

COMMIT;
