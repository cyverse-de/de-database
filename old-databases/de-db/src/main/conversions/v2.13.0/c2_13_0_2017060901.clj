(ns facepalm.c2-13-0-2017060901
    (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.13.0:20170609.01")

(defn- add-tool-request-indexes
  "Updates the app_listing view."
  []
  (println "\t* adding additional indexes to tool_request_statuses table...")
  (exec-sql-statement
    "CREATE INDEX tool_request_statuses_tool_request_id_index
      ON tool_request_statuses(tool_request_id)")

  (println "\t* adding additional indexes to tool_requests table...")
  (exec-sql-statement
    "CREATE INDEX tool_requests_tool_id_index
      ON tool_requests(tool_id)")
  (exec-sql-statement
    "CREATE INDEX tool_requests_requestor_id_index
      ON tool_requests(requestor_id)"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-tool-request-indexes))
