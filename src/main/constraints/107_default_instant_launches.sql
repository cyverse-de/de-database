SET search_path = public, pg_catalog;

ALTER TABLE default_instant_launches
    ADD CONSTRAINT default_instant_launches_added_by_fkey
    FOREIGN KEY (added_by)
    REFERENCES users(id);

ALTER TABLE default_instant_launches
    ADD CONSTRAINT default_instant_launches_id_version_unique
    UNIQUE (id, version);