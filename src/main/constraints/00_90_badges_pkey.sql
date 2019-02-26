SET search_path = public, pg_catalog;

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_id_pkey
    PRIMARY KEY(id);
