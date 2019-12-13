SET search_path = public, pg_catalog;
--
-- webhooks_type table unique key.
--
ALTER TABLE ONLY webhooks_type
ADD CONSTRAINT webhooks_type_ukey
unique (type);
