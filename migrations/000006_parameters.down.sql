BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS validation_rule_arguments;
DROP TABLE IF EXISTS validation_rules;
DROP TABLE IF EXISTS validation_rule_argument_definitions;
DROP TABLE IF EXISTS validation_rule_argument_types;

DROP TABLE IF EXISTS rule_type_value_type;
DROP TABLE IF EXISTS rule_type;
DROP TABLE IF EXISTS rule_subtype;

DROP TABLE IF EXISTS input_output_mapping;
DROP TABLE IF EXISTS file_parameters;
DROP TABLE IF EXISTS data_formats;
DROP TABLE IF EXISTS info_type;
DROP TABLE IF EXISTS data_source;

DROP TABLE IF EXISTS parameter_values;
DROP TABLE IF EXISTS parameters;
DROP TABLE IF EXISTS parameter_groups;
DROP TABLE IF EXISTS parameter_types;
DROP TABLE IF EXISTS value_type;

COMMIT;
