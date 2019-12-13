SET search_path = public, pg_catalog;

--
-- webhooks table
--
CREATE TABLE webhooks (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  user_id uuid NOT NULL,
  url text NOT NULL,
  type_id uuid NOT NULL
);
