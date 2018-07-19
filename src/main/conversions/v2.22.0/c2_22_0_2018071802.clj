(ns facepalm.c2-22-0-2018071802
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180718.02")

(defn- add-uid-column
  "Adds the UID column to the container_settings table."
  []
  (exec-sql-statement
   "ALTER TABLE container_settings ADD COLUMN uid int"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-uid-column))
