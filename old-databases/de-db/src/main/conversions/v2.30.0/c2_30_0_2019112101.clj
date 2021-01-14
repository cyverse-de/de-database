(ns facepalm.c2-30-0-2019112101
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.30.0:20191121.01")

(defn- add-job-limits-table []
  (load-sql-file "tables/098_job_limits.sql")
  (load-sql-file "constraints/000_098_job_limits_pkey.sql")
  (load-sql-file "constraints/098_job_limits.sql")
  (load-sql-file "data/098_job_limits.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-job-limits-table))
