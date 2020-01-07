SET search_path = public, pg_catalog;

ALTER TABLE ONLY request_status_codes
    ADD CONSTRAINT request_status_codes_pkey
    PRIMARY KEY(id);
