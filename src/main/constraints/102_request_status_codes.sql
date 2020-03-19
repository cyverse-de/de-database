SET search_path = public, pg_catalog;

ALTER TABLE request_status_codes
    ADD CONSTRAINT request_status_codes_name_unique
    UNIQUE (name);

ALTER TABLE request_status_codes
    ADD CONSTRAINT request_status_codes_display_name_unique
    UNIQUE (display_name);
