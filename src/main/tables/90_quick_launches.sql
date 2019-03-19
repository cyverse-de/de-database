SET search_path = public, pg_catalog;

-- Associates information needed to manage badges.

CREATE TABLE quick_launches (
  -- Primary key
  id uuid NOT NULL,

  -- The name of the badge. Same length as the name in the apps table.
  name character varying(255) NOT NULL,

  -- A description of the quick launch.
  description text,

  -- Foreign key into the users table
  creator uuid NOT NULL,

  -- Foreign key into the submissions table
  submission_id uuid NOT NULL,

  -- Whether or not all users can see the quick launch
  public boolean NOT NULL DEFAULT false,
);
