SET search_path = public, pg_catalog;

--
-- request_types table
--
CREATE TABLE request_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL
);
