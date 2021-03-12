(ns facepalm.c2-37-0-2021031201
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination databse version."
  "2.37.0:20210312.01")

(defn- update-request-status-codes
  []
  (load-sql-file "data/102_request_status_codes.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (update-request-status-codes))
