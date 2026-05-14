BEGIN;

SET search_path = public, pg_catalog;

--
-- The base URL of the VICE landing/loading domain for analyses launched on
-- this operator (e.g. https://sandbox.cyverse.rocks). Nullable: pre-existing
-- rows have no value and consumers fall back to a static default. New
-- operators are required to supply one at creation time.
--
ALTER TABLE IF EXISTS ONLY operators
    ADD COLUMN IF NOT EXISTS base_url text CHECK (base_url ~ '\S');

--
-- Recreate the job listing view to expose operator_id so consumers can join
-- to the operators table and resolve the per-operator base URL. operator_id
-- is appended at the end of the select list so CREATE OR REPLACE is valid.
--
CREATE OR REPLACE VIEW job_listings AS
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
               SELECT * FROM jobs child
               WHERE child.parent_id = j.id
           ) AS is_batch,
           t.system_id,
           j.planned_end_date,
           j.user_id,
           j.operator_id
    FROM jobs j
    JOIN users u ON j.user_id = u.id
    JOIN job_types t ON j.job_type_id = t.id;

COMMIT;
