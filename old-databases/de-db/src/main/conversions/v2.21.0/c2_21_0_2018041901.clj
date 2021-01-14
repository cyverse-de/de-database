(ns facepalm.c2-21-0-2018041901
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version."
  "2.21.0:20180419.01")

(defn- add-job-tickets-table
  "Adds the job_tickets table to the database."
  []
  (load-sql-file "tables/082_job_tickets.sql")
  (load-sql-file "constraints/082_job_tickets.sql"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-job-tickets-table))
