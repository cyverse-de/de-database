-- Test-only database login role for the metadata service.
--
-- The metadata service (cyverse-de/metadata) references its tables unqualified
-- (:avus, :tags, :comments, :ratings, ...) and has no schema/search_path config —
-- it just picks a database name. In the consolidated DE schema those tables live
-- in the `metadata` schema of the `de` database, and some names (ratings,
-- comments) also exist in `public`, so the service must resolve `metadata` first.
--
-- This role logs in to the `de` database with search_path = metadata, public so
-- unqualified queries hit the metadata schema. It is separate from the `de` role
-- (which the apps service uses with a public-first search) to avoid the name
-- collisions. Throwaway credentials for the public test image only.
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'metadata') THEN
        CREATE ROLE metadata LOGIN PASSWORD 'metadata';
    END IF;
END$$;

ALTER ROLE metadata SET search_path = metadata, public, pg_catalog;

GRANT USAGE ON SCHEMA metadata TO metadata;
GRANT USAGE ON SCHEMA public TO metadata;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA metadata TO metadata;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA metadata TO metadata;

-- Read-only access to public for any shared lookups / extension functions.
GRANT SELECT ON ALL TABLES IN SCHEMA public TO metadata;
