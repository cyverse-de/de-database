SET search_path = public, pg_catalog;

--
-- request_updates table
--
CREATE TABLE request_updates (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    request_id uuid NOT NULL,
    request_status_code_id uuid NOT NULL,
    updating_user_id uuid NOT NULL,
    created_date timestamp NOT NULL DEFAULT now(),
    message text
);

--
-- Index on request ID and timestamp.
--
CREATE INDEX request_updates_request_id_created_date_index
    ON request_updates(request_id, created_date);
