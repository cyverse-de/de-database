SET search_path = public, pg_catalog;

-- Associates information needed to manage badges.

CREATE TABLE badges (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the users table
  user_id uuid NOT NULL,

  -- Foreign key into the submissions table
  submission_id uuid NOT NULL
);
