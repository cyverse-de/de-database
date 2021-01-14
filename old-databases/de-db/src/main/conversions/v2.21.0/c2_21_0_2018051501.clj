(ns facepalm.c2-21-0-2018051501
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.21.0:20180515.01")

(defn add-skip-tmp-mount-column
  "Adds the skip_tmp_mount column to the container_settings table"
  []
  (exec-sql-statement
   "ALTER TABLE ONLY container_settings
    ADD COLUMN skip_tmp_mount bool NOT NULL DEFAULT FALSE"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-skip-tmp-mount-column))
