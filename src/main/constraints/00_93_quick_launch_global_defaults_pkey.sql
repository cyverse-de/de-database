SET search_path = public, pg_catalog;

ALTER TABLE ONLY quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_id_pkey
    PRIMARY KEY(id);
