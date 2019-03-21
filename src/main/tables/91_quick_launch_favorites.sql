SET search_path = public, pg_catalog;

CREATE TABLE quick_launch_favorites (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the quick_launches table
  quick_launch_id uuid NOT NULL,

  -- Foreign key into the users table
  user_id uuid NOT NULL
);
