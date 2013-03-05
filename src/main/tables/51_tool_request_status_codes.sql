SET search_path = public, pg_catalog;

--
-- The identifier sequence for the tool_request_status_codes table.
--
CREATE SEQUENCE tool_request_status_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;

--
-- A table defining the set of available tool request status codes.
--
CREATE TABLE tool_request_status_codes (
    id BIGINT DEFAULT nextval('tool_request_status_codes_id_seq'::regclass) NOT NULL,
    name VARCHAR(16) NOT NULL,
    description VARCHAR(128) NOT NULL,
    PRIMARY KEY(id)
);

--
-- All tool request status code names should be unique.
--
CREATE UNIQUE INDEX tool_request_status_codes_name_index
    on tool_request_status_codes (name);
