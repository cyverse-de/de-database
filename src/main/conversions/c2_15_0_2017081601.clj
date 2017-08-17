(ns facepalm.c2-15-0-2017081601
    (:use [korma.core :exclude [update]]
          [kameleon.uuids]))

(def ^:private version
  "The destination database version"
  "2.15.0:20170816.01")

(defn- add-ols-ontology-term-value-type
  "Updates the value_types table."
  []
  (println "\t* adding 'OLS Ontology Term' to value_types table...")
       (insert :value_types (values {:id   (uuidify "AAF2ECDC-7D50-11E7-AA7D-F64E9B87C109")
                                     :name "OLS Ontology Term"})))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-ols-ontology-term-value-type))
