(ns facepalm.c2-22-0-2018060401
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180604.01")

(defn- alter-min-cpu-cores-column
  "Changes the type for the container_settings.min_cpu_cores column from integer to decimal(6,3)."
  []
  (exec-sql-statement
   "ALTER TABLE container_settings ALTER COLUMN min_cpu_cores TYPE decimal(6,3)"))

(defn- add-max-cpu-cores-column
  "Adds the max-cpus-cores column to the container_settings table."
  []
  (exec-sql-statement
   "ALTER TABLE container_settings ADD COLUMN max_cpu_cores decimal(6,3)"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Peforming the conversion for" version)
  (alter-min-cpu-cores-column)
  (add-max-cpu-cores-column))
