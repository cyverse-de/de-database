SET search_path = public, pg_catalog;

ALTER TABLE ONLY user_instant_launches
    ADD CONSTRAINT user_instant_launches_pkey
    PRIMARY KEY(id);