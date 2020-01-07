SET search_path = public, pg_catalog;

--
-- request_status_codes table
--
CREATE TABLE request_status_codes (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL,
    display_name text NOT NULL,
    email_template text NOT NULL
);
