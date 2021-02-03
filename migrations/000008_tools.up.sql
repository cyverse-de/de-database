SET search_path = public, pg_catalog;

-- interactive_apps_proxy_settings
CREATE TABLE IF NOT EXISTS interactive_apps_proxy_settings (
  -- primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- Docker image to pull that contains the proxy.
  image text NOT NULL,

  -- The name that should be given to the docker container created for the proxy.
  name text NOT NULL,

  -- The externally facing URL that users hit to access the interactive app.
  -- This is nullable so that the database can override the default behavior,
  -- which is to generate the URL from an configuration setting and the analysis
  -- UUID.
  frontend_url text,

  -- The base CAS URL that the proxy should use to authenticate users. This is
  -- nullable so that the database can optionally override the default behavior,
  -- which is to use the URL provided in a configuration setting.
  cas_url text,

  -- When combined with the cas_url field, this creates the URL that CAS tickets
  -- are validated against. This is nullable so that the database can optionally
  -- override the default behavior, which is to use a configuration setting.
  cas_validate text,

  -- The path to the SSL cert to use on the HTCondor nodes. This is nullable for
  -- now, since we want the database to override the setting provided in the
  -- configuration file.
  ssl_cert_path text,

  -- The path to the SSL key to use on the HTCondor nodes. This is nullable for
  -- now, since we want the database to override the setting provided in the
  -- configuration file.
  ssl_key_path text,

  PRIMARY KEY (id)
);

-- container_settings
CREATE TABLE IF NOT EXISTS container_settings (
  -- Primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- Foreign key into the tools table
  tools_id uuid UNIQUE NOT NULL,

  -- Foreign key into the interactive_apps_proxy_settings table
  interactive_apps_proxy_settings_id uuid UNIQUE,

  -- Tune container pids limit (set -1 for unlimited).
  pids_limit integer,

  -- The 'shares' of the CPU that the container owns.
  cpu_shares integer,

  -- The maximum RAM usage limit, in bytes.
  memory_limit bigint,

  -- The minimum number of bytes required to run the container. This is used
  -- in the Condor ClassAds and is not passed to the Docker container.
  min_memory_limit bigint,

  -- The minimum number of cpu cores required to run the container. This could
  -- be used for job matching.
  min_cpu_cores decimal(6,3),

  -- The maximum number of cpu cores the container is allowed to use. This is
  -- passed to the container runtime.
  max_cpu_cores decimal(6,3),

  -- The minimum amount of disk space required to run the container. This does
  -- not correspond to a docker option, it's purely used for Condor job
  -- matching with ClassAds.
  min_disk_space bigint,

  -- Most likely going to be 'bridge' or 'none', but may be set to a container
  -- id which is why we're using text.
  network_mode text,

  -- The directory the job will default to working in. Will most likely get set
  -- to null, indicating that we should just use the default. The data type is
  -- text to avoid annoying path length issues.
  working_directory text,

  -- The name of the running container. Most of the time this will be null, but
  -- we should have the option if we need it. Note that this is different from
  -- the image name.
  name text,

  -- The entrypoint of the running container. This will let us override a
  -- container's default entrypoint, if it has one and it's necessary.
  entrypoint text,

  -- Whether or not to mount the /tmp directory into the container. Defaults to
  -- false because the majority of tools won't have a problem with this, it's
  -- just a few outliers that cause issues.
  skip_tmp_mount bool NOT NULL DEFAULT FALSE,

  -- The user ID that the contained process will run as. Needs to be the actual
  -- UID of the user created by the Dockerfile, if it exists. This isn't passed
  -- on the command-line, but is used to make sure permissions are correct for
  -- the working directory in the container. If it's not set, the default of 0
  -- will be used (but not stored in the database).
  uid int,

  PRIMARY KEY (id)
);

ALTER TABLE ONLY container_settings
    ADD CONSTRAINT container_settings_tools_id_fkey
    FOREIGN KEY(tools_id)
    REFERENCES tools(id) ON DELETE CASCADE;

