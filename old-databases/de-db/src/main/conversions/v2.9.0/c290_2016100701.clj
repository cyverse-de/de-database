(ns facepalm.c290-2016100701
    (:use [kameleon.sql-reader :only [exec-sql-statement load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.9.0:20161007.01")

(defn- add-jobs-indexes
  "Updates the app_listing view."
  []
  (println "\t* adding additional indexes to jobs table...")
  (exec-sql-statement "CREATE INDEX jobs_app_id_index ON jobs(app_id)")
  (exec-sql-statement "CREATE INDEX jobs_status_index ON jobs(status)")
  (exec-sql-statement "CREATE INDEX jobs_start_date_index ON jobs(start_date)")
  (exec-sql-statement "CREATE INDEX jobs_end_date_index ON jobs(end_date)"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-jobs-indexes))
