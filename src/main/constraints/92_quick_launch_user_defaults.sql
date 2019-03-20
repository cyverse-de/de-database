SET search_path = public, pg_catalog;

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_user_id_app_id_unique
    UNIQUE (user_id, app_id);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_user_id_quick_launch_id_unique
    UNIQUE (user_id, quick_launch_id);
