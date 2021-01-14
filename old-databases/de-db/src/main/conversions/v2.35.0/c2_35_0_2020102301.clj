(ns facepalm.c2-35-0-2020102301
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination databse version."
  "2.35.0:20201023.01")

(defn- add-jobs-app-id-start-date-index
  []
  (load-sql-file "constraints/005_apps.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-jobs-app-id-start-date-index))
