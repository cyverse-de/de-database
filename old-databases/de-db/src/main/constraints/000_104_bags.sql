SET search_path = public, pg_catalog;

ALTER TABLE ONLY bags
    ADD CONSTRAINT bags_pkey
    PRIMARY KEY(id);