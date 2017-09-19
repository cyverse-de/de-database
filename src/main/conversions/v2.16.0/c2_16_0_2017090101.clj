(ns facepalm.c2-16-0-2017090101
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.16.0:20170901.01")

(defn- add-de-webhooks-table
  "Add the de-webhooks table"
  []
  (println "\t* add de-webhooks table...")
  (load-sql-file "tables/78_webhooks_type.sql")
  (load-sql-file "tables/79_webhooks_topic.sql")
  (load-sql-file "tables/80_webhooks.sql")
  (load-sql-file "tables/81_webhooks_subscription.sql")
  (load-sql-file "constraints/00_78_webhooks_type_pkey.sql")
  (load-sql-file "constraints/00_79_webhooks_topic_pkey.sql")
  (load-sql-file "constraints/00_80_webhooks_pkey.sql")
  (load-sql-file "constraints/00_80_webhooks_ukey.sql")
  (load-sql-file "constraints/00_81_webhooks_subscriptions_ukey.sql")
  (load-sql-file "data/78_webhooks_type.sql")
  (load-sql-file "data/79_webhooks_topic.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-de-webhooks-table))
