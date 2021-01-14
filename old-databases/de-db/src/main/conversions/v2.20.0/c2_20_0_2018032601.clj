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
    ADD COLUMN osg_image_path text"))

(defn- drop-container-images-name-tag-key
  "Removes the container_images_name_tag_key index from the database."
  []
  (println "\t* dropping the uniqueness constraint for image name and tag in the container_images table.")
  (exec-sql-statement
   "ALTER TABLE ONLY container_images
    DROP CONSTRAINT container_images_name_tag_key"))

(defn- add-container-images-osg-image-path-key
  "Adds the container_images_name_tag_osg_image_path_key index to the database."
  []
  (println "\t* adding a uniqueness constraint on image name, tag and OSG image path to the container_images table.")
  (exec-sql-statement
   "ALTER TABLE ONLY container_images
    ADD CONSTRAINT container_images_name_tag_osg_image_path_key UNIQUE (name, tag, osg_image_path)"))

(defn convert
  "Performs the conversion for this database version."
  []
  (println "Performing the conversion for" version)
  (add-osg-image-path-column)
  (drop-container-images-name-tag-key)
  (add-container-images-osg-image-path-key))
