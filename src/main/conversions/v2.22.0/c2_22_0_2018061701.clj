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

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-planned-end-date-column))
