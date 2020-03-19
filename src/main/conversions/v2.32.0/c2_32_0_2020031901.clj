(ns facepalm.c2-32-0-2020031901
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.32.0:20200319.01")

(defn- add-request-table-constraints
  "Adds additional constraints to some of the requests tables."
  []
  (mapv load-sql-file
        ["constraints/100_request_types.sql"
         "constraints/102_request_status_codes.sql"]))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-request-table-constraints))
