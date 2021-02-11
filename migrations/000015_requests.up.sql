SET search_path = public, pg_catalog;

-- request_types
CREATE TABLE IF NOT EXISTS request_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL,

    PRIMARY KEY (id),
    UNIQUE (name)
);

-- requests
CREATE TABLE IF NOT EXISTS requests (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    request_type_id uuid NOT NULL,
    requesting_user_id uuid NOT NULL,
    details json NOT NULL,

    PRIMARY KEY (id)
);

ALTER TABLE requests
    ADD CONSTRAINT requests_request_type_id_fkey
    FOREIGN KEY (request_type_id)
    REFERENCES request_types(id) ON DELETE CASCADE;

ALTER TABLE requests
    ADD CONSTRAINT requests_requesting_user_id_fkey
    FOREIGN KEY (requesting_user_id)
    REFERENCES users(id) ON DELETE CASCADE;

-- request_status_codes
CREATE TABLE IF NOT EXISTS request_status_codes (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL,
    display_name text NOT NULL,
    email_template text NOT NULL,

    PRIMARY KEY (id),
    UNIQUE (name),
    UNIQUE (display_name)
);

-- request_updates
CREATE TABLE IF NOT EXISTS request_updates (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    request_id uuid NOT NULL,
    request_status_code_id uuid NOT NULL,
    updating_user_id uuid NOT NULL,
    created_date timestamp NOT NULL DEFAULT now(),
    message text,

    PRIMARY KEY (id)
);

ALTER TABLE request_updates
    ADD CONSTRAINT request_updates_request_id_fkey
    FOREIGN KEY (request_id)
    REFERENCES requests(id) ON DELETE CASCADE;

ALTER TABLE request_updates
    ADD CONSTRAINT request_updates_request_status_code_id_fkey
    FOREIGN KEY (request_status_code_id)
    REFERENCES request_status_codes(id) ON DELETE CASCADE;

ALTER TABLE request_updates
    ADD CONSTRAINT request_updates_updating_user_id_fkey
    FOREIGN KEY (updating_user_id)
    REFERENCES users(id) ON DELETE CASCADE;
--
-- Index on request ID and timestamp.
--
CREATE INDEX IF NOT EXISTS request_updates_request_id_created_date_index
    ON request_updates(request_id, created_date);
