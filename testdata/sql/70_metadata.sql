-- App ratings and metadata. public.ratings feeds the app_listing average_rating
-- and the rating_listing view. The metadata schema holds AVUs, tags, comments,
-- favorites, and its own ratings, keyed by target_id + target_type.
BEGIN;

-- public.ratings: numeric app ratings by user.
SET search_path = public, pg_catalog;
INSERT INTO ratings (id, user_id, app_id, rating) VALUES
    ('a1a1a1a1-0000-0000-0000-000000000001', '11111111-1111-1111-1111-111111111102', '66666666-6666-6666-6666-666666666601', 5),
    ('a1a1a1a1-0000-0000-0000-000000000002', '11111111-1111-1111-1111-111111111103', '66666666-6666-6666-6666-666666666601', 4),
    ('a1a1a1a1-0000-0000-0000-000000000003', '11111111-1111-1111-1111-111111111104', '66666666-6666-6666-6666-666666666602', 3)
ON CONFLICT (id) DO NOTHING;

SET search_path = metadata, public, pg_catalog;

INSERT INTO metadata.avus (id, attribute, value, unit, target_id, target_type, created_by, modified_by) VALUES
    ('a2a2a2a2-0000-0000-0000-000000000001', 'topic', 'genomics', '', '66666666-6666-6666-6666-666666666601', 'app',      'testuser01@example.org', 'testuser01@example.org'),
    ('a2a2a2a2-0000-0000-0000-000000000002', 'topic', 'alignment', '', '66666666-6666-6666-6666-666666666602', 'app',     'testuser01@example.org', 'testuser01@example.org'),
    ('a2a2a2a2-0000-0000-0000-000000000003', 'run-note', 'first run', '', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'analysis', 'testuser01@example.org', 'testuser01@example.org')
ON CONFLICT (id) DO NOTHING;

INSERT INTO metadata.tags (id, value, description, owner_id) VALUES
    ('14141414-0000-0000-0000-000000000001', 'genomics',   'Genomics-related apps',   'testuser01@example.org'),
    ('14141414-0000-0000-0000-000000000002', 'favorites',  'Personal favorites',       'testuser02@example.org')
ON CONFLICT (id) DO NOTHING;

INSERT INTO metadata.attached_tags (tag_id, target_id, target_type, attacher_id) VALUES
    ('14141414-0000-0000-0000-000000000001', '66666666-6666-6666-6666-666666666601', 'app', 'testuser01@example.org'),
    ('14141414-0000-0000-0000-000000000002', '66666666-6666-6666-6666-666666666602', 'app', 'testuser02@example.org')
ON CONFLICT DO NOTHING;

INSERT INTO metadata.comments (id, value, owner_id, target_id, target_type) VALUES
    ('c0c0c0c0-0000-0000-0000-000000000001', 'This app worked well for my data.', 'testuser02@example.org', '66666666-6666-6666-6666-666666666601', 'app')
ON CONFLICT (id) DO NOTHING;

INSERT INTO metadata.favorites (target_id, target_type, owner_id) VALUES
    ('66666666-6666-6666-6666-666666666601', 'app', 'testuser01@example.org'),
    ('66666666-6666-6666-6666-666666666603', 'app', 'testuser02@example.org')
ON CONFLICT DO NOTHING;

INSERT INTO metadata.ratings (id, owner_id, target_id, target_type, rating) VALUES
    ('a3a3a3a3-0000-0000-0000-000000000001', 'testuser02@example.org', '66666666-6666-6666-6666-666666666601', 'app', 5)
ON CONFLICT (id) DO NOTHING;

-- AVUs that drive metadata-service-backed apps features (Beta category, ontology
-- hierarchies, communities). These are NOT consulted by the apps service via the
-- database directly; they require the metadata service running against this DB.
-- Attribute IRIs/labels mirror the apps service config (apps.workspace.metadata.*):
-- Beta marker attr "n2t.net/ark:/99152/h1459" = "beta"; ontology category attrs
-- "rdf:type" and "http://edamontology.org/has_topic". See COVERAGE.md.
INSERT INTO metadata.avus (id, attribute, value, unit, target_id, target_type, created_by, modified_by) VALUES
    ('a2a2a2a2-0000-0000-0000-000000000101', 'n2t.net/ark:/99152/h1459', 'beta', '', '66666666-6666-6666-6666-666666666602', 'app', 'testuser01@example.org', 'testuser01@example.org'),
    ('a2a2a2a2-0000-0000-0000-000000000102', 'rdf:type', 'http://edamontology.org/topic_0091', '', '66666666-6666-6666-6666-666666666603', 'app', 'testuser02@example.org', 'testuser02@example.org'),
    ('a2a2a2a2-0000-0000-0000-000000000103', 'http://edamontology.org/has_topic', 'http://edamontology.org/topic_3168', '', '66666666-6666-6666-6666-666666666610', 'app', 'testuser02@example.org', 'testuser02@example.org'),
    ('a2a2a2a2-0000-0000-0000-000000000104', 'cyverse-internal-community', 'Test Community', '', '66666666-6666-6666-6666-666666666601', 'app', 'testuser01@example.org', 'testuser01@example.org')
ON CONFLICT (id) DO NOTHING;

COMMIT;
