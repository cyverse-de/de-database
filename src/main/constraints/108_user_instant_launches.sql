SET search_path = public, pg_catalog;

ALTER TABLE user_instant_launches
    ADD CONSTRAINT user_instant_launches_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE user_instant_launches
    ADD CONSTRAINT user_instant_launches_added_by_fkey
    FOREIGN KEY (added_by)
    REFERENCES users(id);