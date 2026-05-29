-- Synthetic apps, each with a single non-deleted version, one step wired to a
-- task, and a parameter group holding a file input and a text parameter. A
-- non-deleted app_version is what makes an app appear in the app_listing view.
BEGIN;
SET search_path = public, pg_catalog;

-- The apps table holds only identity columns; integration data and dates live on
-- app_versions (migration 000033 moved them there).
INSERT INTO apps (id, name, description, wiki_url) VALUES
    ('66666666-6666-6666-6666-666666666601', 'Test App 1', 'First synthetic app',  NULL),
    ('66666666-6666-6666-6666-666666666602', 'Test App 2', 'Second synthetic app', NULL),
    ('66666666-6666-6666-6666-666666666603', 'Test App 3', 'Third synthetic app',  NULL),
    ('66666666-6666-6666-6666-666666666604', 'Test App 4', 'Fourth synthetic app', NULL),
    ('66666666-6666-6666-6666-666666666605', 'Test Interactive App', 'Synthetic interactive (VICE) app', NULL)
ON CONFLICT (id) DO NOTHING;

INSERT INTO app_versions (id, app_id, version, version_order, integration_data_id, integration_date, edited_date) VALUES
    ('77777777-7777-7777-7777-777777777701', '66666666-6666-6666-6666-666666666601', '1.0.0', 0, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777702', '66666666-6666-6666-6666-666666666602', '1.0.0', 0, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777703', '66666666-6666-6666-6666-666666666603', '1.0.0', 0, '22222222-2222-2222-2222-222222222202', now(), now()),
    ('77777777-7777-7777-7777-777777777704', '66666666-6666-6666-6666-666666666604', '1.0.0', 0, '22222222-2222-2222-2222-222222222202', now(), now()),
    ('77777777-7777-7777-7777-777777777705', '66666666-6666-6666-6666-666666666605', '1.0.0', 0, '22222222-2222-2222-2222-222222222203', now(), now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO app_steps (id, app_version_id, task_id, step) VALUES
    ('88888888-8888-8888-8888-888888888801', '77777777-7777-7777-7777-777777777701', '55555555-5555-5555-5555-555555555501', 0),
    ('88888888-8888-8888-8888-888888888802', '77777777-7777-7777-7777-777777777702', '55555555-5555-5555-5555-555555555502', 0),
    ('88888888-8888-8888-8888-888888888803', '77777777-7777-7777-7777-777777777703', '55555555-5555-5555-5555-555555555503', 0),
    ('88888888-8888-8888-8888-888888888804', '77777777-7777-7777-7777-777777777704', '55555555-5555-5555-5555-555555555504', 0),
    ('88888888-8888-8888-8888-888888888805', '77777777-7777-7777-7777-777777777705', '55555555-5555-5555-5555-555555555505', 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO parameter_groups (id, task_id, name, label, description, display_order) VALUES
    ('99999999-9999-9999-9999-999999999901', '55555555-5555-5555-5555-555555555501', 'Parameters', 'Parameters', 'Inputs for Test App 1', 0),
    ('99999999-9999-9999-9999-999999999902', '55555555-5555-5555-5555-555555555502', 'Parameters', 'Parameters', 'Inputs for Test App 2', 0),
    ('99999999-9999-9999-9999-999999999903', '55555555-5555-5555-5555-555555555503', 'Parameters', 'Parameters', 'Inputs for Test App 3', 0),
    ('99999999-9999-9999-9999-999999999904', '55555555-5555-5555-5555-555555555504', 'Parameters', 'Parameters', 'Inputs for Test App 4', 0),
    ('99999999-9999-9999-9999-999999999905', '55555555-5555-5555-5555-555555555505', 'Parameters', 'Parameters', 'Inputs for Test Interactive App', 0)
ON CONFLICT (id) DO NOTHING;

-- Two parameters per group: a required file input (xxx1) and a text option (xxx2).
INSERT INTO parameters (id, parameter_group_id, name, label, ordering, display_order, parameter_type, required, description) VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa011', '99999999-9999-9999-9999-999999999901', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'), true,  'Input file for Test App 1'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa012', '99999999-9999-9999-9999-999999999901', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text'),      false, 'Sample name for Test App 1'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa021', '99999999-9999-9999-9999-999999999902', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'), true,  'Input file for Test App 2'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa022', '99999999-9999-9999-9999-999999999902', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text'),      false, 'Sample name for Test App 2'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa031', '99999999-9999-9999-9999-999999999903', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'), true,  'Input file for Test App 3'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa032', '99999999-9999-9999-9999-999999999903', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text'),      false, 'Sample name for Test App 3'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa041', '99999999-9999-9999-9999-999999999904', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'), true,  'Input file for Test App 4'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa042', '99999999-9999-9999-9999-999999999904', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text'),      false, 'Sample name for Test App 4'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa051', '99999999-9999-9999-9999-999999999905', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput'), true,  'Input file for Test Interactive App'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa052', '99999999-9999-9999-9999-999999999905', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text'),      false, 'Sample name for Test Interactive App')
ON CONFLICT (id) DO NOTHING;

INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id) VALUES
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb001', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa011', (SELECT id FROM info_type WHERE name = 'File'), (SELECT id FROM data_formats WHERE name = 'Unspecified'), (SELECT id FROM data_source WHERE name = 'file')),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb002', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa021', (SELECT id FROM info_type WHERE name = 'File'), (SELECT id FROM data_formats WHERE name = 'Unspecified'), (SELECT id FROM data_source WHERE name = 'file')),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb003', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa031', (SELECT id FROM info_type WHERE name = 'File'), (SELECT id FROM data_formats WHERE name = 'Unspecified'), (SELECT id FROM data_source WHERE name = 'file')),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb004', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa041', (SELECT id FROM info_type WHERE name = 'File'), (SELECT id FROM data_formats WHERE name = 'Unspecified'), (SELECT id FROM data_source WHERE name = 'file')),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb005', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa051', (SELECT id FROM info_type WHERE name = 'File'), (SELECT id FROM data_formats WHERE name = 'Unspecified'), (SELECT id FROM data_source WHERE name = 'file'))
ON CONFLICT (id) DO NOTHING;

COMMIT;
