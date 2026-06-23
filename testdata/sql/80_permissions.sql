-- Permissions. subjects use the BARE username (no @domain); resources name apps
-- and analyses by their UUID. resource_types (app/analysis) and permission_levels
-- (own/write/read) are seeded by the migrations and referenced by natural key.
BEGIN;
SET search_path = permissions, public, pg_catalog;

INSERT INTO permissions.subjects (id, subject_id, subject_type) VALUES
    ('15151515-0000-0000-0000-000000000001', 'testuser01', 'user'),
    ('15151515-0000-0000-0000-000000000002', 'testuser02', 'user'),
    ('15151515-0000-0000-0000-000000000003', 'testuser03', 'user'),
    ('15151515-0000-0000-0000-000000000004', 'testuser04', 'user'),
    ('15151515-0000-0000-0000-000000000005', 'testuser05', 'user'),
    ('15151515-0000-0000-0000-000000000006', 'testuser06', 'user')
ON CONFLICT (id) DO NOTHING;

-- App resources.
INSERT INTO permissions.resources (id, name, resource_type_id) VALUES
    ('16161616-0000-0000-0000-000000000601', '66666666-6666-6666-6666-666666666601', (SELECT id FROM permissions.resource_types WHERE name='app')),
    ('16161616-0000-0000-0000-000000000602', '66666666-6666-6666-6666-666666666602', (SELECT id FROM permissions.resource_types WHERE name='app')),
    ('16161616-0000-0000-0000-000000000603', '66666666-6666-6666-6666-666666666603', (SELECT id FROM permissions.resource_types WHERE name='app')),
    ('16161616-0000-0000-0000-000000000604', '66666666-6666-6666-6666-666666666604', (SELECT id FROM permissions.resource_types WHERE name='app')),
    ('16161616-0000-0000-0000-000000000605', '66666666-6666-6666-6666-666666666605', (SELECT id FROM permissions.resource_types WHERE name='app')),
-- Analysis resources.
    ('16161616-0000-0000-0000-0000000d0d01', 'dddddddd-dddd-dddd-dddd-dddddddddd01', (SELECT id FROM permissions.resource_types WHERE name='analysis')),
    ('16161616-0000-0000-0000-0000000d0d02', 'dddddddd-dddd-dddd-dddd-dddddddddd02', (SELECT id FROM permissions.resource_types WHERE name='analysis')),
    ('16161616-0000-0000-0000-0000000d0d03', 'dddddddd-dddd-dddd-dddd-dddddddddd03', (SELECT id FROM permissions.resource_types WHERE name='analysis'))
ON CONFLICT (id) DO NOTHING;

INSERT INTO permissions.permissions (id, subject_id, resource_id, permission_level_id) VALUES
    -- App ownership.
    ('17171717-0000-0000-0000-000000000001', '15151515-0000-0000-0000-000000000001', '16161616-0000-0000-0000-000000000601', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-000000000002', '15151515-0000-0000-0000-000000000001', '16161616-0000-0000-0000-000000000602', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-000000000003', '15151515-0000-0000-0000-000000000002', '16161616-0000-0000-0000-000000000603', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-000000000004', '15151515-0000-0000-0000-000000000002', '16161616-0000-0000-0000-000000000604', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-000000000005', '15151515-0000-0000-0000-000000000003', '16161616-0000-0000-0000-000000000605', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    -- App sharing (read).
    ('17171717-0000-0000-0000-000000000006', '15151515-0000-0000-0000-000000000002', '16161616-0000-0000-0000-000000000601', (SELECT id FROM permissions.permission_levels WHERE name='read')),
    ('17171717-0000-0000-0000-000000000007', '15151515-0000-0000-0000-000000000003', '16161616-0000-0000-0000-000000000601', (SELECT id FROM permissions.permission_levels WHERE name='read')),
    -- Analysis ownership.
    ('17171717-0000-0000-0000-000000000008', '15151515-0000-0000-0000-000000000001', '16161616-0000-0000-0000-0000000d0d01', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-000000000009', '15151515-0000-0000-0000-000000000001', '16161616-0000-0000-0000-0000000d0d02', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-00000000000a', '15151515-0000-0000-0000-000000000002', '16161616-0000-0000-0000-0000000d0d03', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    -- Analysis sharing (write).
    ('17171717-0000-0000-0000-00000000000b', '15151515-0000-0000-0000-000000000002', '16161616-0000-0000-0000-0000000d0d01', (SELECT id FROM permissions.permission_levels WHERE name='write'))
ON CONFLICT (id) DO NOTHING;

-- A group subject and resources for the versioned and parameters apps, so the
-- permission-lister and sharing paths have group grants and more apps to report.
INSERT INTO permissions.subjects (id, subject_id, subject_type) VALUES
    ('15151515-0000-0000-0000-0000000000f1', 'test-group-1', 'group')
ON CONFLICT (id) DO NOTHING;

INSERT INTO permissions.resources (id, name, resource_type_id) VALUES
    ('16161616-0000-0000-0000-000000000606', '66666666-6666-6666-6666-666666666606', (SELECT id FROM permissions.resource_types WHERE name='app')),
    ('16161616-0000-0000-0000-000000000610', '66666666-6666-6666-6666-666666666610', (SELECT id FROM permissions.resource_types WHERE name='app'))
ON CONFLICT (id) DO NOTHING;

INSERT INTO permissions.permissions (id, subject_id, resource_id, permission_level_id) VALUES
    ('17171717-0000-0000-0000-00000000000c', '15151515-0000-0000-0000-000000000001', '16161616-0000-0000-0000-000000000606', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-00000000000d', '15151515-0000-0000-0000-000000000002', '16161616-0000-0000-0000-000000000610', (SELECT id FROM permissions.permission_levels WHERE name='own')),
    ('17171717-0000-0000-0000-00000000000e', '15151515-0000-0000-0000-0000000000f1', '16161616-0000-0000-0000-000000000601', (SELECT id FROM permissions.permission_levels WHERE name='read'))
ON CONFLICT (id) DO NOTHING;

COMMIT;
