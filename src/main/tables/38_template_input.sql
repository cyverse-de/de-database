SET search_path = public, pg_catalog;

--
-- Name: template_input; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE template_input (
    template_id bigint NOT NULL,
    input_id bigint NOT NULL,
    hid integer NOT NULL
);
