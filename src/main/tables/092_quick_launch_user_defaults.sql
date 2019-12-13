SET search_path = public, pg_catalog;


-- Controls the defaults on a per-user basis.
CREATE TABLE quick_launch_user_defaults (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the users table. This is the user that set the quick
  -- launch as their default for the app that the QL was created for.
  user_id uuid NOT NULL,

  -- Foreign key into the apps table. If this doesn't match the app_id in the
  -- quick launches table, bad things will happen.
  app_id uuid NOT NULL,

  -- Foreign key into the quick_launches table.
  quick_launch_id uuid NOT NULL
);
