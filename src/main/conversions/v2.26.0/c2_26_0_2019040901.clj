(ns facepalm.c2-26-0-2019040901
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.26.0:20190409.01")

(defn- add-app-publication-request-tables
  []
  (load-sql-file "tables/094_app_publication_requests.sql")
  (load-sql-file "constraints/000_094_app_publication_requests_pkey.sql")
  (load-sql-file "constraints/094_app_publication_requests.sql")
  (load-sql-file "data/094_app_publication_request_status_codes.sql"))

(defn convert
  []
  (println "Performing the conversion to" version)
  (add-app-publication-request-tables))
