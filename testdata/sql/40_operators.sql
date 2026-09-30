-- VICE operators. base_url is what the job_listings view exposes as
-- operator_base_url for interactive analyses. last_reconciled_at/reconciled_by
-- are left null together to satisfy the operators_reconcile_fields_check.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO operators (id, name, url, base_url, priority) VALUES
    ('cccccccc-cccc-cccc-cccc-cccccccccc01', 'test-operator-1', 'https://operator1.test.example.org', 'https://vice1.test.example.org', 0),
    ('cccccccc-cccc-cccc-cccc-cccccccccc02', 'test-operator-2', 'https://operator2.test.example.org', 'https://vice2.test.example.org', 1)
ON CONFLICT (id) DO NOTHING;

COMMIT;
