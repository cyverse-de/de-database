SET search_path = public, pg_catalog;

--
-- webhooks type table
--
CREATE TABLE webhooks_type (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  type varchar(1024) NOT NULL,
  template text NOT NULL
);
