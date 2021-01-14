SET search_path = public, pg_catalog;

ALTER TABLE request_types
    ADD CONSTRAINT request_types_name_unique
    UNIQUE (name);
