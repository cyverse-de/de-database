SET search_path = public, pg_catalog;

-- Contains the proxy settings for the interactive apps that run on the cluster.

CREATE TABLE interactive_apps_proxy_settings (
  -- primary key
  id uuid NOT NULL DEFAULT uuid_generate_v1(),

  -- foreign key into the container_settings table
  container_settings_id uuid NOT NULL,

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
  ssl_key_path text
)
