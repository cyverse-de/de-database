(ns facepalm.c2-22-0-2018052301
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180523.01")

(defn- add-interactive-tool-type
  "Adds a record for the interactive tool type"
  []
  (exec-sql-statement
   "INSERT INTO tool_types (id, name, label, description) VALUES ('4166B913-EAFA-4731-881F-21C3751DFFBB', 'interactive', 'Interactive DE tools.', 'Interactive tools used by the Discovery Environment.' );"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Peforming the conversion for" version)
  (add-interactive-tool-type))
