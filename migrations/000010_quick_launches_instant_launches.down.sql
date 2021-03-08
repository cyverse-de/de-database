BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS default_instant_launches;
DROP TABLE IF EXISTS user_instant_launches;
DROP TABLE IF EXISTS instant_launches;

DROP TABLE IF EXISTS quick_launch_global_defaults;
DROP TABLE IF EXISTS quick_launch_user_defaults;
DROP TABLE IF EXISTS quick_launch_favorites;
DROP TABLE IF EXISTS quick_launches;

DROP TABLE IF EXISTS submissions;

COMMIT;
