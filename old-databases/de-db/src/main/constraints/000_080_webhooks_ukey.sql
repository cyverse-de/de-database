SET search_path = public, pg_catalog;
--
-- webhooks table unique key.
--
ALTER TABLE ONLY webhooks
ADD CONSTRAINT webhooks_ukey
unique (user_id, url);
