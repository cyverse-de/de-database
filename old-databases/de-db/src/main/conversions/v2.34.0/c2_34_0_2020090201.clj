(ns facepalm.c2-34-0-2020090201
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.32.0:20200902.01")

(defn- add-default-bags-table
  "Adds the default-bags table and its constraints"
  []
  (mapv load-sql-file
        ["tables/105_default_bags.sql"
         "constraints/000_105_default_bags.sql"
         "constraints/105_default_bags.sql"]))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-default-bags-table))