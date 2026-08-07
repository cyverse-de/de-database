-- Quick launches (saved app configurations) and instant launches (quick launches
-- promoted to one-click buttons). A quick_launch points at a submissions row via
-- submission_id (NOT NULL), so the submissions are inserted first.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO submissions (id, submission) VALUES
    ('a5a5a5a5-0000-0000-0000-000000000001',
        '{"app_id":"66666666-6666-6666-6666-666666666601","app_version_id":"77777777-7777-7777-7777-777777777701","system_id":"de","name":"Test App 1 quick launch","description":"","notify":true,"debug":false,"create_output_subdir":true,"output_dir":"/iplant/home/testuser01/analyses","archive_logs":true,"config":{},"requirements":[]}'),
    ('a5a5a5a5-0000-0000-0000-000000000002',
        '{"app_id":"66666666-6666-6666-6666-666666666602","app_version_id":"77777777-7777-7777-7777-777777777702","system_id":"de","name":"Test App 2 quick launch","description":"","notify":true,"debug":false,"create_output_subdir":true,"output_dir":"/iplant/home/testuser01/analyses","archive_logs":true,"config":{},"requirements":[]}'),
    ('a5a5a5a5-0000-0000-0000-000000000003',
        '{"app_id":"66666666-6666-6666-6666-666666666605","app_version_id":"77777777-7777-7777-7777-777777777705","system_id":"interactive","name":"Interactive app quick launch","description":"","notify":true,"debug":false,"create_output_subdir":true,"output_dir":"/iplant/home/testuser03/analyses","archive_logs":true,"config":{},"requirements":[]}')
ON CONFLICT (id) DO NOTHING;

INSERT INTO quick_launches (id, name, description, creator, app_id, app_version_id, submission_id, is_public) VALUES
    ('f1f1f1f1-0000-0000-0000-000000000001', 'Test App 1 Quick Launch', 'Public quick launch for Test App 1',
        '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666601', '77777777-7777-7777-7777-777777777701', 'a5a5a5a5-0000-0000-0000-000000000001', true),
    ('f1f1f1f1-0000-0000-0000-000000000002', 'Test App 2 Quick Launch', 'Private quick launch for Test App 2',
        '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666602', '77777777-7777-7777-7777-777777777702', 'a5a5a5a5-0000-0000-0000-000000000002', false),
    ('f1f1f1f1-0000-0000-0000-000000000003', 'Interactive App Quick Launch', 'Public quick launch for the interactive app',
        '11111111-1111-1111-1111-111111111103', '66666666-6666-6666-6666-666666666605', '77777777-7777-7777-7777-777777777705', 'a5a5a5a5-0000-0000-0000-000000000003', true)
ON CONFLICT (id) DO NOTHING;

INSERT INTO instant_launches (id, quick_launch_id, added_by) VALUES
    ('f2f2f2f2-0000-0000-0000-000000000001', 'f1f1f1f1-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111101'),
    ('f2f2f2f2-0000-0000-0000-000000000002', 'f1f1f1f1-0000-0000-0000-000000000003', '11111111-1111-1111-1111-111111111103')
ON CONFLICT (id) DO NOTHING;

COMMIT;
