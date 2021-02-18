(ns facepalm.c2-36-0-2021021801
  (:use [korma.core])
  (:require [clojure.java.jdbc :as jdbc]
            [facepalm.core :as migrator]
            [korma.db :as db]))

(def ^:private version
  "The destination database version"
  "2.36.0:20210218.01")

(defn- add-target-enum-quick-launch
  []
  (println "\t* Add 'quick_launch' enum to target_enum type...")
  (jdbc/db-do-prepared (db/get-connection @migrator/admin-db-spec)
                       false
                       "ALTER TYPE target_enum ADD VALUE 'quick_launch' AFTER 'user'"))

(defn- add-target-enum-instant-launch
  []
  (println "\t* add 'instant_launch' enum to target_enum type...")
  (jdbc/db-do-prepared (db/get-connection @migrator/admin-db-spec)
                       false
                       "ALTER TYPE target_enum ADD VALUE 'instant_launch' AFTER 'quick_launch'"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-target-enum-quick-launch)
  (add-target-enum-instant-launch))