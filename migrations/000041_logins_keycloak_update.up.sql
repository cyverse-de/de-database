BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY logins
 DROP COLUMN IF EXISTS user_agent,
 DROP COLUMN IF EXISTS logout_time,
  ADD COLUMN IF NOT EXISTS session_id uuid;

COMMIT;
