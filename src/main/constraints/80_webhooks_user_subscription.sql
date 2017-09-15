SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the user_id and  topic_id field of
-- the webhooks_user_subscriptions table.
--
ALTER TABLE ONLY webhooks_user_subscription
ADD CONSTRAINT user_id_topic_fkey
FOREIGN KEY (user_id)
REFERENCES users(id);


ALTER TABLE ONLY webhooks_user_subscription
ADD CONSTRAINT topic_id_topic_fkey
FOREIGN KEY (topic_id)
REFERENCES webhooks_topic(id);
