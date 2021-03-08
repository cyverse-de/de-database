BEGIN;

SET search_path = public, pg_catalog;

-- bags
CREATE TABLE IF NOT EXISTS bags (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Not unique, a user may have multiple bags.
    user_id UUID NOT NULL, 

    contents json NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

-- default_bags
CREATE TABLE IF NOT EXISTS default_bags (
    user_id UUID UNIQUE NOT NULL,

    bag_id UUID UNIQUE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (bag_id) REFERENCES bags(id) ON DELETE CASCADE,
    PRIMARY KEY(user_id, bag_id)
);

COMMIT;
