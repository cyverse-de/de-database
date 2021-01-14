(ns facepalm.c280-2016071201
  (:use [kameleon.sql-reader :only [exec-sql-statement load-sql-file]])
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.8.0:20160712.01")

(defn- add-user-id-column
  "Adds a user_id column to the integration_data table."
  []
  (println "\t* adding the user_id column to the integration_data table.")
  (->> ["ALTER TABLE ONLY integration_data ADD COLUMN user_id uuid"
        "ALTER TABLE ONLY integration_data ADD CONSTRAINT integration_data_user_id_fk
         FOREIGN KEY (user_id) REFERENCES users (id)"]
       (map exec-sql-statement)
       (dorun)))

(defn- populate-user-id-column
  "Populates the user_id column of the integration-data table in cases where the user's email address exactly
   matches the username."
  []
  (println "\t* populating the user_id column of the integration_data table where possible.")
  (exec-sql-statement "UPDATE integration_data d SET user_id = (
    SELECT id FROM users u WHERE u.username = d.integrator_email)"))

(defn- update-app-listing-view
  "Updates the app_listing view."
  []
  (println "\t* updating the app_listing view.")
  (load-sql-file "views/003_app_listing.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-user-id-column)
  (update-app-listing-view)
  (populate-user-id-column))
