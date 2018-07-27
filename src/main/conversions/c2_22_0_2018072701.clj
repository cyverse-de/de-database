(ns facepalm.c2-22-0-2018072701
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180727.01")

(defn- add-attr-attrs-table
  "Adds the join table for parent and child attributes."
  []
  (println "\t* adding the join table for parent and child attributes.")
  (load-sql-file "tables/attr_attrs.sql")
  (load-sql-file "constraints/18_attr_attrs.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-attr-attrs-table))
