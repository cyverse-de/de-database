(ns facepalm.c2-17-0-2017102601
  (:use [korma.core :only [exec-raw]]))

(def ^:private version
  "The destination database version"
  "2.17.0:20171026.01")

(defn- add-cascading-deletions
  "Adds cascading deletions to the template_attrs table."
  []
  (println "\t* adding cascading deletions to the template_attrs table.")
  (exec-raw "ALTER TABLE ONLY template_attrs DROP CONSTRAINT template_attrs_template_id_fkey")
  (exec-raw "ALTER TABLE ONLY template_attrs DROP CONSTRAINT template_attrs_attribute_id_fkey")
  (kameleon.sql-reader/load-sql-file "constraints/06_template_attrs.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-cascading-deletions))
