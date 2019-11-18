(ns facepalm.c2-30-0-2019111801
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.30.0:20191118.01")

(defn- add-gpu-enabled-column
  []
  (exec-sql-statement
   "ALTER TABLE tools ADD COLUMN gpu_enabled boolean NOT NULL DEFAULT FALSE"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-gpu-enabled-column))