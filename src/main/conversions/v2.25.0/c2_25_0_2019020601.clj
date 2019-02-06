(ns facepalm.c2-25-0-2019020601
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.25.0:20190206.01")

(defn- add-apps-htcondor-extra-table
  []
  (load-sql-file "tables/88_apps_htcondor_extra.sql")
  (load-sql-file "constraints/00_88_apps_htcondor_extra.sql")
  (load-sql-file "constraints/88_apps_htcondor_extra.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-apps-htcondor-extra-table))
