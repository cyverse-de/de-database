SET search_path = public, pg_catalog;

ALTER TABLE ONLY container_settings
    ADD CONSTRAINT container_settings_interactive_apps_proxy_settings_id_fkey
    FOREIGN KEY(interactive_apps_proxy_settings_id)
    REFERENCES interactive_apps_proxy_settings(id) ON DELETE CASCADE;
