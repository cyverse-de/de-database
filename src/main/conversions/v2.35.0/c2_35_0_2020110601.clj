(ns facepalm.c2-35-0-2020110601
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.35.0:20201106.01")

(defn- add-function
  []
  (load-sql-file "functions/006_last_modified.sql"))

(defn- add-instant-launch-tables
  []
  (load-sql-file "tables/106_instant_launches.sql")
  (load-sql-file "tables/107_default_instant_launches.sql")
  (load-sql-file "tables/108_user_instant_launches.sql"))

(defn- add-instant-launch-constraints
  []
  (load-sql-file "constraints/000_106_instant_launches_pkey.sql")
  (load-sql-file "constraints/000_107_default_instant_launches_pkey.sql")
  (load-sql-file "constraints/000_108_user_instant_launches_pkey.sql")
  (load-sql-file "constraints/106_instant_launches.sql")
  (load-sql-file "constraints/107_default_instant_launches.sql")
  (load-sql-file "constraints/108_user_instant_launches.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-function)
  (add-instant-launch-tables)
  (add-instant-launch-constraints))