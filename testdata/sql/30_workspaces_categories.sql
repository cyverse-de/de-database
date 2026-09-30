-- Per-user workspaces and the app-category hierarchy. This mirrors the apps
-- service's workspace bootstrap (apps/persistence/workspace.clj + config): each
-- user's workspace has a root category "Workspace" with two subcategories,
-- "Apps under development" at child_index 0 (the dev/private category) and
-- "Favorite Apps" at child_index 1 (the favorites category that drives the
-- is_favorite flag in app_listing). workspace and app_categories reference each
-- other, so workspaces are inserted with a null root and patched afterward.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO workspace (id, user_id, root_category_id, is_public) VALUES
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01', '11111111-1111-1111-1111-111111111101', NULL, false),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02', '11111111-1111-1111-1111-111111111102', NULL, false),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03', '11111111-1111-1111-1111-111111111103', NULL, false),
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeee04', '11111111-1111-1111-1111-111111111104', NULL, false)
ON CONFLICT (id) DO NOTHING;

-- Root + dev (index 0) + favorites (index 1) categories for each user.
INSERT INTO app_categories (id, name, description, workspace_id) VALUES
    ('ca000000-0000-0000-0000-000000000001', 'Workspace',              'Root category for testuser01',     'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01'),
    ('ca000000-0000-0000-0000-000000000101', 'Apps under development', 'Private apps for testuser01',      'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01'),
    ('ca000000-0000-0000-0000-000000000201', 'Favorite Apps',          'Favorites for testuser01',         'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01'),
    ('ca000000-0000-0000-0000-000000000002', 'Workspace',              'Root category for testuser02',     'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02'),
    ('ca000000-0000-0000-0000-000000000102', 'Apps under development', 'Private apps for testuser02',      'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02'),
    ('ca000000-0000-0000-0000-000000000202', 'Favorite Apps',          'Favorites for testuser02',         'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02'),
    ('ca000000-0000-0000-0000-000000000003', 'Workspace',              'Root category for testuser03',     'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03'),
    ('ca000000-0000-0000-0000-000000000103', 'Apps under development', 'Private apps for testuser03',      'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03'),
    ('ca000000-0000-0000-0000-000000000203', 'Favorite Apps',          'Favorites for testuser03',         'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03'),
    ('ca000000-0000-0000-0000-000000000004', 'Workspace',              'Root category for testuser04',     'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee04'),
    ('ca000000-0000-0000-0000-000000000104', 'Apps under development', 'Private apps for testuser04',      'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee04'),
    ('ca000000-0000-0000-0000-000000000204', 'Favorite Apps',          'Favorites for testuser04',         'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee04')
ON CONFLICT (id) DO NOTHING;

UPDATE workspace SET root_category_id = 'ca000000-0000-0000-0000-000000000001' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee01';
UPDATE workspace SET root_category_id = 'ca000000-0000-0000-0000-000000000002' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee02';
UPDATE workspace SET root_category_id = 'ca000000-0000-0000-0000-000000000003' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee03';
UPDATE workspace SET root_category_id = 'ca000000-0000-0000-0000-000000000004' WHERE id = 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeee04';

-- Wire dev (index 0) and favorites (index 1) under each user's root category.
INSERT INTO app_category_group (parent_category_id, child_category_id, child_index) VALUES
    ('ca000000-0000-0000-0000-000000000001', 'ca000000-0000-0000-0000-000000000101', 0),
    ('ca000000-0000-0000-0000-000000000001', 'ca000000-0000-0000-0000-000000000201', 1),
    ('ca000000-0000-0000-0000-000000000002', 'ca000000-0000-0000-0000-000000000102', 0),
    ('ca000000-0000-0000-0000-000000000002', 'ca000000-0000-0000-0000-000000000202', 1),
    ('ca000000-0000-0000-0000-000000000003', 'ca000000-0000-0000-0000-000000000103', 0),
    ('ca000000-0000-0000-0000-000000000003', 'ca000000-0000-0000-0000-000000000203', 1),
    ('ca000000-0000-0000-0000-000000000004', 'ca000000-0000-0000-0000-000000000104', 0),
    ('ca000000-0000-0000-0000-000000000004', 'ca000000-0000-0000-0000-000000000204', 1)
ON CONFLICT (parent_category_id, child_category_id) DO NOTHING;

-- A second public category under the seeded "Public Apps" root (which owns "Beta").
INSERT INTO app_categories (id, name, description, workspace_id)
SELECT 'cb000000-0000-0000-0000-000000000001', 'Bioinformatics', 'Public bioinformatics apps', workspace_id
FROM app_categories WHERE name = 'Beta' LIMIT 1
ON CONFLICT (id) DO NOTHING;

INSERT INTO app_category_group (parent_category_id, child_category_id, child_index)
SELECT (SELECT id FROM app_categories WHERE name = 'Public Apps' LIMIT 1), 'cb000000-0000-0000-0000-000000000001', 1
ON CONFLICT (parent_category_id, child_category_id) DO NOTHING;

-- Categorize apps: favorites + dev (private) for users, and public placements.
INSERT INTO app_category_app (app_category_id, app_id) VALUES
    ('ca000000-0000-0000-0000-000000000201', '66666666-6666-6666-6666-666666666601'),  -- testuser01 favorite
    ('ca000000-0000-0000-0000-000000000101', '66666666-6666-6666-6666-666666666606'),  -- testuser01 private (versioned app)
    ('ca000000-0000-0000-0000-000000000102', '66666666-6666-6666-6666-666666666603'),  -- testuser02 private
    ('cb000000-0000-0000-0000-000000000001', '66666666-6666-6666-6666-666666666603'),  -- Bioinformatics (public)
    ('cb000000-0000-0000-0000-000000000001', '66666666-6666-6666-6666-666666666610')   -- Bioinformatics (public)
ON CONFLICT (app_category_id, app_id) DO NOTHING;

-- Publish apps to the seeded public "Beta" category.
INSERT INTO app_category_app (app_category_id, app_id)
SELECT (SELECT id FROM app_categories WHERE name = 'Beta' LIMIT 1), app_id
FROM (VALUES
    ('66666666-6666-6666-6666-666666666601'::uuid),
    ('66666666-6666-6666-6666-666666666602'::uuid),
    ('66666666-6666-6666-6666-666666666609'::uuid)) AS v(app_id)
ON CONFLICT (app_category_id, app_id) DO NOTHING;

-- A suggested category for an app (admin categorization hint).
INSERT INTO suggested_groups (app_id, app_category_id)
SELECT '66666666-6666-6666-6666-666666666604', id FROM app_categories WHERE name = 'Beta' LIMIT 1
ON CONFLICT (app_id, app_category_id) DO NOTHING;

COMMIT;
