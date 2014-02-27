(ns facepalm.c186-2014022701
  (:use [korma.core]))

(def ^:private version
  "The destination database version."
  "1.8.6:20140227.01")

(defn- update-tool-request-status-codes-table
  "Increases the length of the name field in the tool_request_status_codes table."
  []
  (println "\t* increasing the tool request status code name length")
  (exec-raw "ALTER TABLE tool_request_status_codes ALTER name TYPE VARCHAR(64)"))

(defn convert
  "Performs the database conversion."
  []
  (println "Performing the conversion for" version)
  (update-tool-request-status-codes-table))
