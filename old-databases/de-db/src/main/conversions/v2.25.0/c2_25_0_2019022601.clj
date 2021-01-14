(ns facepalm.c2-25-0-2019022601
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.25.0:20190226.01")

(defn- create-submissions-table
  []
  (load-sql-file "tables/089_submissions.sql")
  (load-sql-file "constraints/000_089_submissions_pkey.sql"))

(defn- create-quick-launches-table
  []
  (load-sql-file "tables/090_quick_launches.sql")
  (load-sql-file "constraints/000_090_quick_launches_pkey.sql")
  (load-sql-file "constraints/090_quick_launches.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (create-submissions-table)
  (create-quick-launches-table))
