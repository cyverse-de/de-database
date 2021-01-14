(ns facepalm.c2-16-0-2017091901
  (:use [korma.core :exclude [update]]
        [kameleon.uuids]))

(def ^:private version
  "The destination database version"
  "2.16.0:20170919.01")

(defn- add-uat-ontology-term-value-type
  "Updates the value_types table."
  []
  (println "\t* adding 'UAT Ontology Term' to value_types table...")
  (insert :value_types (values {:id   (uuidify "B5BF6E00-47B9-49D4-B842-C9CE8F1E4F81")
                                :name "UAT Ontology Term"})))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-uat-ontology-term-value-type))
