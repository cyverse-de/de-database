BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY logins
  DROP COLUMN IF EXISTS session_id,
  ADD COLUMN IF NOT EXISTS user_agent text; 

COMMIT;
