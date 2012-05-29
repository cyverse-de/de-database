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
    uuid bigint NOT NULL,
    path character varying(1024) NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_by bigint --references users(id)
    ,
    created_on timestamp DEFAULT now(),
    last_modified_by bigint --references users(id)
    ,
    last_modified_on timestamp,
    PRIMARY KEY (id)
);

