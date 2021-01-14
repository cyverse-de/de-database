(ns facepalm.c2-24-0-2019011401
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.24.0:20190114.01")

(defn- add-sessions-tables
  []
  (load-sql-file "tables/087_vice_sessions.sql"))

(defn- add-constraints
  []
  (load-sql-file "constraints/000_087_vice_sessions.sql"))

(defn convert
  []
  (println "Performing the conversion for" version)
  (add-sessions-tables)
  (add-constraints))
