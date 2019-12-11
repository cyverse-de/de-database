SET search_path = public, pg_catalog;

ALTER TABLE ONLY container_ports
    ADD CONSTRAINT container_ports_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE;
