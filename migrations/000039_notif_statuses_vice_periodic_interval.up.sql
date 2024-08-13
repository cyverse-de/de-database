BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY notif_statuses ALTER COLUMN periodic_warning_period TYPE interval USING CASE WHEN periodic_warning_period IS NULL THEN NULL ELSE (periodic_warning_period::text || ' seconds'::text)::interval END;

COMMIT;
