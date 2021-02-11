SET search_path = public, pg_catalog;

-- quick launches

-- submissions
CREATE TABLE IF NOT EXISTS submissions (
  -- Primary Key
  id uuid NOT NULL,
  submission json NOT NULL,

  PRIMARY KEY (id)
);

-- quick_launches
CREATE TABLE IF NOT EXISTS quick_launches (
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

  -- Foreign key into the apps table
  app_id uuid NOT NULL,

  -- Whether or not all users can see the quick launch
  is_public boolean NOT NULL DEFAULT false,

  PRIMARY KEY (id)
);

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_creator_fkey
    FOREIGN KEY (creator)
    REFERENCES users(id);

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_submission_id_fkey
    FOREIGN KEY (submission_id)
    REFERENCES submissions(id);

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

-- quick_launch_favorites
CREATE TABLE IF NOT EXISTS quick_launch_favorites (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the quick_launches table
  quick_launch_id uuid NOT NULL,

  -- Foreign key into the users table
  user_id uuid NOT NULL,

  PRIMARY KEY (id),
  UNIQUE (user_id, quick_launch_id)
);

ALTER TABLE ONLY quick_launch_favorites
    ADD CONSTRAINT quick_launch_favorites_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id);

ALTER TABLE ONLY quick_launch_favorites
    ADD CONSTRAINT quick_launch_favorites_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

-- quick_launch_user_defaults
CREATE TABLE IF NOT EXISTS quick_launch_user_defaults (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the users table. This is the user that set the quick
  -- launch as their default for the app that the QL was created for.
  user_id uuid NOT NULL,

  -- Foreign key into the apps table. If this doesn't match the app_id in the
  -- quick launches table, bad things will happen.
  app_id uuid NOT NULL,

  -- Foreign key into the quick_launches table.
  quick_launch_id uuid NOT NULL,

  PRIMARY KEY (id),
  UNIQUE (user_id, app_id),
  UNIQUE (user_id, quick_launch_id)
);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

ALTER TABLE ONLY quick_launch_user_defaults
    ADD CONSTRAINT quick_launch_user_defaults_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id);

-- quick_launch_global_defaults
CREATE TABLE IF NOT EXISTS quick_launch_global_defaults (
  -- Primary key
  id uuid NOT NULL,

  -- Foreign key into the apps table. If this doesn't match the app_id in the
  -- associated quick launch, bad things will happen.
  app_id uuid NOT NULL,

  -- Foreign key into the quick_launches table.
  quick_launch_id uuid NOT NULL,

  PRIMARY KEY (id),
  UNIQUE (app_id),
  UNIQUE (quick_launch_id)
);

ALTER TABLE quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);

ALTER TABLE quick_launch_global_defaults
    ADD CONSTRAINT quick_launch_global_defaults_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id);

-- instant launches

-- instant_launches
CREATE TABLE IF NOT EXISTS instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    quick_launch_id UUID NOT NULL,

    added_by UUID NOT NULL,

    added_on TIMESTAMP NOT NULL DEFAULT now(),

    PRIMARY KEY (id)
);

ALTER TABLE instant_launches
    ADD CONSTRAINT instant_launches_quick_launch_id_fkey
    FOREIGN KEY (quick_launch_id)
    REFERENCES quick_launches(id) ON DELETE CASCADE;

ALTER TABLE instant_launches
    ADD CONSTRAINT instant_launches_added_by_fkey
    FOREIGN KEY (added_by)
    REFERENCES users(id);

-- user_instant_launches
CREATE TABLE IF NOT EXISTS user_instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Indicates the format version of the instant launch
    -- JSON. Should help us put together conversions between
    -- format versions without breaking currently running
    -- services.
    version SERIAL,

    user_id UUID UNIQUE NOT NULL,

    -- Here's an example of how the instant_launches field
    -- is supposed to map info types and glob patterns to 
    -- instant launches. The kind field tells the caller how
    -- use the top-level key. The default field tells you
    -- what the default instant launch should be and the
    -- compatible list contains instant launches that are
    -- also acceptable for the kind of pattern but aren't the
    -- default.
    --
    -- {
    --     "*.py" : {
    --         "kind" : "pattern",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible: [
    --             "<instant_launch_uuid>",
    --         ],
    --     },

    --     "<info_type_name>" : {
    --         "kind" : "info-type",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible" : [
    --             "<instant_launch_uuid>",
    --         ],
    --     },
    -- }
    --
    instant_launches JSONB NOT NULL DEFAULT '{}'::JSONB,

    -- Could be an admin.
    added_by UUID NOT NULL, 

    -- Could be useful for support issues.
    added_on TIMESTAMP NOT NULL DEFAULT now(),

    PRIMARY KEY (id),
    UNIQUE (user_id, version)
);

ALTER TABLE user_instant_launches
    ADD CONSTRAINT user_instant_launches_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE user_instant_launches
    ADD CONSTRAINT user_instant_launches_added_by_fkey
    FOREIGN KEY (added_by)
    REFERENCES users(id);

-- default_instant_launches
CREATE TABLE IF NOT EXISTS default_instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    -- Indicates the format version of the instant launch
    -- JSON. Should help us put together conversions between
    -- format versions without breaking currently running
    -- services.
    version SERIAL,

    -- Here's an example of how the instant_launches field
    -- is supposed to map info types and glob patterns to 
    -- instant launches. The kind field tells the caller how
    -- use the top-level key. The default field tells you
    -- what the default instant launch should be and the
    -- compatible list contains instant launches that are
    -- also acceptable for the kind of pattern but aren't the
    -- default.
    --
    -- {
    --     "*.py" : {
    --         "kind" : "pattern",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible: [
    --             "<instant_launch_uuid>",
    --         ],
    --     },

    --     "<info_type_name>" : {
    --         "kind" : "info-type",
    --         "default" : "<instant_launch_uuid>",
    --         "compatible" : [
    --             "<instant_launch_uuid>",
    --         ],
    --     },
    -- }
    --

    instant_launches JSONB NOT NULL DEFAULT '{}'::JSONB,

    added_by UUID NOT NULL,

    added_on TIMESTAMP NOT NULL DEFAULT now(),

    PRIMARY KEY (id),
    UNIQUE (version)
);

ALTER TABLE default_instant_launches
    ADD CONSTRAINT default_instant_launches_added_by_fkey
    FOREIGN KEY (added_by)
    REFERENCES users(id);
