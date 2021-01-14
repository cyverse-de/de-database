SET search_path = public, pg_catalog;

--
-- requests table
--
CREATE TABLE requests (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    request_type_id uuid NOT NULL,
    requesting_user_id uuid NOT NULL,
    details json NOT NULL
);
