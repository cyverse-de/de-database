SET search_path = public, pg_catalog;

--
-- Name: dataelementpreservation; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE dataelementpreservation (
    hid bigint NOT NULL,
    templateuuid character varying(200),
    infotypename character varying(200),
    fileformatname character varying(200),
    datecreated character varying(65)
);
