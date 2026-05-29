-- Per-user workspaces and app categories. workspace and app_categories reference
-- each other (workspace.root_category_id <-> app_categories.workspace_id), so the
-- workspace rows are inserted first with a null root and patched afterward. A few
-- synthetic apps are also published into the migration-seeded public "Beta"
-- category so they show up in the public app listing.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO workspace (id, user_id, root_category_id, is_public) VALUES
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01', '11111111-1111-1111-1111-111111111101', NULL, false),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02', '11111111-1111-1111-1111-111111111102', NULL, false),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03', '11111111-1111-1111-1111-111111111103', NULL, false)
ON CONFLICT (id) DO NOTHING;

INSERT INTO app_categories (id, name, description, workspace_id) VALUES
    ('ffffffff-ffff-ffff-ffff-fffffffff001', 'Workspace', 'Root category for testuser01', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01'),
    ('ffffffff-ffff-ffff-ffff-fffffffff101', 'Applications', 'Apps owned by testuser01', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01'),
    ('ffffffff-ffff-ffff-ffff-fffffffff002', 'Workspace', 'Root category for testuser02', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02'),
    ('ffffffff-ffff-ffff-ffff-fffffffff102', 'Applications', 'Apps owned by testuser02', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02'),
    ('ffffffff-ffff-ffff-ffff-fffffffff003', 'Workspace', 'Root category for testuser03', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03'),
    ('ffffffff-ffff-ffff-ffff-fffffffff103', 'Applications', 'Apps owned by testuser03', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03')
ON CONFLICT (id) DO NOTHING;

UPDATE workspace SET root_category_id = 'ffffffff-ffff-ffff-ffff-fffffffff001' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01';
UPDATE workspace SET root_category_id = 'ffffffff-ffff-ffff-ffff-fffffffff002' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02';
UPDATE workspace SET root_category_id = 'ffffffff-ffff-ffff-ffff-fffffffff003' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03';

INSERT INTO app_category_group (parent_category_id, child_category_id, child_index) VALUES
    ('ffffffff-ffff-ffff-ffff-fffffffff001', 'ffffffff-ffff-ffff-ffff-fffffffff101', 0),
    ('ffffffff-ffff-ffff-ffff-fffffffff002', 'ffffffff-ffff-ffff-ffff-fffffffff102', 0),
    ('ffffffff-ffff-ffff-ffff-fffffffff003', 'ffffffff-ffff-ffff-ffff-fffffffff103', 0)
ON CONFLICT (parent_category_id, child_category_id) DO NOTHING;

INSERT INTO app_category_app (app_category_id, app_id) VALUES
    ('ffffffff-ffff-ffff-ffff-fffffffff101', '66666666-6666-6666-6666-666666666601'),
    ('ffffffff-ffff-ffff-ffff-fffffffff101', '66666666-6666-6666-6666-666666666602'),
    ('ffffffff-ffff-ffff-ffff-fffffffff102', '66666666-6666-6666-6666-666666666603'),
    ('ffffffff-ffff-ffff-ffff-fffffffff102', '66666666-6666-6666-6666-666666666604'),
    ('ffffffff-ffff-ffff-ffff-fffffffff103', '66666666-6666-6666-6666-666666666605')
ON CONFLICT (app_category_id, app_id) DO NOTHING;

-- Publish Test App 1 to the seeded public "Beta" category.
INSERT INTO app_category_app (app_category_id, app_id)
SELECT id, '66666666-6666-6666-6666-666666666601' FROM app_categories WHERE name = 'Beta'
ON CONFLICT (app_category_id, app_id) DO NOTHING;

COMMIT;
