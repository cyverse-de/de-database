SET search_path = public, pg_catalog;

ALTER TABLE requests
    ADD CONSTRAINT requests_request_type_id_fkey
    FOREIGN KEY (request_type_id)
    REFERENCES request_types(id) ON DELETE CASCADE;

ALTER TABLE requests
    ADD CONSTRAINT requests_requesting_user_id_fkey
    FOREIGN KEY (requesting_user_id)
    REFERENCES users(id) ON DELETE CASCADE;
