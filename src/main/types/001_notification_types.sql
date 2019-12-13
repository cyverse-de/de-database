SET search_path = public, pg_catalog;

--
-- The enumeration of available notification types.
--
CREATE TYPE notification_types AS ENUM (
    'apps',
    'tool_request',
    'team',
    'data',
    'analysis',
    'tools',
    'permanent_id_request'
);
