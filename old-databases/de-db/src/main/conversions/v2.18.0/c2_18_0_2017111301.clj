(ns facepalm.c2-18-0-2017111301
    (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.18.0:20171113.01")

(defn- add-cascading-tool-request-status-deletions
  "Adds cascading tool request status deletions."
  []
  (println "\t* adding cascading deletions to the tool_request_statuses table...")
  (exec-sql-statement
   "ALTER TABLE ONLY tool_request_statuses
    DROP CONSTRAINT tool_request_statuses_tool_request_id_fkey")
  (exec-sql-statement
   "ALTER TABLE ONLY tool_request_statuses
    ADD CONSTRAINT tool_request_statuses_tool_request_id_fkey
    FOREIGN KEY (tool_request_id)
    REFERENCES tool_requests(id) ON DELETE CASCADE"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-cascading-tool-request-status-deletions))
