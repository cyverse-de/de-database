-- Integration data, container images, tools, and tasks for the synthetic apps.
-- Reference/lookup rows (tool_types, job_types) are seeded by the migrations and
-- are referenced here by natural key rather than by hardcoded UUID. Natural-key
-- subqueries use LIMIT 1 because a few seeded lookup names are not unique.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO integration_data (id, integrator_name, integrator_email, user_id) VALUES
    ('22222222-2222-2222-2222-222222222201', 'Test Integrator One',   'testuser01@example.org', '11111111-1111-1111-1111-111111111101'),
    ('22222222-2222-2222-2222-222222222202', 'Test Integrator Two',   'testuser02@example.org', '11111111-1111-1111-1111-111111111102'),
    ('22222222-2222-2222-2222-222222222203', 'Test Integrator Three', 'testuser03@example.org', '11111111-1111-1111-1111-111111111103')
ON CONFLICT (id) DO NOTHING;

INSERT INTO container_images (id, name, tag, url, osg_image_path) VALUES
    ('33333333-3333-3333-3333-333333333301', 'test/tool-one',        '1.0.0',  'https://example.org/test/tool-one',        NULL),
    ('33333333-3333-3333-3333-333333333302', 'test/tool-two',        '2.1.0',  'https://example.org/test/tool-two',        NULL),
    ('33333333-3333-3333-3333-333333333303', 'test/interactive-app', 'latest', 'https://example.org/test/interactive-app', NULL),
    ('33333333-3333-3333-3333-333333333304', 'test/osg-tool',        '1.0.0',  'https://example.org/test/osg-tool',        '/cvmfs/singularity.opensciencegrid.org/test/osg-tool:1.0.0')
ON CONFLICT (id) DO NOTHING;

INSERT INTO tools (id, name, location, description, version, integration_data_id, tool_type_id, container_images_id, interactive) VALUES
    ('44444444-4444-4444-4444-444444444401', 'Test Tool 1', '', 'First synthetic executable tool', '1.0.0',
        '22222222-2222-2222-2222-222222222201', (SELECT id FROM tool_types WHERE name = 'executable' LIMIT 1),
        '33333333-3333-3333-3333-333333333301', false),
    ('44444444-4444-4444-4444-444444444402', 'Test Tool 2', '', 'Second synthetic executable tool', '2.1.0',
        '22222222-2222-2222-2222-222222222201', (SELECT id FROM tool_types WHERE name = 'executable' LIMIT 1),
        '33333333-3333-3333-3333-333333333302', false),
    ('44444444-4444-4444-4444-444444444403', 'Test Tool 3', '', 'Third synthetic executable tool', '1.0.0',
        '22222222-2222-2222-2222-222222222202', (SELECT id FROM tool_types WHERE name = 'executable' LIMIT 1),
        '33333333-3333-3333-3333-333333333301', false),
    ('44444444-4444-4444-4444-444444444404', 'Test Tool 4', '', 'Fourth synthetic executable tool', '0.9.0',
        '22222222-2222-2222-2222-222222222202', (SELECT id FROM tool_types WHERE name = 'executable' LIMIT 1),
        NULL, false),
    ('44444444-4444-4444-4444-444444444405', 'Test Interactive Tool', '', 'Synthetic interactive (VICE) tool', 'latest',
        '22222222-2222-2222-2222-222222222203', (SELECT id FROM tool_types WHERE name = 'interactive' LIMIT 1),
        '33333333-3333-3333-3333-333333333303', true),
    ('44444444-4444-4444-4444-444444444406', 'Test OSG Tool', '', 'Synthetic OSG tool', '1.0.0',
        '22222222-2222-2222-2222-222222222203', (SELECT id FROM tool_types WHERE name = 'osg' LIMIT 1),
        '33333333-3333-3333-3333-333333333304', false)
ON CONFLICT (id) DO NOTHING;

-- Tasks. task07 is an external (Agave/HPC-style) task: no local tool, an external_app_id,
-- and the Agave job type, which drives the external_app_count/overall_job_type branches.
INSERT INTO tasks (id, name, description, label, tool_id, external_app_id, job_type_id) VALUES
    ('55555555-5555-5555-5555-555555555501', 'Test Task 1', 'Task for Test App 1', 'Test Task 1',
        '44444444-4444-4444-4444-444444444401', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555502', 'Test Task 2', 'Task for Test App 2', 'Test Task 2',
        '44444444-4444-4444-4444-444444444402', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555503', 'Test Task 3', 'Task for Test App 3', 'Test Task 3',
        '44444444-4444-4444-4444-444444444403', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555504', 'Test Task 4', 'Task for Test App 4', 'Test Task 4',
        '44444444-4444-4444-4444-444444444404', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555505', 'Test Task 5', 'Task for Test Interactive App', 'Test Task 5',
        '44444444-4444-4444-4444-444444444405', NULL, (SELECT id FROM job_types WHERE name = 'Interactive' AND system_id = 'interactive' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555506', 'Test OSG Task', 'Task for Test OSG App', 'Test OSG Task',
        '44444444-4444-4444-4444-444444444406', NULL, (SELECT id FROM job_types WHERE name = 'OSG' AND system_id = 'osg' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555507', 'Test External Task', 'External Agave task for Test External App', 'Test External Task',
        NULL, 'test-agave-app-00000001', (SELECT id FROM job_types WHERE name = 'Agave' AND system_id = 'agave' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555508', 'Pipeline Step One Task', 'First step of the test pipeline', 'Pipeline Step One',
        '44444444-4444-4444-4444-444444444401', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555509', 'Pipeline Step Two Task', 'Second step of the test pipeline', 'Pipeline Step Two',
        '44444444-4444-4444-4444-444444444402', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1)),
    ('55555555-5555-5555-5555-555555555510', 'Parameters Showcase Task', 'Task exercising every parameter type', 'Parameters Showcase',
        '44444444-4444-4444-4444-444444444401', NULL, (SELECT id FROM job_types WHERE name = 'DE' AND system_id = 'de' LIMIT 1))
ON CONFLICT (id) DO NOTHING;

COMMIT;
