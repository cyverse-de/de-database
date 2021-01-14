SET search_path = public, pg_catalog;

ALTER TABLE ONLY instant_launches
    ADD CONSTRAINT instant_launches_pkey
    PRIMARY KEY(id);