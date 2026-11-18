BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE IF EXISTS ONLY parameters
    DROP IF EXISTS is_sensitive CASCADE;

COMMIT;
