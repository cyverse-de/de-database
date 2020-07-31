(ns facepalm.c2-34-0-2020073101
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination databse version."
  "2.34.0:20200731.01")

(defn- redefine-job-view-listing
  []
  (load-sql-file "views/006_job_listing.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (redefine-job-view-listing))
