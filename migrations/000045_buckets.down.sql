BEGIN;

SET search_path = public, pg_catalog;

-- Drop tables in reverse dependency order
DROP TABLE IF EXISTS job_buckets;
DROP TABLE IF EXISTS bucket_permissions;
DROP TABLE IF EXISTS buckets;

-- Drop custom types
DROP TYPE IF EXISTS bucket_permission_level;

COMMIT;
