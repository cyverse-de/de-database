BEGIN;

SET search_path = public, pg_catalog;

-- webhooks_type
CREATE TABLE IF NOT EXISTS webhooks_type (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  type varchar(1024) NOT NULL,
  template text NOT NULL,

  UNIQUE (type),
  PRIMARY KEY (id)
);

-- webhooks
CREATE TABLE IF NOT EXISTS webhooks (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  user_id uuid NOT NULL,
  url text NOT NULL,
  type_id uuid NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (type_id) REFERENCES webhooks_type(id),
  UNIQUE (user_id, url),
  PRIMARY KEY (id)
);

-- webhooks_topic
CREATE TABLE IF NOT EXISTS webhooks_topic (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  topic varchar(1024) NOT NULL,

  PRIMARY KEY (id)
);

-- webhooks_subscription
CREATE TABLE IF NOT EXISTS webhooks_subscription (
  webhook_id uuid NOT NULL,
  topic_id uuid NOT NULL,

  FOREIGN KEY (webhook_id) REFERENCES webhooks(id) ON DELETE CASCADE,
  FOREIGN KEY (topic_id) REFERENCES webhooks_topic(id) ON DELETE CASCADE,
  UNIQUE (webhook_id, topic_id)
);

COMMIT;
