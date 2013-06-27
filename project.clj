;; This is a fake project used to make it easier to test the database
;; conversion scripts.

(defproject org.iplantc/de-database-schema
  :description "Database initialization and conversion scripts."
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [korma "0.3.0-RC4"]
                 [postgresql "9.0-801.jdbc4"]])
