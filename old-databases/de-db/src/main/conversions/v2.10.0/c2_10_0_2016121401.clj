(ns facepalm.c2-10-0-2016121401
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.10.0:20161214.01")

(defn- move-to-docker-cyverse-org
  "Changes gims images to docker.cyverse.org images"
  []
  (println "\t* change gims.iplantcollaborative.org:5000 to docker.cyverse.org...")
  (sql/exec-raw "UPDATE container_images SET name = regexp_replace(name, 'gims.iplantcollaborative.org:5000', 'docker.cyverse.org') WHERE name LIKE '%gims.iplantcollaborative.org:5000%'"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (move-to-docker-cyverse-org))
