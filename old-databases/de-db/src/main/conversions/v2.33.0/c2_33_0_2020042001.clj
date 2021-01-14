(ns facepalm.c2-33-0-2020042001
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.33.0:20200420.01")

(defn- add-async-task-status-detail-column
  []
  (exec-sql-statement
   "ALTER TABLE async_task_status ADD COLUMN detail text"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-async-task-status-detail-column))
