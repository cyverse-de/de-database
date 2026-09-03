BEGIN;

SET search_path = public, pg_catalog;

-- Restores the notification_types enum. This only succeeds while every
-- tool_types row still uses one of the original seven values; an enum has no
-- equivalent of 'request' or 'community'.
ALTER TABLE ONLY tool_types
    ADD COLUMN IF NOT EXISTS notification_type_name text;

UPDATE tool_types tt
SET notification_type_name = nt.name
FROM notification_types nt
WHERE nt.id = tt.notification_type_id;

ALTER TABLE ONLY tool_types
    DROP CONSTRAINT IF EXISTS tool_types_notification_type_id_fkey,
    DROP COLUMN IF EXISTS notification_type_id;

DROP TABLE IF EXISTS notification_types;

CREATE TYPE notification_types AS ENUM (
    'apps',
    'tool_request',
    'team',
    'data',
    'analysis',
    'tools',
    'permanent_id_request'
);

ALTER TABLE ONLY tool_types
    ADD COLUMN IF NOT EXISTS notification_type notification_types;

UPDATE tool_types SET notification_type = notification_type_name::notification_types;

ALTER TABLE ONLY tool_types
    ALTER COLUMN notification_type SET NOT NULL,
    DROP COLUMN IF EXISTS notification_type_name;

COMMIT;
