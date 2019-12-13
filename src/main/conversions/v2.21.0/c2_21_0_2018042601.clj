(ns facepalm.c2-21-0-2018042601
  (:use [kameleon.sql-reader :only [load-sql-file exec-sql-statement]]))

(def ^:private version
  "The destination database version."
  "2.21.0:20180426.01")

(defn- add-interactive-column
  "Adds the interactive column to the tools table"
  []
  (exec-sql-statement
   "ALTER TABLE ONLY tools
    ADD COLUMN interactive boolean NOT NULL DEFAULT FALSE"))

(defn- create-container-ports-table
  "Adds the container_ports table to the database"
  []
  (load-sql-file "tables/083_container_ports.sql")
  (load-sql-file "constraints/000_083_container_ports.sql")
  (load-sql-file "constraints/083_container_ports.sql"))

(defn- create-interapps-proxy-settings-table
  "Adds the interactive_apps_proxy_settings table to the database"
  []
  (load-sql-file "tables/084_interapps_proxy_settings.sql")
  (load-sql-file "constraints/000_084_interapps_proxy_settings_pkey.sql"))

(defn- add-proxy-settings-column
  []
  (exec-sql-statement
   "ALTER TABLE ONLY container_settings
    ADD COLUMN interactive_apps_proxy_settings_id uuid UNIQUE"))

(defn- add-container-settings-fkey
  []
  (exec-sql-statement
   "ALTER TABLE ONLY container_settings
    ADD CONSTRAINT container_settings_interactive_apps_proxy_settings_id_fkey
    FOREIGN KEY(interactive_apps_proxy_settings_id)
    REFERENCES interactive_apps_proxy_settings(id) ON DELETE CASCADE"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-interactive-column)
  (create-container-ports-table)
  (create-interapps-proxy-settings-table)
  (add-proxy-settings-column)
  (add-container-settings-fkey))
