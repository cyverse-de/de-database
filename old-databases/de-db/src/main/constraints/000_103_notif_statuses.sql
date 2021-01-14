SET search_path = public, pg_catalog;

ALTER TABLE ONLY notif_statuses 
    ADD CONSTRAINT notif_statuses_pkey
    PRIMARY KEY(id);