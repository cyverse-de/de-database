SET search_path = public, pg_catalog;

--
-- notification table
--
CREATE TABLE notification (
    hid bigint NOT NULL,
    id character varying(255),
    name character varying(255),
    sender character varying(255),
    type character varying(255)
);
