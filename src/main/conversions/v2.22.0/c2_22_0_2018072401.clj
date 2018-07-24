(ns facepalm.c2-22-0-2018072401
  (:use [kameleon.sql-reader :only [load-sql-file exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180724.01")

(defn- add-notification-types-enum []
  (load-sql-file "types/01_notification_types.sql"))

(defn- add-notification-type-column []
  (exec-sql-statement "ALTER TABLE ONLY tool_types ADD COLUMN notification_type notification_types")
  (exec-sql-statement "UPDATE tool_types SET notification_type = 'analysis' WHERE name != 'internal'")
  (exec-sql-statement "UPDATE tool_types SET notification_type = 'data' WHERE name = 'internal'")
  (exec-sql-statement "ALTER TABLE ONLY tool_types ALTER COLUMN notification_type SET NOT NULL"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-notification-types-enum)
  (add-notification-type-column))
