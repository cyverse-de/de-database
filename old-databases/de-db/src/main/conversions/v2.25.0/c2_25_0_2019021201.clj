(ns facepalm.c2-25-0-2019021201
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.25.0:20190212.01")

(defn- drop-collaborators-table []
  (exec-sql-statement "DROP TABLE collaborators"))

(defn convert
  []
  (println "Performing the conversion for" version)
  (drop-collaborators-table))
