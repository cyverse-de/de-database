CREATE TABLE IF NOT EXISTS users (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    username varchar(512) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS notification_types (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(32) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS notifications (
    id UUID DEFAULT uuid_generate_v1(),
    notification_type_id uuid NOT NULL REFERENCES notification_types(id),
    user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject text NOT NULL,
    seen boolean NOT NULL DEFAULT false,
    deleted boolean NOT NULL DEFAULT false,
    time_created timestamp with time zone NOT NULL DEFAULT now(),
    message jsonb NOT NULL,
    PRIMARY KEY (id)
);

CREATE INDEX notifications_notification_type_id_index
ON notifications (notification_type_id);

CREATE INDEX notifications_user_id_index
ON notifications (user_id);

CREATE INDEX notifications_time_created_index
ON notifications (time_created);
