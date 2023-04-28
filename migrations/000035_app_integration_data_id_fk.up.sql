BEGIN;

SET search_path = public, pg_catalog;

--
-- Foreign Key for `integration_data_id` column in `app_versions` table.
--
ALTER TABLE ONLY app_versions
    ADD CONSTRAINT app_integration_data_id_fk
    FOREIGN KEY (integration_data_id)
    REFERENCES integration_data(id);

CREATE INDEX IF NOT EXISTS app_versions_integration_data_id ON app_versions(integration_data_id);

COMMIT;
