(ns facepalm.c2-27-0-2019052801
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.27.0:20190528.01")

(defn- add-webhook-type
  []
  (exec-sql-statement
   "INSERT INTO webhooks_type (type, template)
		         VALUES('Custom','')"))

(defn- alter-webook-type-table
  []
  (exec-sql-statement
   "ALTER TABLE webhooks_type ALTER COLUMN template DROP NOT NULL;"))

(defn convert
  []
  (println "Performing the conversion to" version)
  (alter-webook-type-table)
  (add-webhook-type))
