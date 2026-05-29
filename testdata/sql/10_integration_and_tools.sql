-- Integration data, container images, tools, and tasks for the synthetic apps.
-- Reference/lookup rows (tool_types, job_types) are seeded by the migrations and
-- are referenced here by natural key rather than by hardcoded UUID.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO integration_data (id, integrator_name, integrator_email, user_id) VALUES
    ('22222222-2222-2222-2222-222222222201', 'Test Integrator One',   'testuser01@example.org', '11111111-1111-1111-1111-111111111101'),
    ('22222222-2222-2222-2222-222222222202', 'Test Integrator Two',   'testuser02@example.org', '11111111-1111-1111-1111-111111111102'),
    ('22222222-2222-2222-2222-222222222203', 'Test Integrator Three', 'testuser03@example.org', '11111111-1111-1111-1111-111111111103')
ON CONFLICT (id) DO NOTHING;

INSERT INTO container_images (id, name, tag, url) VALUES
    ('33333333-3333-3333-3333-333333333301', 'test/tool-one',         '1.0.0',  'https://example.org/test/tool-one'),
    ('33333333-3333-3333-3333-333333333302', 'test/tool-two',         '2.1.0',  'https://example.org/test/tool-two'),
    ('33333333-3333-3333-3333-333333333303', 'test/interactive-app',  'latest', 'https://example.org/test/interactive-app')
ON CONFLICT (id) DO NOTHING;

INSERT INTO tools (id, name, location, description, version, integration_data_id, tool_type_id, container_images_id, interactive) VALUES
    ('44444444-4444-4444-4444-444444444401', 'Test Tool 1', '', 'First synthetic executable tool', '1.0.0',
        '22222222-2222-2222-2222-222222222201', (SELECT id FROM tool_types WHERE name = 'executable'),
        '33333333-3333-3333-3333-333333333301', false),
    ('44444444-4444-4444-4444-444444444402', 'Test Tool 2', '', 'Second synthetic executable tool', '2.1.0',
        '22222222-2222-2222-2222-222222222201', (SELECT id FROM tool_types WHERE name = 'executable'),
        '33333333-3333-3333-3333-333333333302', false),
    ('44444444-4444-4444-4444-444444444403', 'Test Tool 3', '', 'Third synthetic executable tool', '1.0.0',
        '22222222-2222-2222-2222-222222222202', (SELECT id FROM tool_types WHERE name = 'executable'),
        '33333333-3333-3333-3333-333333333301', false),
    ('44444444-4444-4444-4444-444444444404', 'Test Tool 4', '', 'Fourth synthetic executable tool', '0.9.0',
        '22222222-2222-2222-2222-222222222202', (SELECT id FROM tool_types WHERE name = 'executable'),
        NULL, false),
    ('44444444-4444-4444-4444-444444444405', 'Test Interactive Tool', '', 'Synthetic interactive (VICE) tool', 'latest',
        '22222222-2222-2222-2222-222222222203', (SELECT id FROM tool_types WHERE name = 'interactive'),
        '33333333-3333-3333-3333-333333333303', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO tasks (id, name, description, label, tool_id, job_type_id) VALUES
    ('55555555-5555-5555-5555-555555555501', 'Test Task 1', 'Task for Test App 1', 'Test Task 1',
        '44444444-4444-4444-4444-444444444401', (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de')),
    ('55555555-5555-5555-5555-555555555502', 'Test Task 2', 'Task for Test App 2', 'Test Task 2',
        '44444444-4444-4444-4444-444444444402', (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de')),
    ('55555555-5555-5555-5555-555555555503', 'Test Task 3', 'Task for Test App 3', 'Test Task 3',
        '44444444-4444-4444-4444-444444444403', (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de')),
    ('55555555-5555-5555-5555-555555555504', 'Test Task 4', 'Task for Test App 4', 'Test Task 4',
        '44444444-4444-4444-4444-444444444404', (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de')),
    ('55555555-5555-5555-5555-555555555505', 'Test Task 5', 'Task for Test Interactive App', 'Test Task 5',
        '44444444-4444-4444-4444-444444444405', (SELECT id FROM job_types WHERE name = 'Interactive' AND system_id = 'interactive'))
ON CONFLICT (id) DO NOTHING;

COMMIT;
