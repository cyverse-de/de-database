SET search_path = public, pg_catalog;

ALTER TABLE request_updates
    ADD CONSTRAINT request_updates_request_id_fkey
    FOREIGN KEY (request_id)
    REFERENCES requests(id) ON DELETE CASCADE;

ALTER TABLE request_updates
    ADD CONSTRAINT request_updates_request_status_code_id_fkey
    FOREIGN KEY (request_status_code_id)
    REFERENCES request_status_codes(id) ON DELETE CASCADE;

ALTER TABLE request_updates
    ADD CONSTRAINT request_updates_updating_user_id_fkey
    FOREIGN KEY (updating_user_id)
    REFERENCES users(id) ON DELETE CASCADE;
