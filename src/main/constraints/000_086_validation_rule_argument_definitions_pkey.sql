SET search_path = public, pg_catalog;

ALTER TABLE ONLY validation_rule_argument_definitions
    ADD CONSTRAINT validation_rule_argument_definitions_id_pkey
    PRIMARY KEY(id);
