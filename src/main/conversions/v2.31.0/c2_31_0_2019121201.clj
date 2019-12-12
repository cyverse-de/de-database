(ns facepalm.c2-31-0-2019121201
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.31.0:20191212.01")

(defn- add-requests-tables
  "Adds database tables for requests that require administrative intervention."
  []
  (mapv load-sql-file
        ["tables/099_requests.sql"
         "tables/100_request_types.sql"
         "tables/101_request_updates.sql"
         "tables/102_request_status_codes.sql"
         "constraints/000_099_requests.sql"
         "constraints/000_100_request_types.sql"
         "constraints/000_101_request_updates.sql"
         "constraints/000_102_request_status_codes.sql"
         "constraints/099_requests.sql"
         "constraints/101_request_updates.sql"
         "data/102_request_status_codes.sql"]))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-requests-tables))
