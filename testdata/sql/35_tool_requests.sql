-- Tool installation requests with status histories. tool_architectures and
-- tool_request_status_codes are migration-seeded and referenced by natural key.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO tool_requests
    (id, tool_name, description, source_url, doc_url, version, attribution, multithreaded,
     test_data_path, instructions, additional_info, requestor_id, tool_architecture_id) VALUES
    ('f5a00000-0000-0000-0000-000000000001', 'Requested Tool A', 'Please install tool A',
        'https://example.org/tool-a/source', 'https://example.org/tool-a/docs', '1.0.0', 'Test Author A', false,
        '/iplant/home/testuser01/tool-a-test', 'Run with default options', NULL,
        '11111111-1111-1111-1111-111111111101', (SELECT id FROM tool_architectures WHERE name ILIKE '%64%' LIMIT 1)),
    ('f5a00000-0000-0000-0000-000000000002', 'Requested Tool B', 'Please install tool B',
        'https://example.org/tool-b/source', 'https://example.org/tool-b/docs', '2.3.1', 'Test Author B', true,
        '/iplant/home/testuser02/tool-b-test', 'Requires GPU', NULL,
        '11111111-1111-1111-1111-111111111102', (SELECT id FROM tool_architectures WHERE name ILIKE '%64%' LIMIT 1))
ON CONFLICT (id) DO NOTHING;

-- Request A progressed Submitted -> Completion; request B is still Submitted.
INSERT INTO tool_request_statuses (id, tool_request_id, tool_request_status_code_id, updater_id, comments, date_assigned) VALUES
    ('f5b00000-0000-0000-0000-000000000001', 'f5a00000-0000-0000-0000-000000000001', (SELECT id FROM tool_request_status_codes WHERE name = 'Submitted'  LIMIT 1), '11111111-1111-1111-1111-111111111101', 'Request submitted', '2024-05-01 10:00:00'),
    ('f5b00000-0000-0000-0000-000000000002', 'f5a00000-0000-0000-0000-000000000001', (SELECT id FROM tool_request_status_codes WHERE name = 'Completion' LIMIT 1), '11111111-1111-1111-1111-111111111103', 'Tool installed',    '2024-05-03 12:00:00'),
    ('f5b00000-0000-0000-0000-000000000003', 'f5a00000-0000-0000-0000-000000000002', (SELECT id FROM tool_request_status_codes WHERE name = 'Submitted'  LIMIT 1), '11111111-1111-1111-1111-111111111102', 'Request submitted', '2024-05-05 09:00:00')
ON CONFLICT (id) DO NOTHING;

COMMIT;
