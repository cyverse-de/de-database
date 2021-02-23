BEGIN;

SET search_path = public, pg_catalog;

-- app_steps
CREATE TABLE IF NOT EXISTS app_steps (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    app_id uuid NOT NULL,
    task_id uuid NOT NULL,
    step integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_task_id_fkey
    FOREIGN KEY (task_id)
    REFERENCES tasks(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_steps
    ADD CONSTRAINT app_steps_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

CREATE INDEX IF NOT EXISTS app_steps_app_id ON app_steps (app_id);
CREATE INDEX IF NOT EXISTS app_steps_task_id ON app_steps (task_id);

-- workflow_io_maps
CREATE TABLE IF NOT EXISTS workflow_io_maps (
    id uuid NOT NULL DEFAULT (uuid_generate_v1()),
    app_id uuid NOT NULL,
    target_step uuid NOT NULL,
    source_step uuid NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (app_id, target_step, source_step)
);

ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_source_fkey
    FOREIGN KEY (source_step)
    REFERENCES app_steps(id) ON DELETE CASCADE;

ALTER TABLE ONLY workflow_io_maps
    ADD CONSTRAINT workflow_io_maps_target_fkey
    FOREIGN KEY (target_step)
    REFERENCES app_steps(id) ON DELETE CASCADE;

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
  PRIMARY KEY (app_id)
);

ALTER TABLE ONLY app_documentation
    ADD CONSTRAINT app_documentation_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_documentation
    ADD CONSTRAINT app_documentation_created_by_fkey
    FOREIGN KEY (created_by)
    REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_documentation
    ADD CONSTRAINT app_documentation_modified_by_fkey
    FOREIGN KEY (modified_by)
    REFERENCES users(id) ON DELETE CASCADE;

-- app_references
CREATE TABLE IF NOT EXISTS app_references (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    app_id uuid NOT NULL,
    reference_text text NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY app_references
    ADD CONSTRAINT app_references_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

-- apps_htcondor_extra
CREATE TABLE IF NOT EXISTS apps_htcondor_extra (
    apps_id uuid NOT NULL,
    extra_requirements text NOT NULL,
    PRIMARY KEY (apps_id)
);

ALTER TABLE ONLY apps_htcondor_extra
    ADD CONSTRAINT apps_htcondor_extra_apps_id_fkey
    FOREIGN KEY(apps_id)
    REFERENCES apps(id) ON DELETE CASCADE;

-- ratings
CREATE TABLE IF NOT EXISTS ratings (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    user_id uuid NOT NULL,
    app_id uuid NOT NULL,
    rating integer NOT NULL,
    comment_id bigint,
    PRIMARY KEY (id),
    UNIQUE (user_id, app_id)
);

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);


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
CREATE UNIQUE INDEX app_publication_request_status_codes_name_index
    on app_publication_request_status_codes (name);

--
-- The app publication requests themselves.
--
CREATE TABLE IF NOT EXISTS app_publication_requests (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    requestor_id UUID NOT NULL,
    app_id UUID,
    PRIMARY KEY (id)
);

ALTER TABLE app_publication_requests
    ADD CONSTRAINT app_publication_requests_requestor_id_fkey
    FOREIGN KEY (requestor_id)
    REFERENCES users(id);

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
    PRIMARY KEY (id)
);

ALTER TABLE app_publication_request_statuses
    ADD CONSTRAINT app_publication_request_statuses_app_publication_request_id_fkey
    FOREIGN KEY (app_publication_request_id)
    REFERENCES app_publication_requests(id);

ALTER TABLE app_publication_request_statuses
    ADD CONSTRAINT app_publication_request_statuses_app_publication_request_status_code_id_fkey
    FOREIGN KEY (app_publication_request_status_code_id)
    REFERENCES app_publication_request_status_codes(id);

--
-- Creates an index on the app_publication_request_id
--
CREATE INDEX IF NOT EXISTS app_publication_request_statuses_app_publication_request_id_index
    ON app_publication_request_statuses(app_publication_request_id);

COMMIT;
