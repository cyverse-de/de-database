(ns facepalm.c2-12-0-2017051001
  (:use [kameleon.sql-reader :only [exec-sql-statement]])
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.12.0:20170510.01")

(defn- add-container-images-deprecated-column
  []
  (println "\t* add deprecated column to container_images table...")
  (exec-sql-statement "ALTER TABLE ONLY container_images ADD COLUMN deprecated BOOLEAN NOT NULL DEFAULT FALSE")
  (sql/update :container_images
              (sql/set-fields {:deprecated true})
              (sql/where {:name [like "%/backwards-compat"]})))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-container-images-deprecated-column))
