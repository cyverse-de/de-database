SET search_path = public, pg_catalog;

--
-- Primary key constraint for the docker_registries table.
--
ALTER TABLE ONLY docker_registries
    ADD CONSTRAINT docker_registries_pkey
    PRIMARY KEY(name);
