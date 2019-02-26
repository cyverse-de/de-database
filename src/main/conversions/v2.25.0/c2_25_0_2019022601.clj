(ns facepalm.c2-25-0-2019022601
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.25.0:20190226.01")

(defn- create-submissions-table
  []
  (load-sql-file "tables/89_submissions.sql")
  (load-sql-file "constraints/00_89_submissions_pkey.sql"))

(defn- create-badges-table
  []
  (load-sql-file "tables/90_badges.sql")
  (load-sql-file "constraints/00_90_badges_pkey.sql")
  (load-sql-file "constraints/90_badges.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (create-submissions-table)
  (create-badges-table))
