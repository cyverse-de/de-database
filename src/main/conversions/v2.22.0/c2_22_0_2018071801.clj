(ns facepalm.c2-22-0-2018071801
  (:use [kameleon.sql-reader :only [load-sql-file]]))

(def ^:private version
  "The destination database version"
  "2.22.0:20180718.01")

(defn- create-validation-rule-argument-definition-tables
  "Creates the tables used to store the definitions of validation rule arguments."
  []
  (load-sql-file "tables/085_validation_rule_argument_types.sql")
  (load-sql-file "tables/086_validation_rule_argument_definitions.sql")
  (load-sql-file "constraints/000_085_validation_rule_argument_types_pkey.sql")
  (load-sql-file "constraints/000_086_validation_rule_argument_definitions_pkey.sql")
  (load-sql-file "constraints/086_validation_rule_argument_definitions.sql"))

(defn- load-validation-rule-argument-definitions
  "Loads the argument definitions for exisitng validation rules."
  []
  (load-sql-file "data/085_validation_rule_argument_types.sql")
  (load-sql-file "data/086_validation_rule_argument_definitions.sql"))

(defn convert
  "Performs the conversion for this database version"
  []
  (println "Performing the conversion for" version)
  (create-validation-rule-argument-definition-tables)
  (load-validation-rule-argument-definitions))
