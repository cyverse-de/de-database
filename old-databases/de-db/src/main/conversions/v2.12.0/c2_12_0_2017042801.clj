(ns facepalm.c2-12-0-2017042801
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.12.0:20170428.01")

(defn- make-tools-name-version-unique
  []
  (println "\t* make tools.version required and tools name+version unique...")
  (sql/update :tools
              (sql/set-fields {:version ""})
              (sql/where {:version [= nil]}))
  (sql/exec-raw "ALTER TABLE ONLY tools ALTER COLUMN version SET NOT NULL")
  (sql/exec-raw "ALTER TABLE ONLY tools ADD CONSTRAINT tools_unique UNIQUE (name,version)"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (make-tools-name-version-unique))
