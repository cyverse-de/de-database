BEGIN;

SET search_path = public, pg_catalog;

-- value_type ()
CREATE TABLE IF NOT EXISTS value_type (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(40) NOT NULL,
    description text NOT NULL,
    PRIMARY KEY (id)
);

-- parameter_types (value_type)
CREATE TABLE IF NOT EXISTS parameter_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255) NOT NULL,
    description text,
    label character varying(255),
    deprecated boolean DEFAULT false,
    hidable boolean DEFAULT false,
    display_order integer DEFAULT 999,
    value_type_id uuid,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY parameter_types
    ADD CONSTRAINT parameter_types_value_type_fkey
    FOREIGN KEY (value_type_id)
    REFERENCES value_type(id);

-- parameter_groups (ext)
CREATE TABLE IF NOT EXISTS parameter_groups (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    task_id uuid NOT NULL,
    name character varying(255),
    description text,
    label character varying(255) NOT NULL,
    display_order int NOT NULL DEFAULT 0,
    is_visible boolean DEFAULT true,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY parameter_groups
    ADD CONSTRAINT parameter_groups_task_id_fkey
    FOREIGN KEY (task_id)
    REFERENCES tasks(id) ON DELETE CASCADE;

-- parameters (parameter_types, parameter_groups)
CREATE TABLE IF NOT EXISTS parameters (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    parameter_group_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    label text,
    is_visible boolean DEFAULT true,
    ordering integer DEFAULT 0,
    display_order int NOT NULL DEFAULT 0,
    parameter_type uuid NOT NULL,
    required boolean DEFAULT false,
    omit_if_blank boolean DEFAULT true,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY parameters
    ADD CONSTRAINT parameters_parameter_groups_id_fkey
    FOREIGN KEY (parameter_group_id)
    REFERENCES parameter_groups(id) ON DELETE CASCADE;

ALTER TABLE ONLY parameters
    ADD CONSTRAINT parameters_parameter_types_fkey
    FOREIGN KEY (parameter_type)
    REFERENCES parameter_types(id);

-- parameter_values (parameters)
CREATE TABLE IF NOT EXISTS parameter_values (
    id uuid NOT NULL DEFAULT (uuid_generate_v1()),
    parameter_id uuid NOT NULL,
    parent_id uuid,
    is_default boolean NOT NULL DEFAULT false,
    display_order int NOT NULL DEFAULT 0,
    name character varying(255),
    value character varying(255),
    description text,
    label text,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY parameter_values
    ADD CONSTRAINT parameter_values_parameter_id_fkey
    FOREIGN KEY (parameter_id)
    REFERENCES parameters(id) ON DELETE CASCADE;
ALTER TABLE ONLY parameter_values
    ADD CONSTRAINT parameter_values_parent_id_fkey
    FOREIGN KEY (parent_id)
    REFERENCES parameter_values(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS parameter_values_parameter_id_idx ON parameter_values(parameter_id);
CREATE INDEX IF NOT EXISTS parameter_values_parent_id_idx ON parameter_values(parent_id);

--------------------------------------------------------------------------------

-- data_source, info_type, data_formats ()
CREATE TABLE IF NOT EXISTS data_source (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(50) NOT NULL,
    label varchar(50) NOT NULL,
    description text NOT NULL,
    display_order bigint,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS info_type (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(64) NOT NULL,
    label character varying(255),
    description text,
    deprecated boolean DEFAULT false,
    display_order integer DEFAULT 999,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS data_formats (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(64) NOT NULL,
    label character varying(255),
    display_order integer DEFAULT 999,
    PRIMARY KEY (id)
);

-- file_parameters (data_source, info_type, data_formats, parameters)
CREATE TABLE IF NOT EXISTS file_parameters (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    parameter_id uuid,
    retain boolean DEFAULT false,
    is_implicit boolean DEFAULT false,
    repeat_option_flag boolean DEFAULT true,
    info_type uuid NOT NULL,
    data_format uuid NOT NULL,
    data_source_id uuid NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY file_parameters
    ADD CONSTRAINT file_parameters_data_format_fkey
    FOREIGN KEY (data_format)
    REFERENCES data_formats(id);
ALTER TABLE ONLY file_parameters
    ADD CONSTRAINT file_parameters_info_type_fkey
    FOREIGN KEY (info_type)
    REFERENCES info_type(id);
ALTER TABLE ONLY file_parameters
    ADD CONSTRAINT file_parameters_data_source_id_fkey
    FOREIGN KEY (data_source_id)
    REFERENCES data_source(id);
ALTER TABLE ONLY file_parameters
    ADD CONSTRAINT file_parameters_parameter_id_fkey
    FOREIGN KEY (parameter_id)
    REFERENCES parameters(id) ON DELETE CASCADE;


-- input_output_mapping (parameters, ext)
CREATE TABLE IF NOT EXISTS input_output_mapping (
    mapping_id uuid NOT NULL,
    input uuid,
    external_input character varying(255),
    output uuid,
    external_output character varying(255)
);

ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_mapping_id_fk
    FOREIGN KEY (mapping_id)
    REFERENCES workflow_io_maps(id) ON DELETE CASCADE;
ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_input_fkey
    FOREIGN KEY (input)
    REFERENCES parameters(id) ON DELETE CASCADE;
ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_output_fkey
    FOREIGN KEY (output)
    REFERENCES parameters(id) ON DELETE CASCADE;
CREATE UNIQUE INDEX input_output_mapping_unique_idx
    ON input_output_mapping(mapping_id, input, external_input);

--------------------------------------------------------------------------------

-- rule_subtype ()
CREATE TABLE IF NOT EXISTS rule_subtype (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(40) NOT NULL,
    description text NOT NULL,
    PRIMARY KEY (id)
);

-- rule_type (rule_subtype)
CREATE TABLE IF NOT EXISTS rule_type (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255) NOT NULL,
    description text,
    label character varying(255),
    deprecated boolean DEFAULT false,
    display_order integer DEFAULT 999,
    rule_description_format character varying(255) DEFAULT '',
    rule_subtype_id uuid NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY rule_type
    ADD CONSTRAINT rule_type_rule_subtype_id_fkey
    FOREIGN KEY (rule_subtype_id)
    REFERENCES rule_subtype(id);

-- rule_type_value_type (rule_type, value_type)
CREATE TABLE IF NOT EXISTS rule_type_value_type (
    rule_type_id uuid NOT NULL,
    value_type_id uuid NOT NULL
);

ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_rule_type_id_fkey
    FOREIGN KEY (rule_type_id)
    REFERENCES rule_type(id);
ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_value_type_id_fkey
    FOREIGN KEY (value_type_id)
    REFERENCES value_type(id);

--------------------------------------------------------------------------------

-- validation_rule_argument_types ()
CREATE TABLE IF NOT EXISTS validation_rule_argument_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(64) NOT NULL,
    PRIMARY KEY (id)
);

-- validation_rule_argument_definitions (validation_rule_argument_types, rule_type)
CREATE TABLE IF NOT EXISTS validation_rule_argument_definitions (
    id uuid NOT NULL default uuid_generate_v1(),
    rule_type_id uuid NOT NULL,
    argument_index integer NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    argument_type_id uuid NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY validation_rule_argument_definitions
    ADD CONSTRAINT validation_rule_argument_definitions_rule_type_id_fkey
    FOREIGN KEY(rule_type_id)
    REFERENCES rule_type(id) ON DELETE CASCADE;
ALTER TABLE ONLY validation_rule_argument_definitions
    ADD CONSTRAINT validation_rule_argument_definitions_argument_type_id_fkey
    FOREIGN KEY(argument_type_id)
    REFERENCES validation_rule_argument_types(id) ON DELETE CASCADE;

-- validation_rules (rule_type, parameters)
CREATE TABLE IF NOT EXISTS validation_rules (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    parameter_id uuid NOT NULL,
    rule_type uuid NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY validation_rules
    ADD CONSTRAINT validation_rules_rule_type_fkey
    FOREIGN KEY (rule_type)
    REFERENCES rule_type(id);
ALTER TABLE ONLY validation_rules
    ADD CONSTRAINT validation_rules_parameters_id_fkey
    FOREIGN KEY (parameter_id)
    REFERENCES parameters(id) ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS validation_rules_parameters_id_idx ON validation_rules(parameter_id);

-- validation_rule_arguments (validation_rules)
CREATE TABLE IF NOT EXISTS validation_rule_arguments (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    rule_id uuid NOT NULL,
    ordering integer DEFAULT 0,
    argument_value text,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY validation_rule_arguments
    ADD CONSTRAINT validation_rule_arguments_validation_rules_id_fkey
    FOREIGN KEY (rule_id)
    REFERENCES validation_rules(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS validation_rule_arguments_rule_id_idx ON validation_rule_arguments(rule_id);

COMMIT;
