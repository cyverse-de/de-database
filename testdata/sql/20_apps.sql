-- Synthetic apps, their versions, and steps. Apps 1-5 are simple single-version
-- DE/interactive apps (each with one step + a basic parameter group). Apps 6-10
-- add coverage: a multi-version app (with deleted/disabled versions), an OSG app,
-- an external (Agave/HPC-style) app, a multi-step pipeline, and a parameters
-- showcase app. Parameters for the showcase/pipeline tasks live in 22_parameters.sql.
-- A non-deleted app_version is what makes an app appear in the app_listing view.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO apps (id, name, description, wiki_url) VALUES
    ('66666666-6666-6666-6666-666666666601', 'Test App 1', 'First synthetic app',  NULL),
    ('66666666-6666-6666-6666-666666666602', 'Test App 2', 'Second synthetic app', NULL),
    ('66666666-6666-6666-6666-666666666603', 'Test App 3', 'Third synthetic app',  NULL),
    ('66666666-6666-6666-6666-666666666604', 'Test App 4', 'Fourth synthetic app', NULL),
    ('66666666-6666-6666-6666-666666666605', 'Test Interactive App', 'Synthetic interactive (VICE) app', NULL),
    ('66666666-6666-6666-6666-666666666606', 'Test Versioned App', 'App with multiple versions', NULL),
    ('66666666-6666-6666-6666-666666666607', 'Test OSG App', 'Synthetic OSG app', NULL),
    ('66666666-6666-6666-6666-666666666608', 'Test External App', 'Synthetic external (Agave/HPC) app', NULL),
    ('66666666-6666-6666-6666-666666666609', 'Test Pipeline 1', 'Two-step synthetic pipeline', NULL),
    ('66666666-6666-6666-6666-666666666610', 'Test Parameters App', 'App exercising every parameter type', NULL)
ON CONFLICT (id) DO NOTHING;

