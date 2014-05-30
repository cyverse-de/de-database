SET search_path = public, pg_catalog;

--
-- Renames the existing rule table to validation_rules and adds updated columns.
--
ALTER TABLE rule RENAME TO validation_rules;
ALTER TABLE ONLY validation_rules RENAME COLUMN hid TO hid_v187;
ALTER TABLE ONLY validation_rules RENAME COLUMN name TO name_v187;
ALTER TABLE ONLY validation_rules RENAME COLUMN description TO description_v187;
ALTER TABLE ONLY validation_rules RENAME COLUMN label TO label_v187;
ALTER TABLE ONLY validation_rules RENAME COLUMN rule_type TO rule_type_v187;
ALTER TABLE ONLY validation_rules
  ALTER COLUMN id TYPE UUID USING
    CASE WHEN CHAR_LENGTH(id) < 36
          THEN (uuid_generate_v4())
          ELSE CAST(id AS UUID)
    END;
ALTER TABLE ONLY validation_rules ADD COLUMN parameter_id UUID;
ALTER TABLE ONLY validation_rules ADD COLUMN rule_type UUID;

