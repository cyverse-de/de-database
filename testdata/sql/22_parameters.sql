-- Parameters for the pipeline tasks (08, 09) and the parameters-showcase task (10).
-- The showcase covers every major parameter type, selection options
-- (parameter_values, including a parent/child tree relationship), file parameters,
-- and validation rules. Parameter-type / rule-type / info-type / data-format /
-- data-source rows are migration-seeded and referenced by natural key (LIMIT 1
-- because some seeded names are not unique).
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO parameter_groups (id, task_id, name, label, description, display_order) VALUES
    ('99999999-9999-9999-9999-999999999908', '55555555-5555-5555-5555-555555555508', 'Parameters', 'Step One',   'Inputs for pipeline step one', 0),
    ('99999999-9999-9999-9999-999999999909', '55555555-5555-5555-5555-555555555509', 'Parameters', 'Step Two',   'Inputs for pipeline step two', 0),
    ('99999999-9999-9999-9999-999999999910', '55555555-5555-5555-5555-555555555510', 'Parameters', 'All Inputs', 'One parameter of every type',  0)
ON CONFLICT (id) DO NOTHING;

-- Pipeline step parameters: each step has a file input and a file output; the
-- step-one output is wired to the step-two input in 25_pipelines.sql.
INSERT INTO parameters (id, parameter_group_id, name, label, ordering, display_order, parameter_type, required, description) VALUES
    ('a2000000-0000-0000-0000-000000000801', '99999999-9999-9999-9999-999999999908', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'  LIMIT 1), true,  'Pipeline step one input'),
    ('a2000000-0000-0000-0000-000000000802', '99999999-9999-9999-9999-999999999908', '-o', 'Output file', 1, 1, (SELECT id FROM parameter_types WHERE name = 'FileOutput' LIMIT 1), false, 'Pipeline step one output'),
    ('a2000000-0000-0000-0000-000000000901', '99999999-9999-9999-9999-999999999909', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'  LIMIT 1), true,  'Pipeline step two input'),
    ('a2000000-0000-0000-0000-000000000902', '99999999-9999-9999-9999-999999999909', '-o', 'Output file', 1, 1, (SELECT id FROM parameter_types WHERE name = 'FileOutput' LIMIT 1), false, 'Pipeline step two output')
ON CONFLICT (id) DO NOTHING;

-- Parameters-showcase: one of each major type.
INSERT INTO parameters (id, parameter_group_id, name, label, ordering, display_order, parameter_type, required, description) VALUES
    ('a3000000-0000-0000-0000-000000000001', '99999999-9999-9999-9999-999999999910', '-i',   'Input file',        0,  0,  (SELECT id FROM parameter_types WHERE name = 'FileInput'           LIMIT 1), true,  'A file input'),
    ('a3000000-0000-0000-0000-000000000002', '99999999-9999-9999-9999-999999999910', '-o',   'Output file',       1,  1,  (SELECT id FROM parameter_types WHERE name = 'FileOutput'          LIMIT 1), false, 'A file output'),
    ('a3000000-0000-0000-0000-000000000003', '99999999-9999-9999-9999-999999999910', '-d',   'Input folder',      2,  2,  (SELECT id FROM parameter_types WHERE name = 'FolderInput'         LIMIT 1), false, 'A folder input'),
    ('a3000000-0000-0000-0000-000000000004', '99999999-9999-9999-9999-999999999910', '-m',   'Multiple files',    3,  3,  (SELECT id FROM parameter_types WHERE name = 'MultiFileSelector'   LIMIT 1), false, 'A multi-file selector'),
    ('a3000000-0000-0000-0000-000000000005', '99999999-9999-9999-9999-999999999910', '-g',   'Reference genome',  4,  4,  (SELECT id FROM parameter_types WHERE name = 'ReferenceGenome'     LIMIT 1), false, 'A reference genome'),
    ('a3000000-0000-0000-0000-000000000006', '99999999-9999-9999-9999-999999999910', '-t',   'Text value',        5,  5,  (SELECT id FROM parameter_types WHERE name = 'Text'                LIMIT 1), false, 'A text value'),
    ('a3000000-0000-0000-0000-000000000007', '99999999-9999-9999-9999-999999999910', '-T',   'Multi-line text',   6,  6,  (SELECT id FROM parameter_types WHERE name = 'MultiLineText'       LIMIT 1), false, 'A multi-line text value'),
    ('a3000000-0000-0000-0000-000000000008', '99999999-9999-9999-9999-999999999910', '-n',   'Number value',      7,  7,  (SELECT id FROM parameter_types WHERE name = 'Number'              LIMIT 1), false, 'A number value'),
    ('a3000000-0000-0000-0000-000000000009', '99999999-9999-9999-9999-999999999910', '-N',   'Integer value',     8,  8,  (SELECT id FROM parameter_types WHERE name = 'Integer'             LIMIT 1), false, 'An integer value'),
    ('a3000000-0000-0000-0000-000000000010', '99999999-9999-9999-9999-999999999910', '-D',   'Double value',      9,  9,  (SELECT id FROM parameter_types WHERE name = 'Double'              LIMIT 1), false, 'A double value'),
    ('a3000000-0000-0000-0000-000000000011', '99999999-9999-9999-9999-999999999910', '-f',   'Flag value',        10, 10, (SELECT id FROM parameter_types WHERE name = 'Flag'                LIMIT 1), false, 'A boolean flag'),
    ('a3000000-0000-0000-0000-000000000012', '99999999-9999-9999-9999-999999999910', '-s',   'Text selection',    11, 11, (SELECT id FROM parameter_types WHERE name = 'TextSelection'       LIMIT 1), false, 'A single-select text list'),
    ('a3000000-0000-0000-0000-000000000013', '99999999-9999-9999-9999-999999999910', '-S',   'Integer selection', 12, 12, (SELECT id FROM parameter_types WHERE name = 'IntegerSelection'    LIMIT 1), false, 'A single-select integer list'),
    ('a3000000-0000-0000-0000-000000000014', '99999999-9999-9999-9999-999999999910', 'ENVVAR','Environment var',  13, 13, (SELECT id FROM parameter_types WHERE name = 'EnvironmentVariable' LIMIT 1), false, 'An environment variable'),
    ('a3000000-0000-0000-0000-000000000015', '99999999-9999-9999-9999-999999999910', 'info',  'Info text',         14, 14, (SELECT id FROM parameter_types WHERE name = 'Info'                LIMIT 1), false, 'Informational display text')
ON CONFLICT (id) DO NOTHING;

-- Selection options. The text selection includes a parent option with a nested
-- child to exercise the parameter_values self-reference (tree selections).
INSERT INTO parameter_values (id, parameter_id, parent_id, is_default, display_order, name, value, label) VALUES
    ('a4000000-0000-0000-0000-000000000001', 'a3000000-0000-0000-0000-000000000012', NULL, true,  0, 'alpha', 'alpha', 'Alpha'),
    ('a4000000-0000-0000-0000-000000000002', 'a3000000-0000-0000-0000-000000000012', NULL, false, 1, 'beta',  'beta',  'Beta'),
    ('a4000000-0000-0000-0000-000000000003', 'a3000000-0000-0000-0000-000000000012', 'a4000000-0000-0000-0000-000000000002', false, 0, 'beta-child', 'beta-child', 'Beta Child'),
    ('a4000000-0000-0000-0000-000000000011', 'a3000000-0000-0000-0000-000000000013', NULL, true,  0, 'one', '1', 'One'),
    ('a4000000-0000-0000-0000-000000000012', 'a3000000-0000-0000-0000-000000000013', NULL, false, 1, 'two', '2', 'Two')
ON CONFLICT (id) DO NOTHING;

-- File parameters for the file-typed showcase parameters.
INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id) VALUES
    ('bf000000-0000-0000-0000-000000000001', 'a3000000-0000-0000-0000-000000000001', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file'   LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000002', 'a3000000-0000-0000-0000-000000000002', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'stdout' LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000003', 'a3000000-0000-0000-0000-000000000003', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file'   LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000004', 'a3000000-0000-0000-0000-000000000004', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file'   LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000005', 'a3000000-0000-0000-0000-000000000005', (SELECT id FROM info_type WHERE name = 'ReferenceGenome' LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file'   LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000801', 'a2000000-0000-0000-0000-000000000801', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file'   LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000802', 'a2000000-0000-0000-0000-000000000802', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'stdout' LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000901', 'a2000000-0000-0000-0000-000000000901', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file'   LIMIT 1)),
    ('bf000000-0000-0000-0000-000000000902', 'a2000000-0000-0000-0000-000000000902', (SELECT id FROM info_type WHERE name = 'File'            LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'stdout' LIMIT 1))
ON CONFLICT (id) DO NOTHING;

-- Validation rules: a regex on the text param, an int range on the integer param,
-- and a double range on the number param.
INSERT INTO validation_rules (id, parameter_id, rule_type) VALUES
    ('c0000000-0000-0000-0000-000000000001', 'a3000000-0000-0000-0000-000000000006', (SELECT id FROM rule_type WHERE name = 'Regex'       LIMIT 1)),
    ('c0000000-0000-0000-0000-000000000002', 'a3000000-0000-0000-0000-000000000009', (SELECT id FROM rule_type WHERE name = 'IntRange'    LIMIT 1)),
    ('c0000000-0000-0000-0000-000000000003', 'a3000000-0000-0000-0000-000000000008', (SELECT id FROM rule_type WHERE name = 'DoubleRange' LIMIT 1))
ON CONFLICT (id) DO NOTHING;

INSERT INTO validation_rule_arguments (id, rule_id, ordering, argument_value) VALUES
    ('c1000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001', 0, '^[A-Za-z0-9_]+$'),
    ('c1000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000002', 0, '0'),
    ('c1000000-0000-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000002', 1, '100'),
    ('c1000000-0000-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000003', 0, '0.0'),
    ('c1000000-0000-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000003', 1, '1.0')
ON CONFLICT (id) DO NOTHING;

COMMIT;
