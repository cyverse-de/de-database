(ns facepalm.c2-36-0-2021020101
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination databse version."
  "2.36.0:20210201.01")

(defn- redefine-app-listing-view
  []
  (load-sql-file "views/003_app_listing.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (redefine-app-listing-view))
