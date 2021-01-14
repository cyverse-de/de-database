SET search_path = public, pg_catalog;

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey
    PRIMARY KEY(id);
