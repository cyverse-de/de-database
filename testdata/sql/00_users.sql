-- Synthetic, anonymized users. All values are invented; none are copied from any
-- real deployment. DE usernames carry an @domain; the permissions schema stores
-- the bare username (see 80_permissions.sql).
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO users (id, username) VALUES
    ('11111111-1111-1111-1111-111111111101', 'testuser01@example.org'),
    ('11111111-1111-1111-1111-111111111102', 'testuser02@example.org'),
    ('11111111-1111-1111-1111-111111111103', 'testuser03@example.org'),
    ('11111111-1111-1111-1111-111111111104', 'testuser04@example.org'),
    ('11111111-1111-1111-1111-111111111105', 'testuser05@example.org'),
    ('11111111-1111-1111-1111-111111111106', 'testuser06@example.org'),
    ('11111111-1111-1111-1111-111111111107', 'testuser07@example.org'),
    ('11111111-1111-1111-1111-111111111108', 'testuser08@example.org'),
    ('11111111-1111-1111-1111-111111111109', 'testuser09@example.org'),
    ('11111111-1111-1111-1111-111111111110', 'testuser10@example.org')
ON CONFLICT (id) DO NOTHING;

COMMIT;
