BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY app_versions
    DROP CONSTRAINT IF EXISTS app_versions_app_id_version_order_key;

-- Make the version_order unique constraint deferrable 
-- so that the order can be updated in a transaction.
ALTER TABLE ONLY app_versions
    ADD CONSTRAINT app_versions_app_id_version_order_key
    UNIQUE (app_id, version_order) DEFERRABLE INITIALLY DEFERRED;

COMMIT;
