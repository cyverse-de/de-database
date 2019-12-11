SET search_path = public, pg_catalog;

-- Controls global defaults.
CREATE TABLE quick_launch_global_defaults (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the apps table. If this doesn't match the app_id in the
  -- associated quick launch, bad things will happen.
  app_id uuid NOT NULL,

  -- Foreign key into the quick_launches table.
  quick_launch_id uuid NOT NULL
);
