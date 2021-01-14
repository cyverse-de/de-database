(ns facepalm.c2-23-0-2018082801
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.23.0:20180828.01")

(defn- add-subdomain-column
  "Add the subdomain column to the jobs table."
  []
  (exec-sql-statement
   "ALTER TABLE jobs ADD COLUMN subdomain character varying(32)"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-subdomain-column))
