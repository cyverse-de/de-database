SET search_path = public, pg_catalog;

--
-- hid SERIAL type for genome_ref table
--
CREATE SEQUENCE genome_ref_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- template_group table
--
CREATE TABLE genome_reference (
    id bigint DEFAULT nextval('genome_ref_id_seq'::regclass) NOT NULL,
    uuid bigint NOT NULL,
    path character varying(1024) NOT NULL,
    deleted boolean NOT NULL,
    created_by bigint references users(id),
    created_on date NOT NULL,
    last_modified_by bigint references users(id),
    last_modified_on date,
    PRIMARY KEY (id)
);

