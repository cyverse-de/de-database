-- App publication requests with status histories, plus additional app ratings so
-- multiple apps have multi-user averages in app_listing / rating_listing.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO app_publication_requests (id, requestor_id, app_id) VALUES
    ('f6a00000-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666601'),
    ('f6a00000-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111102', '66666666-6666-6666-6666-666666666603')
ON CONFLICT (id) DO NOTHING;

INSERT INTO app_publication_request_statuses (id, app_publication_request_id, app_publication_request_status_code_id, updater_id, comments, date_assigned) VALUES
    ('f6b00000-0000-0000-0000-000000000001', 'f6a00000-0000-0000-0000-000000000001', (SELECT id FROM app_publication_request_status_codes WHERE name = 'Submitted'  LIMIT 1), '11111111-1111-1111-1111-111111111101', 'Publication requested', '2024-05-10 10:00:00'),
    ('f6b00000-0000-0000-0000-000000000002', 'f6a00000-0000-0000-0000-000000000002', (SELECT id FROM app_publication_request_status_codes WHERE name = 'Submitted'  LIMIT 1), '11111111-1111-1111-1111-111111111102', 'Publication requested', '2024-05-11 10:00:00'),
    ('f6b00000-0000-0000-0000-000000000003', 'f6a00000-0000-0000-0000-000000000002', (SELECT id FROM app_publication_request_status_codes WHERE name = 'Completion' LIMIT 1), '11111111-1111-1111-1111-111111111103', 'Published', '2024-05-12 15:00:00')
ON CONFLICT (id) DO NOTHING;

-- Additional ratings (public.ratings is UNIQUE on (user_id, app_id)).
INSERT INTO ratings (id, user_id, app_id, rating) VALUES
    ('a1a1a1a1-0000-0000-0000-000000000004', '11111111-1111-1111-1111-111111111105', '66666666-6666-6666-6666-666666666602', 4),
    ('a1a1a1a1-0000-0000-0000-000000000005', '11111111-1111-1111-1111-111111111106', '66666666-6666-6666-6666-666666666603', 5),
    ('a1a1a1a1-0000-0000-0000-000000000006', '11111111-1111-1111-1111-111111111107', '66666666-6666-6666-6666-666666666603', 3),
    ('a1a1a1a1-0000-0000-0000-000000000007', '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666606', 5)
ON CONFLICT (id) DO NOTHING;

COMMIT;
