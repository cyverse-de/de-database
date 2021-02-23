BEGIN;

SET search_path = public, pg_catalog;

-- webhooks_type
CREATE TABLE IF NOT EXISTS webhooks_type (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  type varchar(1024) NOT NULL,
  template text NOT NULL,

  PRIMARY KEY (id),
  UNIQUE (type)
);

-- webhooks
CREATE TABLE IF NOT EXISTS webhooks (
  id uuid NOT NULL DEFAULT uuid_generate_v1(),
  user_id uuid NOT NULL,
  url text NOT NULL,
  type_id uuid NOT NULL,

  PRIMARY KEY (id),
  UNIQUE (user_id, url)
);

ALTER TABLE ONLY webhooks
      ADD  CONSTRAINT webhooks_user_id_fkey
      FOREIGN KEY (user_id)
      REFERENCES users(id);
ALTER TABLE ONLY webhooks
      ADD  CONSTRAINT webhooks_type_id_fkey
      FOREIGN KEY (type_id)
      REFERENCES webhooks_type(id);

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

  UNIQUE (webhook_id, topic_id)
);

ALTER TABLE ONLY webhooks_subscription
    ADD CONSTRAINT webhook_id_topic_fkey
    FOREIGN KEY (webhook_id)
    REFERENCES webhooks(id)
    ON DELETE CASCADE;
ALTER TABLE ONLY webhooks_subscription
    ADD CONSTRAINT topic_id_topic_fkey
    FOREIGN KEY (topic_id)
    REFERENCES webhooks_topic(id)
    ON DELETE CASCADE;

COMMIT;
