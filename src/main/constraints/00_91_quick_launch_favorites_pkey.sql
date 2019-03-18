SET search_path = public, pg_catalog;

ALTER TABLE ONLY quick_launch_favorites
    ADD CONSTRAINT quick_launch_favorites_id_pkey
    PRIMARY KEY(id);