ALTER TABLE ONLY container_settings
    ADD CONSTRAINT container_settings_interactive_apps_proxy_settings_id_fkey
    FOREIGN KEY(interactive_apps_proxy_settings_id)
    REFERENCES interactive_apps_proxy_settings(id) ON DELETE CASCADE;

-- data_containers
CREATE TABLE IF NOT EXISTS data_containers (
  -- Primary key
  id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- The prefix part of the container name. The rest will consist of the
  -- analysis/job ID.
  name_prefix TEXT NOT NULL,

  -- Foreign key into the container_images table
  container_images_id UUID NOT NULL,

  -- Whether the container is mounted read-only
  read_only BOOLEAN NOT NULL DEFAULT TRUE,

  PRIMARY KEY (id)
);

ALTER TABLE ONLY data_containers
    ADD CONSTRAINT data_containers_container_images_id_fkey
    FOREIGN KEY (container_images_id)
    REFERENCES container_images(id);
ALTER TABLE ONLY data_containers
    ADD CONSTRAINT data_containers_unique
    UNIQUE(container_images_id, name_prefix, read_only);

-- container_volumes_from
CREATE TABLE IF NOT EXISTS container_volumes_from (
  -- primary key
  id uuid NOT NULL UNIQUE DEFAULT uuid_generate_v1(),

  -- foreign key into the data_containers table.
  data_containers_id uuid NOT NULL,

  -- foreign key into the container_settings_table.
  container_settings_id uuid NOT NULL,

  PRIMARY KEY (id)
);

ALTER TABLE ONLY container_volumes_from
    ADD CONSTRAINT container_volumes_from_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE;
ALTER TABLE ONLY container_volumes_from
   ADD CONSTRAINT container_volumes_from_data_containers_id_fkey
   FOREIGN KEY(data_containers_id)
   REFERENCES data_containers(id) ON DELETE CASCADE;

-- container_ports
CREATE TABLE IF NOT EXISTS container_ports (
  -- primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- The foreign key into the container_settings table
  container_settings_id uuid NOT NULL,

  -- The port on the host to bind to the container. Can be null, which should
  -- cause a random port to be allocated.
  host_port integer,

  -- The port that the container should be listening on. Should not be null.
  container_port integer NOT NULL,

  bind_to_host boolean NOT NULL DEFAULT FALSE,

  PRIMARY KEY (id)
);

ALTER TABLE ONLY container_ports
    ADD CONSTRAINT container_ports_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE;

-- container_devices
CREATE TABLE IF NOT EXISTS container_devices(
  -- primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- The foreign key into the container_settings table.
  container_settings_id uuid NOT NULL,

  -- The path on the host machine to the device to mount.
  host_path text NOT NULL,

  -- The path in the container to map the device to.
  container_path text NOT NULL,

  PRIMARY KEY (id),

  UNIQUE (container_settings_id, host_path, container_path)
);

ALTER TABLE ONLY container_devices
    ADD CONSTRAINT container_devices_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE;

-- container_volumes
CREATE TABLE IF NOT EXISTS container_volumes (
  -- primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- foreign key into the container_settings table
  container_settings_id uuid NOT NULL,

  -- The path to the directory or file on the host that will be mounted into
  -- the container.
  host_path text NOT NULL,

  -- The path in the container that the host_path will be mounted to.
  container_path text NOT NULL,

  PRIMARY KEY (id),

  UNIQUE (container_settings_id, host_path, container_path)
);

ALTER TABLE ONLY container_volumes
    ADD CONSTRAINT container_volumes_container_settings_id_fkey
    FOREIGN KEY(container_settings_id)
    REFERENCES container_settings(id) ON DELETE CASCADE;

-- tool_architectures
CREATE TABLE IF NOT EXISTS tool_architectures (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,

    PRIMARY KEY (id)
);

CREATE UNIQUE INDEX IF NOT EXISTS tool_architectures_name_index
    ON tool_architectures (name);

