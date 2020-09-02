SET search_path = public, pg_catalog;

--
-- Tracks default bags.
--
CREATE TABLE IF NOT EXISTS default_bags (
    user_id UUID NOT NULL,

    bag_id UUID NOT NULL
)