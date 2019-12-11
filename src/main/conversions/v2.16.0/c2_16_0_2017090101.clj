(ns facepalm.c2-16-0-2017090101
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.16.0:20170901.01")

(defn- add-de-webhooks-table
  "Add the de-webhooks table"
  []
  (println "\t* add de-webhooks table...")
  (load-sql-file "tables/078_webhooks_type.sql")
  (load-sql-file "tables/079_webhooks_topic.sql")
  (load-sql-file "tables/080_webhooks.sql")
  (load-sql-file "tables/081_webhooks_subscription.sql")

  (load-sql-file "constraints/000_078_webhooks_type_pkey.sql")
  (load-sql-file "constraints/000_079_webhooks_topic_pkey.sql")
  (load-sql-file "constraints/000_080_webhooks_pkey.sql")
  (load-sql-file "constraints/000_080_webhooks_ukey.sql")
  (load-sql-file "constraints/000_081_webhooks_subscriptions_ukey.sql")
  (load-sql-file "constraints/080_webhooks_subscription.sql")

  (load-sql-file "data/78_webhooks_type.sql")
  (load-sql-file "data/79_webhooks_topic.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-de-webhooks-table))
