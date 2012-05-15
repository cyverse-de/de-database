SET search_path = public, pg_catalog;

--
-- Name: importedworkflow; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE importedworkflow (
    hid bigint NOT NULL,
    importjson text,
    analysisuuid character varying(400),
    datecreated character varying(65)
);
