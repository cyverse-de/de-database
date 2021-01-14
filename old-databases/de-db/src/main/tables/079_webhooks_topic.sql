SET search_path = public, pg_catalog;

--
-- webhooks topic table
--
CREATE TABLE webhooks_topic (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  topic varchar(1024) NOT NULL
);
