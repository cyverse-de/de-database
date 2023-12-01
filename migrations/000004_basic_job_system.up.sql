BEGIN;

SET search_path = public, pg_catalog;

--
-- shared integration_data table (app/tool integrator attribution)
--
CREATE TABLE IF NOT EXISTS integration_data (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    integrator_name character varying(255) NOT NULL CHECK (integrator_name ~ '\\S'),
    integrator_email character varying(255) NOT NULL CHECK (integrator_email ~ '\\S'),
    user_id uuid,
    UNIQUE (integrator_name, integrator_email),
    FOREIGN KEY (user_id) REFERENCES users (id),
    PRIMARY KEY (id)
);

--
-- basic table for apps
--
CREATE TABLE IF NOT EXISTS apps (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255),
    description text,
    deleted boolean DEFAULT false NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    integration_data_id uuid NOT NULL,
    wiki_url character varying(1024),
    integration_date timestamp without time zone,
    edited_date timestamp without time zone,
    FOREIGN KEY (integration_data_id) REFERENCES integration_data(id),
    PRIMARY KEY (id)
);

--
-- basic tables for jobs
--

CREATE TABLE IF NOT EXISTS job_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(36) NOT NULL,
    system_id character varying(36) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS jobs (
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
    subdomain character varying(32),
    submission json,
    parent_id uuid,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES jobs(id),
    FOREIGN KEY (job_type_id) REFERENCES job_types(id),
    PRIMARY KEY (id)
);

CREATE INDEX IF NOT EXISTS jobs_parent_id_index ON jobs(parent_id);
CREATE INDEX IF NOT EXISTS jobs_user_id_index ON jobs(user_id);
CREATE INDEX IF NOT EXISTS jobs_app_id_index ON jobs(app_id);
CREATE INDEX IF NOT EXISTS jobs_status_index ON jobs(status);
CREATE INDEX IF NOT EXISTS jobs_start_date_index ON jobs(start_date);
CREATE INDEX IF NOT EXISTS jobs_end_date_index ON jobs(end_date);
CREATE INDEX IF NOT EXISTS jobs_app_id_start_date ON jobs(app_id, start_date);

--
-- basic tables for tools
--

DO $$
BEGIN
    CREATE TYPE notification_types AS ENUM (
        'apps',
        'tool_request',
        'team',
        'data',
        'analysis',
        'tools',
        'permanent_id_request'
    );
EXCEPTION
    WHEN duplicate_object THEN
        RAISE NOTICE 'notification_types type already exists, moving on';
END$$;

CREATE TABLE IF NOT EXISTS tool_types (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(50) UNIQUE NOT NULL,
    label varchar(128) NOT NULL,
    description text,
    hidden boolean NOT NULL DEFAULT FALSE,
    notification_type notification_types NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS container_images (
  id uuid UNIQUE  NOT NULL DEFAULT uuid_generate_v1(),   -- primary key
  name text NOT NULL, -- name used to indicate which image to pull down. Could be a UUID, but don't do that.
  tag text NOT NULL,  -- tag used to pull down an image. We'll default it to 'latest'
  url text,           -- URL containing more information about the image (ex: docker hub URL)
  deprecated boolean NOT NULL DEFAULT FALSE,  -- flag indicating if tools using this image should be used in new apps.
  osg_image_path text, -- the path to the Singularity image in OSG's CVM-FS repository if available.
  PRIMARY KEY (id),
  UNIQUE (name, tag, osg_image_path)
);

CREATE TABLE IF NOT EXISTS tools (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255) NOT NULL,
    location character varying(255),
    tool_type_id uuid NOT NULL,
    description text,
    version character varying(255) NOT NULL,
    attribution text,
    integration_data_id uuid NOT NULL,
    container_images_id uuid,
    time_limit_seconds integer NOT NULL DEFAULT 0,
    restricted boolean NOT NULL DEFAULT FALSE,
    interactive boolean NOT NULL DEFAULT FALSE,
    gpu_enabled boolean NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_data_id) REFERENCES integration_data(id),
    FOREIGN KEY (tool_type_id) REFERENCES tool_types(id),
    FOREIGN KEY(container_images_id) REFERENCES container_images(id),
    UNIQUE (name, version)
);

--
-- basic tasks table (links apps, tools, etc. by FKs in future migrations)
--
CREATE TABLE IF NOT EXISTS tasks (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    job_type_id uuid NOT NULL,
    external_app_id character varying(255),
    name character varying(255) NOT NULL,
    description text,
    label character varying(255),
    tool_id uuid,
    FOREIGN KEY (tool_id) REFERENCES tools(id),
    FOREIGN KEY (job_type_id) REFERENCES job_types(id),
    PRIMARY KEY (id)
);

COMMIT;
