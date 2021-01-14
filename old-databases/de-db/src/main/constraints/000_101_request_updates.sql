SET search_path = public, pg_catalog;

ALTER TABLE ONLY request_updates
    ADD CONSTRAINT request_updates_pkey
    PRIMARY KEY(id);
