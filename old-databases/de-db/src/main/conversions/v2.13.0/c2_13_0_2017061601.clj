(ns facepalm.c2-13-0-2017061601
    (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.13.0:20170616.01")

(defn- add-container-settings-pids-limit
  "Updates the app_listing view."
  []
  (println "\t* adding pids_limit column to container_settings table...")
  (exec-sql-statement "ALTER TABLE ONLY container_settings ADD COLUMN pids_limit INTEGER"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-container-settings-pids-limit))
