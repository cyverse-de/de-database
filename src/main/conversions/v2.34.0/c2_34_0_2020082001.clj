(ns facepalm.c2-34-0-2020082001
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination databse version."
  "2.34.0:20200820.01")

(defn- add-behavior-type-index
  []
  (exec-sql-statement "CREATE INDEX async_task_behavior_behavior_type_index ON async_task_behavior(behavior_type)"))


(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (add-behavior-type-index))
