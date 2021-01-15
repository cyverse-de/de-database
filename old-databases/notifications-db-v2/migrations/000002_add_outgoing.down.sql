ALTER TABLE ONLY notifications
DROP COLUMN routing_key;

ALTER TABLE ONLY notifications
DROP COLUMN outgoing_json;

ALTER TABLE ONLY notifications
RENAME COLUMN incoming_json TO message;
