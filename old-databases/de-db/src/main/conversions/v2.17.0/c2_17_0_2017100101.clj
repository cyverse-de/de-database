(ns facepalm.c2-17-0-2017100101
    (:use [kameleon.sql-reader :only [load-sql-file]])
    (:require [korma.core :as sql]))

(def ^:private version
  "The destination database version"
  "2.17.0:20171001.01")

(defn- add-zapier-webhooks-table
       "Add zapier webhook type"
       []
       (println "\t* add zapier webhook type...")
       (load-sql-file "constraints/000_082_webhooks_type_ukey.sql")
       (sql/exec-raw "INSERT INTO webhooks_type (type, template) VALUES('Zapier', '{\"id\": \"{{.ID}}\",\"name\": \"{{.Name}}\",\"text\": \"{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}\"}')"))


(defn convert
      "Performs the conversion for this database version"
      []
      (println "Performing the conversion for" version)
      (add-zapier-webhooks-table))
