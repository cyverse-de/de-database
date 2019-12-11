SET search_path = public, pg_catalog;

ALTER TABLE ONLY submissions
    ADD CONSTRAINT submissions_id_pkey
    PRIMARY KEY(id);
