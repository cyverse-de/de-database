SET search_path = public, pg_catalog;

--
-- webhooks table primary key.
--
ALTER TABLE ONLY webhooks
ADD CONSTRAINT webhooks_pkey
PRIMARY KEY (id);
