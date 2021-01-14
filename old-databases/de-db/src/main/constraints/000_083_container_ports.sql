SET search_path = public, pg_catalog;

ALTER TABLE ONLY container_ports
    ADD CONSTRAINT container_ports_id_pkey
    PRIMARY KEY(id);
