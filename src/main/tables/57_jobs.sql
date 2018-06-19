SET search_path = public, pg_catalog;

--
-- Records jobs that the user has submitted.
--
CREATE TABLE jobs (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    job_name character varying(255) NOT NULL,
    job_description text DEFAULT '',
    app_name character varying(255),
    job_type_id uuid NOT NULL,
    app_id character varying(255),
    app_wiki_url text,
    app_description text,
    result_folder_path text,
    start_date timestamp,
    end_date timestamp,
    planned_end_date timestamp,
    status character varying(64) NOT NULL,
    deleted boolean DEFAULT FALSE NOT NULL,
    notify boolean DEFAULT FALSE NOT NULL,
    user_id uuid NOT NULL,
    submission json,
    parent_id uuid
);

--
-- Indices on the jobs table to speed up job listing queries.
--
CREATE INDEX jobs_parent_id_index ON jobs(parent_id);
CREATE INDEX jobs_user_id_index ON jobs(user_id);
CREATE INDEX jobs_app_id_index ON jobs(app_id);
CREATE INDEX jobs_status_index ON jobs(status);
CREATE INDEX jobs_start_date_index ON jobs(start_date);
CREATE INDEX jobs_end_date_index ON jobs(end_date);
