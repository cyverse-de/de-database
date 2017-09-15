SET search_path = public, pg_catalog;
--
-- webhooks user subscription unique key table unique key.
--
ALTER TABlE ONLY webhooks_user_subscription
ADD CONSTRAINT webhooks_user_subscription_ukey
unique (user_id, topic_id);
