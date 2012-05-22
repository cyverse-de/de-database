SET search_path = public, pg_catalog;

--
-- A table to perserve desired DataElements (aka DataObjects) used for Tool
-- Integration.
-- 2011/05/11 (alenards)
--
CREATE TABLE dataelementpreservation (
    hid bigint NOT NULL,
    templateuuid character varying(200),
    infotypename character varying(200),
    fileformatname character varying(200),
    datecreated character varying(65)
);
