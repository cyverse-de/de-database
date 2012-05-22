SET search_path = public, pg_catalog;

--
-- A table to capture raw JSON as it is imported via the `import-workflow`
-- service.
--
CREATE TABLE importedworkflow (
    hid bigint NOT NULL,
    importjson text,
    analysisuuid character varying(400),
    datecreated character varying(65)
);
