(ns facepalm.c2-10-0-2016120501
  (:use [kameleon.sql-reader :only [load-sql-file]])
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.10.0:20161205.01")

(defn- add-system-id-column
  "Adds the system ID to the job_types table."
  []
  (println "\t* adding the system ID to the job_types table")
  (sql/exec-raw "ALTER TABLE ONLY job_types ADD COLUMN system_id character varying(36)")
  (sql/update :job_types
              (sql/set-fields {:system_id "de"})
              (sql/where {:name "DE"}))
  (sql/update :job_types
              (sql/set-fields {:system_id "agave"})
              (sql/where {:name "Agave"}))
  (sql/exec-raw "ALTER TABLE ONLY job_types ALTER COLUMN system_id SET NOT NULL"))

(defn- job-type-id-subselect [system-id]
  (sql/subselect :job_types
                 (sql/fields :id)
                 (sql/where {:system_id system-id})))

(defn- add-task-job-type
  "Adds a foreign key linking the tasks table with the job_types table."
  []
  (println "\t* adding job types to the tasks table")
  (sql/exec-raw "ALTER TABLE ONLY tasks ADD COLUMN job_type_id UUID")
  (sql/exec-raw (str "ALTER TABLE ONLY tasks ADD CONSTRAINT tasks_job_type_id_fk "
                     " FOREIGN KEY (job_type_id) REFERENCES job_types(id)"))
  (sql/update :tasks
              (sql/set-fields {:job_type_id (job-type-id-subselect "de")})
              (sql/where {:tool_id [not= nil]}))
  (sql/update :tasks
              (sql/set-fields {:job_type_id (job-type-id-subselect "agave")})
              (sql/where {:tool_id [= nil]}))
  (sql/exec-raw "ALTER TABLE ONLY tasks ALTER COLUMN job_type_id SET NOT NULL"))

(defn- populate-job-types-statement
  "Returns the SQL statement to use when populating the jobs table with job types."
  []
  "UPDATE jobs SET job_type_id = (
       SELECT CASE
           WHEN count(DISTINCT t.id) != 1 THEN (SELECT id FROM job_types WHERE system_id = 'de')
           ELSE first(t.id) END AS system_id
       FROM job_steps s JOIN job_types t ON s.job_type_id = t.id
       WHERE s.job_id = jobs.id)")

(defn- update-jobs-table
  "Adds the job_type_id column to the jobs table."
  []
  (println "\t* adding the job_type_id column to the jobs table")
  (sql/exec-raw "ALTER TABLE ONLY jobs ADD COLUMN job_type_id UUID")
  (sql/exec-raw (str "ALTER TABLE ONLY jobs ADD CONSTRAINT jobs_job_type_id_fkey "
                     "FOREIGN KEY (job_type_id) REFERENCES job_types(id)"))
  (sql/exec-raw (populate-job-types-statement))
  (sql/exec-raw "ALTER TABLE ONLY jobs ALTER COLUMN job_type_id SET NOT NULL"))

(defn- update-job-listings-view
  "Updates the job_listings view."
  []
  (println "\t* updating the job_listings view")
  (sql/exec-raw "DROP VIEW job_listings")
  (load-sql-file "views/006_job_listing.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-system-id-column)
  (add-task-job-type)
  (update-jobs-table)
  (update-job-listings-view))
