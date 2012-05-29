SET search_path = public, pg_catalog;

--
-- SEQUENCE psudeo-table for auto-increment ID counter.
--
CREATE SEQUENCE genome_ref_id_seq;

--
-- genome_reference
--
CREATE TABLE genome_reference (
    id bigint DEFAULT nextval('genome_ref_id_seq'),
    uuid varchar(40) NOT NULL,
    name varchar(512) NOT NULL,
    path text NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_by bigint,
    created_on timestamp DEFAULT now() NOT NULL,
    last_modified_by bigint,
    last_modified_on timestamp
);
