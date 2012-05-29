SET search_path = public, pg_catalog;

--
-- hid SERIAL type for genome_ref table
--
CREATE SEQUENCE genome_ref_id_seq;

--
-- template_group table
--
CREATE TABLE genome_reference (
    id bigint DEFAULT nextval('genome_ref_id_seq'::regclass),
    uuid bigint NOT NULL,
    path character varying(1024) NOT NULL,
    deleted boolean NOT NULL,
    created_by bigint references users(id),
    created_on timestamp DEFAULT now(),
    last_modified_by bigint references users(id),
    last_modified_on timestamp,
    PRIMARY KEY (id)
);

