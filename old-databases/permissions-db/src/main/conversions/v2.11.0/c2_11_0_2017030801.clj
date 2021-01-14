(ns facepalm.c2-11-0-2017030801
    (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.11.0:20170308.01")

(defn- add-tool-resource-type
  "Adds a tool type to the resource_types table."
  []
  (println "\t* adding 'tool' to the resource_types table...")
  (sql/insert :resource_types
              (sql/values {:name        "tool"
                           :description "A Discovery Environment tool run by an application."})))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-tool-resource-type))
