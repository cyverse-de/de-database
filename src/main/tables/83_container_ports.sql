SET search_path = public, pg_catalog;

-- Contains the the port information for a tool's container. This is used for
-- interactive apps.

CREATE TABLE container_ports (
  -- primary key
  id uuid UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

  -- The foreign key into the container_settings table
  container_settings_id uuid NOT NULL,

  -- The port on the host to bind to the container. Can be null, which should
  -- cause a random port to be allocated.
  host_port integer,

  -- The port that the container should be listening on. Should not be null.
  container_port integer NOT NULL,

  bind_to_host boolean NOT NULL DEFAULT FALSE
);
