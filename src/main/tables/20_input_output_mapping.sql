SET search_path = public, pg_catalog;

--
-- Name: input_output_mapping; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE input_output_mapping (
    hid bigint NOT NULL,
    source bigint NOT NULL,
    target bigint NOT NULL
);
