SET search_path = public, pg_catalog;

CREATE TABLE quick_launch_defaults (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the quick_launches table.
  quick_launch_id uuid NOT NULL,

  -- Foreign key into the users table.
  user_id uuid NOT NULL,

  -- Whether or not it's a global default (AKA default default). Should only
  -- be toggleable by the app creator.
  global boolean NOT NULL DEFAULT false
)
