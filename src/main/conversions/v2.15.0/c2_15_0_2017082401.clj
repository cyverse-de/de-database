(ns facepalm.c2-15-0-2017082401
  (:use [kameleon.sql-reader :only [exec-sql-statement]])
  (:require [korma.core :as sql]))

(def ^:private version
  "The destination databse version"
  "2.15.0:20170824.01")

(defn- update-url-import-tool
  []
  (println "\t* update url import tool...")
  (sql/update :tools
              (sql/set-fields {:name        "urlmport"
                               :location    ""
                               :description "Go tool for DE URL imports"})
              (sql/where {:id "681251EF-EE59-4FE9-9436-DC8A23FEB11A"}))
  (sql/update :apps
              (sql/set-fields {:name "Url Import"
                               :description "A Go tool for DE URL imports"})
              (sql/where {:id "1E8F719B-0452-4D39-A2F3-8714793EE3E6"}))
  (sql/update :parameters
              (sql/set-fields {:name "-filename"})
              (sql/where {:id "1DD009B1-CE1E-4933-ABA8-66314757288B"}))

  (sql/update :parameters
              (sql/set-fields {:name "-url"})
              (sql/where {:id "A0D6A102-8623-47B9-A57F-224D6A71F28D"}))

  (sql/update :container_images
              (sql/set-fields {:name "discoenv/url-import"
                               :url "https://registry.hub.docker.com/u/discoenv/url-import/"})
              (sql/where {:id "15959300-b972-4571-ace2-081af0909599"})))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (update-url-import-tool))
