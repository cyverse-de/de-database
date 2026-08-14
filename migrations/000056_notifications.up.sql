BEGIN;

SET search_path = public, pg_catalog;

--
-- Brings the notifications database into the DE database. The table is the
-- notifications-db v2 schema unchanged except for its two foreign keys: the
-- standalone database kept its own users table, and this one shares
-- public.users with the rest of the DE.
--
-- The row data is not moved here -- a migration cannot reach across databases.
-- See the notifications_db_merge playbook in the deployments repository.
--
CREATE TABLE IF NOT EXISTS notifications (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    notification_type_id uuid NOT NULL,
    -- public.users stores fully qualified usernames. The JSON payloads below
    -- carry the bare username and are served to clients verbatim, so the two
    -- spellings coexist by design; do not rewrite the payloads to match.
    user_id uuid NOT NULL,
    subject text NOT NULL,
    seen boolean NOT NULL DEFAULT false,
    deleted boolean NOT NULL DEFAULT false,
    time_created timestamp with time zone NOT NULL DEFAULT now(),
    -- As received from the AMQP message.
    incoming_json jsonb NOT NULL,
    -- As served by the API. NULL until the notification has been formatted.
    outgoing_json jsonb,
    routing_key varchar(64),
    PRIMARY KEY (id),
    FOREIGN KEY (notification_type_id) REFERENCES notification_types(id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Supports the per-user listing endpoints, which are the service's hot path.
CREATE INDEX IF NOT EXISTS notifications_user_id_index
    ON notifications (user_id);

-- Supports filtering a listing to a single notification type.
CREATE INDEX IF NOT EXISTS notifications_notification_type_id_index
    ON notifications (notification_type_id);

-- Supports the time-ordered listing and its keyset pagination boundaries.
CREATE INDEX IF NOT EXISTS notifications_time_created_index
    ON notifications (time_created);

COMMIT;
