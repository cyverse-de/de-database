SET search_path = public, pg_catalog;

ALTER TABLE ONLY interactive_apps_proxy_settings
    ADD CONSTRAINT interactive_apps_proxy_settings_id_pkey
    PRIMARY KEY(id);

ALTER TABLE ONLY interactive_apps_proxy_settings
    ADD CONSTRAINT interactive_apps_proxy_settings_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE;
