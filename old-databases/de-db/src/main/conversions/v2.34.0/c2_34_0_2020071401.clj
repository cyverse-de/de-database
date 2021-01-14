(ns facepalm.c2-34-0-2020071401
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination databse version."
  "2.34.0:20200714.01")

(defn- remove-email-address-requirement
  []
  (exec-sql-statement
   "ALTER TABLE logins ALTER COLUMN ip_address DROP NOT NULL"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (remove-email-address-requirement))
