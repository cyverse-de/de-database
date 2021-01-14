(ns facepalm.c2-12-0-2017050801
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.12.0:20170508.01")

(defn- add-min-memory-limit-column
  []
  (println "\t* add the container_settings.min_memory_limit column")
  (sql/exec-raw "ALTER TABLE ONLY container_settings ADD COLUMN min_memory_limit bigint"))

(defn- add-min-cpu-cores
  []
  (println "\t* add the container_settings.min_cpu_cores column")
  (sql/exec-raw "ALTER TABLE ONLY container_settings ADD COLUMN min_cpu_cores integer"))

(defn- add-min-disk-space
  []
  (println "\t* add the container_settings.min_disk_space column")
  (sql/exec-raw "ALTER TABLE ONLY container_settings ADD COLUMN min_disk_space bigint"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-min-memory-limit-column)
  (add-min-cpu-cores)
  (add-min-disk-space))