-- tool_requests
CREATE TABLE IF NOT EXISTS tool_requests (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    requestor_id UUID NOT NULL,
    phone VARCHAR(30),
    tool_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    source_url TEXT NOT NULL,
    doc_url TEXT NOT NULL,
    version VARCHAR(255) NOT NULL,
    attribution TEXT NOT NULL,
    multithreaded BOOLEAN,
    tool_architecture_id UUID NOT NULL,
    test_data_path TEXT NOT NULL,
    instructions TEXT NOT NULL,
    additional_info TEXT,
    additional_data_file TEXT,
    tool_id UUID,

    PRIMARY KEY (id)
);

ALTER TABLE ONLY tool_requests
    ADD CONSTRAINT tool_requests_requestor_id_fkey
    FOREIGN KEY (requestor_id)
    REFERENCES users(id);
ALTER TABLE ONLY tool_requests
    ADD CONSTRAINT tool_requests_tool_architecture_id_fkey
    FOREIGN KEY (tool_architecture_id)
    REFERENCES tool_architectures(id);
ALTER TABLE ONLY tool_requests
    ADD CONSTRAINT tool_requests_tool_id_fkey
    FOREIGN KEY (tool_id)
    REFERENCES tools(id);

CREATE INDEX IF NOT EXISTS tool_requests_requestor_id_index
    ON tool_requests(requestor_id);
CREATE INDEX IF NOT EXISTS tool_requests_tool_id_index
    ON tool_requests(tool_id);

-- tool_request_status_codes
CREATE TABLE IF NOT EXISTS tool_request_status_codes (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    email_template VARCHAR(64),

    PRIMARY KEY (id)
);


CREATE UNIQUE INDEX IF NOT EXISTS tool_request_status_codes_name_index
    on tool_request_status_codes (name);

-- tool_request_statuses
CREATE TABLE IF NOT EXISTS tool_request_statuses (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    tool_request_id UUID NOT NULL,
    tool_request_status_code_id UUID NOT NULL,
    date_assigned TIMESTAMP DEFAULT now() NOT NULL,
    updater_id UUID NOT NULL,
    comments TEXT,

    PRIMARY KEY (id)
);

ALTER TABLE ONLY tool_request_statuses
    ADD CONSTRAINT tool_request_statuses_updater_id_fkey
    FOREIGN KEY (updater_id)
    REFERENCES users(id);
ALTER TABLE ONLY tool_request_statuses
    ADD CONSTRAINT tool_request_statuses_tool_request_id_fkey
    FOREIGN KEY (tool_request_id)
    REFERENCES tool_requests(id) ON DELETE CASCADE;
ALTER TABLE ONLY tool_request_statuses
    ADD CONSTRAINT tool_request_statuses_tool_request_status_code_id_fkey
    FOREIGN KEY (tool_request_status_code_id)
    REFERENCES tool_request_status_codes(id);

CREATE INDEX IF NOT EXISTS tool_request_statuses_tool_request_id_index
    ON tool_request_statuses(tool_request_id);

-- tool_type_parameter_type
CREATE TABLE tool_type_parameter_type (
   tool_type_id uuid NOT NULL,
   parameter_type_id uuid NOT NULL
);

ALTER TABLE ONLY tool_type_parameter_type
    ADD CONSTRAINT tool_type_parameter_type_tool_type_id_fkey
    FOREIGN KEY (tool_type_id)
    REFERENCES tool_types(id);
ALTER TABLE ONLY tool_type_parameter_type
    ADD CONSTRAINT tool_type_parameter_type_parameter_types_fkey
    FOREIGN KEY (parameter_type_id)
    REFERENCES parameter_types(id);

-- tool_test_data_files
CREATE TABLE IF NOT EXISTS tool_test_data_files (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    filename character varying(1024) NOT NULL,
    input_file boolean DEFAULT true,
    tool_id uuid NOT NULL,

    PRIMARY KEY (id)
);

ALTER TABLE ONLY tool_test_data_files
    ADD CONSTRAINT tool_test_data_files_tool_id_fkey
    FOREIGN KEY (tool_id)
    REFERENCES tools(id) ON DELETE CASCADE;
