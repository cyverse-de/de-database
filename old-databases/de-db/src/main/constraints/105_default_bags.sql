SET search_path = public, pg_catalog;

ALTER TABLE default_bags
    ADD CONSTRAINT default_bags_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE default_bags
    ADD CONSTRAINT default_bags_bag_id_fkey
    FOREIGN KEY (bag_id)
    REFERENCES bags(id) ON DELETE CASCADE;