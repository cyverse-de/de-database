BEGIN;

SET search_path = public, pg_catalog;

--
-- Replaces the notification_types enum with a lookup table so the DE database
-- and the notifications service share one vocabulary instead of two. The enum
-- declared which notification a tool type produces; the table registered what
-- the notifications service received. They are the same strings: apps passes
-- tool_types.notification_type as the "type" field of the AMQP message that
-- the notifications service then registers by name.
--
-- The enum cannot be dropped while a column still uses it, and the table
-- cannot take the name until the enum is gone, so the values round-trip
-- through text.
--
ALTER TABLE ONLY tool_types
    ADD COLUMN IF NOT EXISTS notification_type_name text;

UPDATE tool_types SET notification_type_name = notification_type::text;

ALTER TABLE ONLY tool_types
    DROP COLUMN IF EXISTS notification_type;

DROP TYPE IF EXISTS notification_types;

CREATE TABLE IF NOT EXISTS notification_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(32) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

-- The first seven values came from the enum. 'request' and 'community' have
-- only ever existed in the notifications database.
INSERT INTO notification_types (name) VALUES
    ('apps'),
    ('tool_request'),
    ('team'),
    ('data'),
    ('analysis'),
    ('tools'),
    ('permanent_id_request'),
    ('request'),
    ('community')
ON CONFLICT (name) DO NOTHING;

ALTER TABLE ONLY tool_types
    ADD COLUMN IF NOT EXISTS notification_type_id uuid;

UPDATE tool_types tt
SET notification_type_id = nt.id
FROM notification_types nt
WHERE nt.name = tt.notification_type_name;

-- Separate statement: ADD CONSTRAINT has no IF NOT EXISTS guard, so we check
-- pg_constraint to make the migration idempotent.
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'tool_types_notification_type_id_fkey'
    ) THEN
        ALTER TABLE tool_types
            ADD CONSTRAINT tool_types_notification_type_id_fkey
            FOREIGN KEY (notification_type_id) REFERENCES notification_types(id);
    END IF;
END$$;

ALTER TABLE ONLY tool_types
    ALTER COLUMN notification_type_id SET NOT NULL,
    DROP COLUMN IF EXISTS notification_type_name;

COMMIT;
