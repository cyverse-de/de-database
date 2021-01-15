ALTER TABLE ONLY notifications
RENAME COLUMN message TO incoming_json;

ALTER TABLE ONLY notifications
ADD COLUMN outgoing_json jsonb;

ALTER TABLE ONLY notifications
ADD COLUMN routing_key varchar(64);

UPDATE notifications
SET outgoing_json = jsonb_set(incoming_json, '{message,id}', to_jsonb(id));
