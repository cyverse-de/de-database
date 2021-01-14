(ns facepalm.c2-32-0-2020040201
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.32.0:20200402.01")

(defn- add-notif-statuses-table
  "Adds the notif_statuses table."
  []
  (load-sql-file "tables/103_notif_statuses.sql")
  (load-sql-file "constraints/000_103_notif_statuses.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-notif-statuses-table))