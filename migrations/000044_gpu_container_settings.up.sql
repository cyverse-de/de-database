BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY container_settings
  ADD IF NOT EXISTS min_gpus integer;

ALTER TABLE IF EXISTS ONLY container_settings
  ADD IF NOT EXISTS max_gpus integer;

COMMIT;
