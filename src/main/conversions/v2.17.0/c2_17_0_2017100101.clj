(ns facepalm.c2-17-0-2017100101
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.17.0:20171001.01")

(defn- add-zapier-webhooks-table
  "Add zapier webhook type"
  []
  (println "\t* add zapier webhook type...")
  (load-sql-file "data/80_webhooks_type.sql")
  (load-sql-file "constraints/00_82_webhooks_type_ukey.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-zapier-webhooks-table))
