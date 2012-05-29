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
    id int8 DEFAULT PRIMARY KEY nextval('genome_ref_id_seq'::regclass) NOT NULL,
    uuid character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    deleted boolean NOT NULL,
    created_by character varying(255),
    created_on character varying(255) NOT NULL,
    last_modified_by character varying(255),
    last_modified_on DATE
);

