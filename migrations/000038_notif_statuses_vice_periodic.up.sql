BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY notif_statuses
    ADD COLUMN IF NOT EXISTS last_periodic_warning timestamp;

ALTER TABLE ONLY notif_statuses
    ADD COLUMN IF NOT EXISTS periodic_warning_period integer;

COMMIT;
