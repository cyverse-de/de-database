BEGIN;

SET search_path = permissions, public, pg_catalog;

ALTER TABLE groups DROP COLUMN IF EXISTS members_public;

COMMIT;
