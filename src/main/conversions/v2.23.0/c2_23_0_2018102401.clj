(ns facepalm.c2-23-0-2018102401
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.23.0:20181024.01")

(defn- create-vice-analyses-view
  []
  (load-sql-file "views/08_vice_analyses.sql"))

(defn convert
  []
  (println "Performing the conversion for" version)
  (create-vice-analyses-view))
