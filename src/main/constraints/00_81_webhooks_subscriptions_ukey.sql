SET search_path = public, pg_catalog;
--
-- webhooks user subscription unique key table unique key.
--
ALTER TABlE ONLY webhooks_subscription
ADD CONSTRAINT webhooks_subscription_ukey
unique (webhook_id, topic_id);
