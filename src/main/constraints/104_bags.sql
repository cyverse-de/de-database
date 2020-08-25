SET search_path = public, pg_catalog;

ALTER TABLE bags
    ADD CONSTRAINT bags_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;