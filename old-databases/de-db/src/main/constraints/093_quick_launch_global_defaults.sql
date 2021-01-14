SET search_path = public, pg_catalog;

ALTER TABLE quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

ALTER TABLE quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id);

ALTER TABLE quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_app_id_unique
    UNIQUE (app_id);

ALTER TABLE quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_quick_launch_id_unique
    UNIQUE (quick_launch_id);
