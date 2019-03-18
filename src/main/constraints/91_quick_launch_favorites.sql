SET search_path = public, pg_catalog;

ALTER TABLE ONLY quick_launch_favorites
    ADD CONSTRAINT quick_launch_favorites_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id);

ALTER TABLE ONLY quick_launch_favorites
    ADD CONSTRAINT quick_launch_favorites_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);
