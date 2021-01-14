(ns facepalm.c2-22-0-2018061701
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180617.01")

(defn- add-planned-end-date-column
  "Adds the planned_end_date column to the jobs table."
  []
  (exec-sql-statement
   "ALTER TABLE jobs ADD COLUMN planned_end_date timestamp"))

(defn- update-job-listing-view
  "Adds the planned_end_date column to the job_listing view."
  []
  (exec-sql-statement
   "CREATE OR REPLACE VIEW job_listings AS
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
              j.planned_end_date
       FROM jobs j
       JOIN users u ON j.user_id = u.id
       JOIN job_types t ON j.job_type_id = t.id"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-planned-end-date-column)
  (update-job-listing-view))
