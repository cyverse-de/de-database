BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY notif_statuses
    DROP COLUMN IF EXISTS last_periodic_warning;

ALTER TABLE ONLY notif_statuses
    DROP COLUMN IF EXISTS periodic_warning_period;

COMMIT;
