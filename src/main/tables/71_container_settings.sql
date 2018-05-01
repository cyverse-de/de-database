SET search_path = public, pg_catalog;

--
-- Records the settings to use with a tool's container. This is stored on a per
-- tool basis rather than on a per-image basis since a single image can contain
-- multiple tools, each of which have different setting requirements.
--
CREATE TABLE container_settings (
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

  -- The minimum number of cpu cores required to run the container. It's passed
  -- to Docker with the --cpus command-line switch.
  min_cpu_cores integer,

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
  entrypoint text
);
