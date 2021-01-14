SET search_path = public, pg_catalog;

ALTER TABLE ONLY default_bags
    ADD CONSTRAINT default_bags_pkey
    PRIMARY KEY(user_id, bag_id);