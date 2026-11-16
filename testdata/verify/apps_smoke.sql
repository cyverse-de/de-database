-- Smoke checks for the apps-service test fixtures. Run against the test database:
--   psql 'postgres://de:de@localhost:5432/de?sslmode=disable' -f testdata/verify/apps_smoke.sql
-- Prints a short report, then a DO block that raises an exception if any core
-- invariant is wrong (so it can gate CI).
\pset pager off
SET search_path = public, pg_catalog;

\echo '== app_listing rows for test apps (per version) =='
SELECT id, name, version, deleted, disabled, step_count, task_count, tool_count, external_app_count, average_rating, total_ratings
FROM app_listing WHERE name LIKE 'Test %' ORDER BY name, version;

\echo '== pipeline app step/task counts (expect 2/2) =='
SELECT name, step_count, task_count FROM app_listing WHERE id = '66666666-6666-6666-6666-666666666609';

\echo '== versioned app versions (expect 1.0.0 deleted, 2.0.0 disabled, 3.0.0 active) =='
SELECT version, version_order, deleted, disabled FROM app_versions WHERE app_id = '66666666-6666-6666-6666-666666666606' ORDER BY version_order;

\echo '== parameter type coverage on the showcase task =='
SELECT pt.name AS parameter_type, count(*)
FROM parameters p
JOIN parameter_groups pg ON pg.id = p.parameter_group_id
JOIN parameter_types pt ON pt.id = p.parameter_type
WHERE pg.task_id = '55555555-5555-5555-5555-555555555510'
GROUP BY pt.name ORDER BY pt.name;

\echo '== favorites: Test App 1 in testuser01 favorites category =='
SELECT u.username, c.name AS category
FROM app_category_app aca
JOIN app_categories c ON c.id = aca.app_category_id
JOIN workspace w ON w.id = c.workspace_id
JOIN users u ON u.id = w.user_id
WHERE aca.app_id = '66666666-6666-6666-6666-666666666601' AND c.name = 'Favorite Apps';

\echo '== tool_listing for test tools =='
SELECT DISTINCT name, version, type FROM tool_listing WHERE name LIKE 'Test %' ORDER BY name;

\echo '== tool requests with status history =='
SELECT tr.tool_name, count(trs.id) AS status_count
FROM tool_requests tr LEFT JOIN tool_request_statuses trs ON trs.tool_request_id = tr.id
WHERE tr.tool_name LIKE 'Requested Tool%' GROUP BY tr.tool_name ORDER BY tr.tool_name;

\echo '== publication requests =='
SELECT count(*) AS publication_requests FROM app_publication_requests;

\echo '== validation rules on showcase params =='
SELECT rt.name AS rule_type, count(vra.id) AS arg_count
FROM validation_rules vr
JOIN rule_type rt ON rt.id = vr.rule_type
LEFT JOIN validation_rule_arguments vra ON vra.rule_id = vr.id
JOIN parameters p ON p.id = vr.parameter_id
JOIN parameter_groups pg ON pg.id = p.parameter_group_id
WHERE pg.task_id = '55555555-5555-5555-5555-555555555510'
GROUP BY rt.name ORDER BY rt.name;

\echo '== ASSERTIONS =='
DO $$
DECLARE
    n integer;
BEGIN
    -- Pipeline app has two steps.
    SELECT step_count INTO n FROM app_listing WHERE id = '66666666-6666-6666-6666-666666666609' LIMIT 1;
    ASSERT n = 2, format('pipeline step_count expected 2, got %s', n);

    -- Versioned app: 3 versions, exactly one active (not deleted, not disabled).
    SELECT count(*) INTO n FROM app_versions WHERE app_id = '66666666-6666-6666-6666-666666666606';
    ASSERT n = 3, format('versioned app expected 3 versions, got %s', n);
    SELECT count(*) INTO n FROM app_versions WHERE app_id = '66666666-6666-6666-6666-666666666606' AND NOT deleted AND NOT disabled;
    ASSERT n = 1, format('versioned app expected 1 active version, got %s', n);

    -- Showcase task exposes at least a dozen distinct parameter types.
    SELECT count(DISTINCT p.parameter_type) INTO n
    FROM parameters p JOIN parameter_groups pg ON pg.id = p.parameter_group_id
    WHERE pg.task_id = '55555555-5555-5555-5555-555555555510';
    ASSERT n >= 12, format('showcase expected >=12 parameter types, got %s', n);

    -- Test App 1 is favorited by testuser01.
    SELECT count(*) INTO n
    FROM app_category_app aca JOIN app_categories c ON c.id = aca.app_category_id
    WHERE aca.app_id = '66666666-6666-6666-6666-666666666601'
      AND c.id = 'ca000000-0000-0000-0000-000000000201';
    ASSERT n = 1, 'Test App 1 should be in testuser01 favorites';

    -- Documentation, references, tool requests, publication requests exist.
    SELECT count(*) INTO n FROM app_documentation; ASSERT n >= 4, 'expected app_documentation rows';
    SELECT count(*) INTO n FROM app_references;     ASSERT n >= 3, 'expected app_references rows';
    SELECT count(*) INTO n FROM tool_requests;      ASSERT n >= 2, 'expected tool_requests';
    SELECT count(*) INTO n FROM app_publication_requests; ASSERT n >= 2, 'expected publication requests';

    -- An external (Agave) task and an OSG tool exist.
    SELECT count(*) INTO n FROM tasks WHERE external_app_id IS NOT NULL;
    ASSERT n >= 1, 'expected an external task';
    SELECT count(*) INTO n FROM tools t JOIN tool_types tt ON tt.id = t.tool_type_id WHERE tt.name = 'osg';
    ASSERT n >= 1, 'expected an OSG tool';

    RAISE NOTICE 'All apps smoke assertions passed.';
END $$;
