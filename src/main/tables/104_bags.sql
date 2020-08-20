SET search_path = public, pg_catalog;

--
-- Tracks user bags.
--
CREATE TABLE IF NOT EXISTS bags (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Not unique, a user may have multiple bags.
    user_id UUID NOT NULL, 

    contents json NOT NULL
);