BEGIN;

SET search_path = public, pg_catalog;

--
-- Newer versions of Keycloak don't always use UUIDs for session IDs.
-- Convert session_id column from uuid type to text to support both UUID and non-UUID session IDs.
--
ALTER TABLE ONLY logins
  ALTER COLUMN session_id DROP DEFAULT,
  ALTER COLUMN session_id TYPE text USING CAST(session_id AS text);

COMMIT;
