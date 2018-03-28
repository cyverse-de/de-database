(ns facepalm.c2-20-0-2018032601
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.20.0:20180326.01")

(defn- add-osg-image-path-column
  "Adds the osg_image_path column to the container_images table."
  []
  (println "\t* adding the osg_image_path column to the container_images table.")
  (exec-sql-statement
   "ALTER TABLE ONLY container_images
    ADD COLUMN osg_image_path varchar(1024)"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-osg-image-path-column))
