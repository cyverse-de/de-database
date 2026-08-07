-- App documentation and references, keyed by app_version_id. created_by/modified_by
-- are user UUIDs.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO app_documentation (app_version_id, value, created_by, modified_by) VALUES
    ('77777777-7777-7777-7777-777777777701', '# Test App 1\n\nMarkdown documentation for Test App 1.', '11111111-1111-1111-1111-111111111101', '11111111-1111-1111-1111-111111111101'),
    ('77777777-7777-7777-7777-777777777763', '# Test Versioned App 3.0.0\n\nDocs for the latest version.',  '11111111-1111-1111-1111-111111111101', '11111111-1111-1111-1111-111111111101'),
    ('77777777-7777-7777-7777-777777777791', '# Test Pipeline 1\n\nA two-step pipeline.',                   '11111111-1111-1111-1111-111111111101', '11111111-1111-1111-1111-111111111101'),
    ('77777777-7777-7777-7777-7777777777a1', '# Test Parameters App\n\nShowcases every parameter type.',     '11111111-1111-1111-1111-111111111102', '11111111-1111-1111-1111-111111111102')
ON CONFLICT (app_version_id) DO NOTHING;

INSERT INTO app_references (id, app_version_id, reference_text) VALUES
    ('e1000000-0000-0000-0000-000000000001', '77777777-7777-7777-7777-777777777701', 'Test Author A. (2024). A synthetic reference. Journal of Testing, 1(1), 1-10.'),
    ('e1000000-0000-0000-0000-000000000002', '77777777-7777-7777-7777-777777777701', 'https://example.org/test-app-1/docs'),
    ('e1000000-0000-0000-0000-000000000003', '77777777-7777-7777-7777-777777777763', 'Test Author B. (2024). Versioned app methods. Journal of Testing, 2(1), 11-20.')
ON CONFLICT (id) DO NOTHING;

COMMIT;
