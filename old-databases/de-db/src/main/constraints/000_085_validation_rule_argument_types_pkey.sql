SET search_path = public, pg_catalog;

ALTER TABLE ONLY validation_rule_argument_types
    ADD CONSTRAINT validation_rule_argument_types_id_pkey
    PRIMARY KEY(id);
