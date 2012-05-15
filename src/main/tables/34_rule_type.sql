SET search_path = public, pg_catalog;

--
-- Name: rule_type; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE rule_type (
    hid bigint NOT NULL,
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    label character varying(255),
    deprecated boolean DEFAULT false,
    display_order integer DEFAULT 999,
    rule_description_format character varying(255) DEFAULT ''::character varying,
    rule_subtype_id bigint
);
