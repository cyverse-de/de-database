BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY container_settings
 DROP IF EXISTS min_gpus;

ALTER TABLE IF EXISTS ONLY container_settings
 DROP IF EXISTS max_gpus;

COMMIT;
