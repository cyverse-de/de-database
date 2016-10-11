(ns facepalm.c290-2016100701
    (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.9.0:20161007.01")

(defn- update-app-listing-view
       "Updates the app_listing view."
       []
       (println "\t* updating the app_listing view.")
       (load-sql-file "views/03_app_listing.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (update-app-listing-view))
