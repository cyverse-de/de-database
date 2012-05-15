SET search_path = public, pg_catalog;

--
-- Name: dataobjects; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE dataobjects (
    hid bigint NOT NULL,
    id character varying(255),
    name character varying(255),
    label character varying(255),
    orderd integer,
    switch character varying(255),
    info_type bigint,
    data_format bigint,
    description character varying(255),
    required boolean DEFAULT true,
    multiplicity bigint,
    retain boolean DEFAULT false,
    is_implicit boolean DEFAULT false
);
