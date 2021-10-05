BEGIN;
    CREATE SCHEMA IF NOT EXISTS metadata;
    SET search_path = metadata, public, pg_catalog;
COMMIT;
