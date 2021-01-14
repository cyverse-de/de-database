SET search_path = public, pg_catalog;

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_id_pkey
    PRIMARY KEY(id);
