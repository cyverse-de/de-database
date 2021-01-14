SET search_path = public, pg_catalog;

--
-- A table defining the set of available app publication request status codes.
--
CREATE TABLE app_publication_request_status_codes (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    email_template VARCHAR(64)
);

--
-- All app publication request status code names should be unique.
--
CREATE UNIQUE INDEX app_publication_request_status_codes_name_index
    on app_publication_request_status_codes (name);

--
-- The app publication requests themselves.
--
CREATE TABLE app_publication_requests (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    requestor_id UUID NOT NULL,
    app_id UUID
);

--
-- Creates indexes on the requestor_id and app_id columns
--
CREATE INDEX app_publication_requests_requestor_id_index
    ON app_publication_requests(requestor_id);
CREATE INDEX app_publication_requests_app_id_index
    ON app_publication_requests(app_id);

--
-- The statuses that have been applied to each app publication request.
--
CREATE TABLE app_publication_request_statuses (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    app_publication_request_id UUID NOT NULL,
    app_publication_request_status_code_id UUID NOT NULL,
    date_assigned TIMESTAMP DEFAULT now() NOT NULL,
    updater_id UUID NOT NULL,
    comments TEXT
);

--
-- Creates an index on the app_publication_request_id
--
CREATE INDEX app_publication_request_statuses_app_publication_request_id_index
    ON app_publication_request_statuses(app_publication_request_id);
