\set ON_ERROR_STOP ON

BEGIN;

ALTER TABLE transformation_activity ADD COLUMN integration_date TIMESTAMP;

COMMIT;