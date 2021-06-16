BEGIN;

SET search_path = public, pg_catalog;

-- Add the `maximum_requests_per_user` column to the `request_types` table.
ALTER TABLE IF EXISTS request_types
ADD COLUMN IF NOT EXISTS maximum_requests_per_user int;

-- Set the limit for VICE access request to 1 if the request type exists.
UPDATE request_types
SET maximum_requests_per_user = 1
WHERE name = 'vice';

COMMIT
