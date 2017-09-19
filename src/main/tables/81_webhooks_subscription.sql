SET search_path = public, pg_catalog;

--
-- webhooks_user_subscription table
--
CREATE TABLE webhooks_subscription (
  webhook_id uuid NOT NULL,
  topic_id uuid NOT NULL
);
