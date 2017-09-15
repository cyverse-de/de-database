SET search_path = public, pg_catalog;

--
-- webhooks topic primary key.
--
ALTER TABLE ONLY webhooks_topic
ADD CONSTRAINT webhooks_topic_pkey
PRIMARY KEY (id);
