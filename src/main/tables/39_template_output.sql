SET search_path = public, pg_catalog;

--
-- Name: template_output; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE template_output (
    template_id bigint NOT NULL,
    output_id bigint NOT NULL,
    hid integer NOT NULL
);
