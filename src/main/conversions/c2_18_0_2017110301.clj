(ns facepalm.c2-18-0-2017110301
  (:use [korma.core :only [exec-raw]])
  (:require [kameleon.sql-reader]))

(def ^:private version
  "The destination database version"
  "2.18.0:20171103.01")

(defn- add-cascading-deletions
  "Adds cascading deletions to the attached_tags table."
  []
  (println "\t* adding cascading deletions to the attached_tags table.")
  (exec-raw "ALTER TABLE ONLY attached_tags DROP CONSTRAINT attached_tags_tag_id_fkey")
  (kameleon.sql-reader/load-sql-file "constraints/02_attached_tags.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-cascading-deletions))
