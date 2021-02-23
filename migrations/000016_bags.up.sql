BEGIN;

SET search_path = public, pg_catalog;

-- bags
CREATE TABLE IF NOT EXISTS bags (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Not unique, a user may have multiple bags.
    user_id UUID NOT NULL, 

    contents json NOT NULL,

    PRIMARY KEY (id)
);

ALTER TABLE bags
    ADD CONSTRAINT bags_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;

-- default_bags
CREATE TABLE IF NOT EXISTS default_bags (
    user_id UUID UNIQUE NOT NULL,

    bag_id UUID UNIQUE NOT NULL,

    PRIMARY KEY(user_id, bag_id)
);

ALTER TABLE default_bags
    ADD CONSTRAINT default_bags_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE default_bags
    ADD CONSTRAINT default_bags_bag_id_fkey
    FOREIGN KEY (bag_id)
    REFERENCES bags(id) ON DELETE CASCADE;

COMMIT;
