(ns facepalm.c2-29-0-2019091701
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.29.0:20190917.01")

(defn- add-jstaa-index
  []
  (exec-sql-statement
   "CREATE INDEX job_status_updates_unpropagated_with_external_id
ON job_status_updates (propagated, propagation_attempts, external_id)
WHERE propagated = false;"))

(defn- drop-old-test-index
  []
  (exec-sql-statement
   "DROP INDEX IF EXISTS mian_test;"))

(defn convert
  []
  (println "Performing the conversion to" version)
  (add-jstaa-index)
  (drop-old-test-index))
