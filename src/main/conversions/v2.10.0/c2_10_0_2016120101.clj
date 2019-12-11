(ns facepalm.c2-10-0-2016120101
    (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.10.0:20161201.01")

(defn- add-docker-registries-table
  "Adds the docker_registries table"
  []
  (println "\t* adding docker_registries table...")
  (load-sql-file "tables/077_docker_registries.sql")
  (load-sql-file "constraints/000_077_docker_registries_pkey.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-docker-registries-table))
