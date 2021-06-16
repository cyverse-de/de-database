BEGIN;

SET search_path = public, pg_catalog;

-- Remove the `maximum_requests_per_user` column from the `request_types` table.
ALTER TABLE IF EXISTS request_types
DROP COLUMN IF EXISTS maximum_requests_per_user;

COMMIT
