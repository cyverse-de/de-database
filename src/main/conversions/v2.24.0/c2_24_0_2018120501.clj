(ns facepalm.c2-24-0-2018120501
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.24.0:20181205.01")

(defn- update-vice-analyses-view
  []
  (load-sql-file "views/008_vice_analyses.sql"))

(defn- add-app-steps-indices
  []
  (load-sql-file "constraints/007_app_steps.sql"))

(defn convert
  []
  (println "Performing the conversion for" version)
  (update-vice-analyses-view)
  (add-app-steps-indices))
