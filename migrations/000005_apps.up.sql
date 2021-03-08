BEGIN;

SET search_path = public, pg_catalog;

-- app_steps
CREATE TABLE IF NOT EXISTS app_steps (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    app_id uuid NOT NULL,
    task_id uuid NOT NULL,
    step integer NOT NULL,
    FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE,
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS app_steps_app_id ON app_steps (app_id);
CREATE INDEX IF NOT EXISTS app_steps_task_id ON app_steps (task_id);

-- workflow_io_maps
CREATE TABLE IF NOT EXISTS workflow_io_maps (
    id uuid NOT NULL DEFAULT (uuid_generate_v1()),
    app_id uuid NOT NULL,
    target_step uuid NOT NULL,
    source_step uuid NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    FOREIGN KEY (source_step) REFERENCES app_steps(id) ON DELETE CASCADE,
    FOREIGN KEY (target_step) REFERENCES app_steps(id) ON DELETE CASCADE,
    UNIQUE (app_id, target_step, source_step)
);

CREATE INDEX IF NOT EXISTS workflow_io_maps_app_id_idx ON workflow_io_maps(app_id);
CREATE INDEX IF NOT EXISTS workflow_io_maps_source_idx ON workflow_io_maps(source_step);
CREATE INDEX IF NOT EXISTS workflow_io_maps_target_idx ON workflow_io_maps(target_step);

-- app_documentation
CREATE TABLE IF NOT EXISTS app_documentation (
    app_id UUID NOT NULL,
    value TEXT,
    created_on timestamp DEFAULT now() NOT NULL,
    modified_on timestamp DEFAULT now() NOT NULL,
    created_by UUID NOT NULL,
    modified_by UUID NOT NULL,
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (modified_by) REFERENCES users(id) ON DELETE CASCADE,
    PRIMARY KEY (app_id)
);

-- app_references
CREATE TABLE IF NOT EXISTS app_references (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    app_id uuid NOT NULL,
    reference_text text NOT NULL,
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

-- apps_htcondor_extra
CREATE TABLE IF NOT EXISTS apps_htcondor_extra (
    apps_id uuid NOT NULL,
    extra_requirements text NOT NULL,
    FOREIGN KEY(apps_id) REFERENCES apps(id) ON DELETE CASCADE,
    PRIMARY KEY (apps_id)
);

-- ratings
CREATE TABLE IF NOT EXISTS ratings (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    user_id uuid NOT NULL,
    app_id uuid NOT NULL,
    rating integer NOT NULL,
    comment_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    UNIQUE (user_id, app_id)
);

-- app_publication_requests et al
--
-- A table defining the set of available app publication request status codes.
--
CREATE TABLE IF NOT EXISTS app_publication_request_status_codes (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    email_template VARCHAR(64),
    PRIMARY KEY (id)
);

--
-- All app publication request status code names should be unique.
--
CREATE UNIQUE INDEX IF NOT EXISTS app_publication_request_status_codes_name_index
    on app_publication_request_status_codes (name);

--
-- The app publication requests themselves.
--
CREATE TABLE IF NOT EXISTS app_publication_requests (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    requestor_id UUID NOT NULL,
    app_id UUID,
    FOREIGN KEY (requestor_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

--
-- Creates indexes on the requestor_id and app_id columns
--
CREATE INDEX IF NOT EXISTS app_publication_requests_requestor_id_index
    ON app_publication_requests(requestor_id);
CREATE INDEX IF NOT EXISTS app_publication_requests_app_id_index
    ON app_publication_requests(app_id);

--
-- The statuses that have been applied to each app publication request.
--
CREATE TABLE IF NOT EXISTS app_publication_request_statuses (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    app_publication_request_id UUID NOT NULL,
    app_publication_request_status_code_id UUID NOT NULL,
    date_assigned TIMESTAMP DEFAULT now() NOT NULL,
    updater_id UUID NOT NULL,
    comments TEXT,
    FOREIGN KEY (app_publication_request_id) REFERENCES app_publication_requests(id),
    FOREIGN KEY (app_publication_request_status_code_id) REFERENCES app_publication_request_status_codes(id),
    PRIMARY KEY (id)
);

--
-- Creates an index on the app_publication_request_id
--
CREATE INDEX IF NOT EXISTS app_publication_request_statuses_app_publication_request_id_index
    ON app_publication_request_statuses(app_publication_request_id);

COMMIT;
