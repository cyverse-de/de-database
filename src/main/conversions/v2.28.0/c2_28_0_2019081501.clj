(ns facepalm.c2-28-0-2019081501
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.28.0:20190815.01")

(defn- add-async-tasks-tables
  []
  (load-sql-file "tables/095_async_tasks.sql")
  (load-sql-file "constraints/00_95_async_tasks.sql")

  (load-sql-file "tables/096_async_task_status.sql")
  (load-sql-file "constraints/00_96_async_task_status.sql")

  (load-sql-file "tables/097_async_task_behavior.sql")
  (load-sql-file "constraints/00_97_async_task_behavior.sql")

  (load-sql-file "constraints/96_async_task_status.sql")
  (load-sql-file "constraints/97_async_task_behavior.sql"))

(defn convert
  []
  (println "Performing the conversion to" version)
  (add-async-tasks-tables))
