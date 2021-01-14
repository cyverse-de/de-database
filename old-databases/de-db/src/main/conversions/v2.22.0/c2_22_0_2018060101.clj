(ns facepalm.c2-22-0-2018060101
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180601.01")

(defn- add-interactive-job-type
  "Adds a record for an interactive job type."
  []
  (exec-sql-statement
   "INSERT INTO job_types(id, name, system_id) VALUES ( 'EAD7467A-67C1-4087-90E1-F29EBF2EA084', 'Interactive', 'interactive' );"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Peforming the conversion for" version)
  (add-interactive-job-type))
