BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY notif_statuses ALTER COLUMN periodic_warning_period TYPE integer USING NULL;

COMMIT;
