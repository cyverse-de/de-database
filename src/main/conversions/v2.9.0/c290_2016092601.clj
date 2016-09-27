(ns facepalm.c290-2016092601
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.8.0:20160712.01")

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

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-system-id-column)
  (add-task-job-type))
