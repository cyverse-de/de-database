SET search_path = public, pg_catalog;

ALTER TABLE ONLY request_types
    ADD CONSTRAINT request_types_pkey
    PRIMARY KEY(id);
