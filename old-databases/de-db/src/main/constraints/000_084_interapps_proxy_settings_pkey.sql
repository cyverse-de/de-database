SET search_path = public, pg_catalog;

ALTER TABLE ONLY interactive_apps_proxy_settings
    ADD CONSTRAINT interactive_apps_proxy_settings_id_pkey
    PRIMARY KEY(id);
