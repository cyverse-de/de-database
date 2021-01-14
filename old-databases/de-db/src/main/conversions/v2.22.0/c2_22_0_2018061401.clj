(ns facepalm.c2-22-0-2018061401
  (:use [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180614.01")

(defn- add-osg-tool-type
  "Adds the OSG tool type"
  []
  (exec-sql-statement
   "INSERT INTO tool_types (id, name, label, description) VALUES
       ( '7EC7063B-A96D-4AE5-9815-4548BA7D9C74', 'osg', 'OSG DE tools.',
         'DE tools capable of running on the Open Science Grid.' )"))

(defn- add-osg-job-type
  "Adds teh OSG job type"
  []
  (exec-sql-statement
   "INSERT INTO job_types(id, name, system_id) VALUES
       ( '769AB85C-539C-4F08-A9E7-A565BCE9B009', 'OSG', 'osg')"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Peforming the conversion for" version)
  (add-osg-tool-type)
  (add-osg-job-type))
