(ns facepalm.c199-2015053001
  (:use [korma.core]
        [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version."
  "1.9.9:20150530.01")

(defn- add-container-images-table
  []
  (println "\t* adding container_images table")
  (load-sql-file "tables/070_container_images.sql")
  (load-sql-file "constraints/000_070_container_images_pkey.sql"))

(defn- add-container-settings-table
  []
  (println "\t* adding container_settings table")
  (load-sql-file "tables/071_container_settings.sql")
  (load-sql-file "constraints/071_container_settings.sql"))

(defn- add-container-devices-table
  []
  (println "\t* adding container_devices table")
  (load-sql-file "tables/072_container_devices.sql")
  (load-sql-file "constraints/072_container_devices.sql"))

(defn- add-container-volumes-table
  []
  (println "\t* adding container_volumes table")
  (load-sql-file "tables/073_container_volumes.sql")
  (load-sql-file "constraints/073_container_volumes.sql"))

(defn- add-container-volumes-from-table
  []
  (println "\t* adding container_volumes_from table")
  (load-sql-file "tables/074_container_volumes_from.sql")
  (load-sql-file "constraints/074_container_volumes_from.sql"))

(defn convert
  "Performs the conversion for database version 1.9.7:20150530.01"
  []
  (println "Performing the conversion for" version)
  (add-container-images-table)
  (add-container-settings-table)
  (add-container-devices-table)
  (add-container-volumes-table)
  (add-container-volumes-from-table))
