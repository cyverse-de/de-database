SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the webhook_id and  topic_id field of
-- the webhooks_user_subscriptions table.
--
ALTER TABLE ONLY webhooks_subscription
ADD CONSTRAINT webhook_id_topic_fkey
FOREIGN KEY (webhook_id)
REFERENCES webhooks(id);


ALTER TABLE ONLY webhooks_subscription
ADD CONSTRAINT topic_id_topic_fkey
FOREIGN KEY (topic_id)
REFERENCES webhooks_topic(id);
