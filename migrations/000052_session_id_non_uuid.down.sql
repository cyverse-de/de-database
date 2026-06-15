BEGIN;

SET search_path = public, pg_catalog;

--
-- Revert session_id column from text back to uuid type.
--
ALTER TABLE ONLY logins
  ALTER COLUMN session_id TYPE uuid USING CAST(session_id AS uuid);

COMMIT;