-- App versions. App 6 has three versions: 1.0.0 is deleted, 2.0.0 is disabled,
-- 3.0.0 is the active latest (version_order ascending, newest highest).
INSERT INTO app_versions (id, app_id, version, version_order, deleted, disabled, integration_data_id, integration_date, edited_date) VALUES
    ('77777777-7777-7777-7777-777777777701', '66666666-6666-6666-6666-666666666601', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777702', '66666666-6666-6666-6666-666666666602', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777703', '66666666-6666-6666-6666-666666666603', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222202', now(), now()),
    ('77777777-7777-7777-7777-777777777704', '66666666-6666-6666-6666-666666666604', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222202', now(), now()),
    ('77777777-7777-7777-7777-777777777705', '66666666-6666-6666-6666-666666666605', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222203', now(), now()),
    ('77777777-7777-7777-7777-777777777761', '66666666-6666-6666-6666-666666666606', '1.0.0', 0, true,  false, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777762', '66666666-6666-6666-6666-666666666606', '2.0.0', 1, false, true,  '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777763', '66666666-6666-6666-6666-666666666606', '3.0.0', 2, false, false, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-777777777771', '66666666-6666-6666-6666-666666666607', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222203', now(), now()),
    ('77777777-7777-7777-7777-777777777781', '66666666-6666-6666-6666-666666666608', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222203', now(), now()),
    ('77777777-7777-7777-7777-777777777791', '66666666-6666-6666-6666-666666666609', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222201', now(), now()),
    ('77777777-7777-7777-7777-7777777777a1', '66666666-6666-6666-6666-666666666610', '1.0.0', 0, false, false, '22222222-2222-2222-2222-222222222202', now(), now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO app_steps (id, app_version_id, task_id, step) VALUES
    ('88888888-8888-8888-8888-888888888801', '77777777-7777-7777-7777-777777777701', '55555555-5555-5555-5555-555555555501', 0),
    ('88888888-8888-8888-8888-888888888802', '77777777-7777-7777-7777-777777777702', '55555555-5555-5555-5555-555555555502', 0),
    ('88888888-8888-8888-8888-888888888803', '77777777-7777-7777-7777-777777777703', '55555555-5555-5555-5555-555555555503', 0),
    ('88888888-8888-8888-8888-888888888804', '77777777-7777-7777-7777-777777777704', '55555555-5555-5555-5555-555555555504', 0),
    ('88888888-8888-8888-8888-888888888805', '77777777-7777-7777-7777-777777777705', '55555555-5555-5555-5555-555555555505', 0),
    ('88888888-8888-8888-8888-888888888861', '77777777-7777-7777-7777-777777777761', '55555555-5555-5555-5555-555555555501', 0),
    ('88888888-8888-8888-8888-888888888862', '77777777-7777-7777-7777-777777777762', '55555555-5555-5555-5555-555555555501', 0),
    ('88888888-8888-8888-8888-888888888863', '77777777-7777-7777-7777-777777777763', '55555555-5555-5555-5555-555555555501', 0),
    ('88888888-8888-8888-8888-888888888871', '77777777-7777-7777-7777-777777777771', '55555555-5555-5555-5555-555555555506', 0),
    ('88888888-8888-8888-8888-888888888881', '77777777-7777-7777-7777-777777777781', '55555555-5555-5555-5555-555555555507', 0),
    ('88888888-8888-8888-8888-888888888891', '77777777-7777-7777-7777-777777777791', '55555555-5555-5555-5555-555555555508', 0),
    ('88888888-8888-8888-8888-888888888892', '77777777-7777-7777-7777-777777777791', '55555555-5555-5555-5555-555555555509', 1),
    ('88888888-8888-8888-8888-8888888888a1', '77777777-7777-7777-7777-7777777777a1', '55555555-5555-5555-5555-555555555510', 0)
ON CONFLICT (id) DO NOTHING;

-- Basic parameter group + two parameters (file input + text) for apps 1-5.
INSERT INTO parameter_groups (id, task_id, name, label, description, display_order) VALUES
    ('99999999-9999-9999-9999-999999999901', '55555555-5555-5555-5555-555555555501', 'Parameters', 'Parameters', 'Inputs for Test App 1', 0),
    ('99999999-9999-9999-9999-999999999902', '55555555-5555-5555-5555-555555555502', 'Parameters', 'Parameters', 'Inputs for Test App 2', 0),
    ('99999999-9999-9999-9999-999999999903', '55555555-5555-5555-5555-555555555503', 'Parameters', 'Parameters', 'Inputs for Test App 3', 0),
    ('99999999-9999-9999-9999-999999999904', '55555555-5555-5555-5555-555555555504', 'Parameters', 'Parameters', 'Inputs for Test App 4', 0),
    ('99999999-9999-9999-9999-999999999905', '55555555-5555-5555-5555-555555555505', 'Parameters', 'Parameters', 'Inputs for Test Interactive App', 0)
ON CONFLICT (id) DO NOTHING;

INSERT INTO parameters (id, parameter_group_id, name, label, ordering, display_order, parameter_type, required, description) VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa011', '99999999-9999-9999-9999-999999999901', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput' LIMIT 1), true,  'Input file for Test App 1'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa012', '99999999-9999-9999-9999-999999999901', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text' LIMIT 1),      false, 'Sample name for Test App 1'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa021', '99999999-9999-9999-9999-999999999902', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput' LIMIT 1), true,  'Input file for Test App 2'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa022', '99999999-9999-9999-9999-999999999902', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text' LIMIT 1),      false, 'Sample name for Test App 2'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa031', '99999999-9999-9999-9999-999999999903', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput' LIMIT 1), true,  'Input file for Test App 3'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa032', '99999999-9999-9999-9999-999999999903', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text' LIMIT 1),      false, 'Sample name for Test App 3'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa041', '99999999-9999-9999-9999-999999999904', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput' LIMIT 1), true,  'Input file for Test App 4'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa042', '99999999-9999-9999-9999-999999999904', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text' LIMIT 1),      false, 'Sample name for Test App 4'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa051', '99999999-9999-9999-9999-999999999905', '-i', 'Input file',  0, 0, (SELECT id FROM parameter_types WHERE name = 'FileInput' LIMIT 1), true,  'Input file for Test Interactive App'),
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa052', '99999999-9999-9999-9999-999999999905', '-n', 'Sample name', 1, 1, (SELECT id FROM parameter_types WHERE name = 'Text' LIMIT 1),      false, 'Sample name for Test Interactive App')
ON CONFLICT (id) DO NOTHING;

INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id) VALUES
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb001', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa011', (SELECT id FROM info_type WHERE name = 'File' LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file' LIMIT 1)),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb002', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa021', (SELECT id FROM info_type WHERE name = 'File' LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file' LIMIT 1)),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb003', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa031', (SELECT id FROM info_type WHERE name = 'File' LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file' LIMIT 1)),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb004', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa041', (SELECT id FROM info_type WHERE name = 'File' LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file' LIMIT 1)),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbb005', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaa051', (SELECT id FROM info_type WHERE name = 'File' LIMIT 1), (SELECT id FROM data_formats WHERE name = 'Unspecified' LIMIT 1), (SELECT id FROM data_source WHERE name = 'file' LIMIT 1))
ON CONFLICT (id) DO NOTHING;

COMMIT;
