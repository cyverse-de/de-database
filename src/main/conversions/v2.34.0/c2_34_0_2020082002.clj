(ns facepalm.c2-34-0-2020082002
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.32.0:20200820.02")

(defn- add-bags-table
  "Adds the bags table and its constraints"
  []
  (mapv load-sql-file
        ["tables/104_bags.sql"
         "constraints/000_104_bags.sql"
         "constraints/104_bags.sql"]))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-bags-table))