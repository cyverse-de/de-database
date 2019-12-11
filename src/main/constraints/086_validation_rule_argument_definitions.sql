SET search_path = public, pg_catalog;

ALTER TABLE ONLY validation_rule_argument_definitions
    ADD CONSTRAINT validation_rule_argument_definitions_rule_type_id_fkey
    FOREIGN KEY(rule_type_id)
    REFERENCES rule_type(id) ON DELETE CASCADE;

ALTER TABLE ONLY validation_rule_argument_definitions
    ADD CONSTRAINT validation_rule_argument_definitions_argument_type_id_fkey
    FOREIGN KEY(argument_type_id)
    REFERENCES validation_rule_argument_types(id) ON DELETE CASCADE;
