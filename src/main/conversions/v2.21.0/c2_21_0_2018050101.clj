(ns facepalm.c2-21-0-2018050101
  (:use [kameleon.sql-reader :only [load-sql-file exec-sql-statement]]))

(def ^:private version
  "The destination database version."
  "2.21.0:20180501.01")

(defn- add-uniqueness-constraint
  []
  (exec-sql-statement
   "ALTER TABLE ONLY interactive_apps_proxy_settings
    ADD CONSTRAINT interactive_apps_proxy_settings_id_unique UNIQUE (id)"))

(defn- drop-constraint
  []
  (exec-sql-statement
   "ALTER TABLE ONLY interactive_apps_proxy_settings
    DROP CONSTRAINT IF EXISTS interactive_apps_proxy_settings_container_settings_id_fkey"))

(defn- remove-column
  []
  (exec-sql-statement
   "ALTER TABLE ONLY interactive_apps_proxy_settings
    DROP COLUMN IF EXISTS container_settings_id"))

(defn- add-column
  []
  (exec-sql-statement
   "ALTER TABLE ONLY container_settings
    ADD COLUMN interactive_apps_proxy_settings_id uuid UNIQUE"))

(defn- add-constraint
  []
  (load-sql-file "constraints/00_71_container_settings_fkey.sql"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-uniqueness-constraint)
  (drop-constraint)
  (remove-column)
  (add-column)
  (add-constraint))
