SET search_path = public, pg_catalog;

ALTER TABLE ONLY default_instant_launches
    ADD CONSTRAINT default_instant_launches_pky
    PRIMARY KEY(id);