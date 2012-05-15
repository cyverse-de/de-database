SET search_path = public, pg_catalog;

--
-- Name: info_type; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE info_type (
    hid bigint NOT NULL,
    id character varying(40) NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(255),
    description character varying(255),
    deprecated boolean DEFAULT false,
    display_order integer DEFAULT 999
);
