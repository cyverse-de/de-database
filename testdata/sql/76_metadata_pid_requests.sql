-- Permanent ID (DOI) requests with status histories.
--
-- permanent_id_request_types and permanent_id_request_status_codes are reference
-- data seeded by migration 000025, so they are referenced here by natural key
-- (DOI; status names Submitted/Approved/Completion/etc.) rather than re-inserted.
-- Requests target data folders (target_type 'folder').
BEGIN;
SET search_path = metadata, public, pg_catalog;

-- Two requests: one approved/completed (full trail), one still pending. The
-- `type` column is a FK to permanent_id_request_types.id.
INSERT INTO metadata.permanent_id_requests (id, requested_by, type, target_id, target_type, original_path, permanent_id) VALUES
    ('44000000-0000-0000-0000-000000000001', 'testuser01@example.org', (SELECT id FROM permanent_id_request_types WHERE type='DOI'),
        'b1000000-0000-0000-0000-000000000001', 'folder', '/iplant/home/testuser01/dataset-1', '10.0000/test.0001'),
    ('44000000-0000-0000-0000-000000000002', 'testuser02@example.org', (SELECT id FROM permanent_id_request_types WHERE type='DOI'),
        'b1000000-0000-0000-0000-000000000002', 'folder', '/iplant/home/testuser02/dataset-2', NULL)
ON CONFLICT (id) DO NOTHING;

-- Status trails. Columns: permanent_id_request (FK), permanent_id_request_status_code (FK), updated_by.
INSERT INTO metadata.permanent_id_request_statuses (id, permanent_id_request, permanent_id_request_status_code, updated_by, comments) VALUES
    ('45000000-0000-0000-0000-000000000001', '44000000-0000-0000-0000-000000000001', (SELECT id FROM permanent_id_request_status_codes WHERE name='Submitted'),  'testuser01@example.org', 'Request submitted'),
    ('45000000-0000-0000-0000-000000000002', '44000000-0000-0000-0000-000000000001', (SELECT id FROM permanent_id_request_status_codes WHERE name='Approved'),   'admin@example.org',      'Approved by curators'),
    ('45000000-0000-0000-0000-000000000003', '44000000-0000-0000-0000-000000000001', (SELECT id FROM permanent_id_request_status_codes WHERE name='Completion'), 'admin@example.org',      'DOI issued'),
    ('45000000-0000-0000-0000-000000000004', '44000000-0000-0000-0000-000000000002', (SELECT id FROM permanent_id_request_status_codes WHERE name='Submitted'),  'testuser02@example.org', 'Request submitted'),
    ('45000000-0000-0000-0000-000000000005', '44000000-0000-0000-0000-000000000002', (SELECT id FROM permanent_id_request_status_codes WHERE name='Pending'),    'admin@example.org',      'Awaiting response')
ON CONFLICT (id) DO NOTHING;

COMMIT;
