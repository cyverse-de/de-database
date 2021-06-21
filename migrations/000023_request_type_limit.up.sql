BEGIN;

SET search_path = public, pg_catalog;

-- Add the `maximum_requests_per_user` and `maximum_concurrent_requests_per_user` columns to the `request_types` table.
ALTER TABLE IF EXISTS request_types
ADD COLUMN IF NOT EXISTS maximum_requests_per_user int;
ALTER TABLE IF EXISTS request_types
ADD COLUMN IF NOT EXISTS maximum_concurrent_requests_per_user int;

-- Set the initial limits for VICE access requests if the request type exists.
UPDATE request_types
SET maximum_requests_per_user = 10, maximum_concurrent_requests_per_user = 1
WHERE name = 'vice';

COMMIT
