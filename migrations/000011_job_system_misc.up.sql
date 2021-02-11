SET search_path = public, pg_catalog;

-- genome_reference
CREATE TABLE IF NOT EXISTS genome_reference (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name varchar(512) NOT NULL,
    path varchar(1024) NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp DEFAULT now() NOT NULL,
    last_modified_by uuid NOT NULL,
    last_modified_on timestamp DEFAULT now() NOT NULL,

    PRIMARY KEY (id),
    UNIQUE (name),
    UNIQUE (path)
);

ALTER TABLE ONLY genome_reference
    ADD CONSTRAINT genome_reference_created_by_fkey
    FOREIGN KEY (created_by)
    REFERENCES users(id);
ALTER TABLE ONLY genome_reference
    ADD CONSTRAINT genome_reference_last_modified_by_fkey
    FOREIGN KEY (last_modified_by)
    REFERENCES users(id);

-- notif_statuses
--
-- Tracks warning and cancellation notifications for jobs.
--
CREATE TABLE IF NOT EXISTS notif_statuses (
	id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),
	analysis_id UUID UNIQUE NOT NULL,
	external_id UUID UNIQUE NOT NULL,
	hour_warning_sent BOOL NOT NULL DEFAULT false,
	day_warning_sent BOOL NOT NULL DEFAULT false,
	kill_warning_sent BOOL NOT NULL DEFAULT false,
	hour_warning_failure_count INT NOT NULL DEFAULT 0,
	day_warning_failure_count INT NOT NULL DEFAULT 0,
	kill_warning_failure_count INT NOT NULL DEFAULT 0,
	
	PRIMARY KEY (id)
);

-- docker_registries
--
-- Contains details about docker registries & authentication information
--
CREATE TABLE IF NOT EXISTS docker_registries (
  name text NOT NULL, -- PRIMARY KEY; name of the registry; for image names with a slash or several in them, this is everything up to the last slash. For images without a slash, the registry "" is assumed (though this should need no authentication information)
  username text NOT NULL, -- username to use with this registry
  password text NOT NULL, -- password to use with this registry

  PRIMARY KEY (name)
);

-- session -- VICE sessions
--
-- Taken from https://github.com/voxpelli/node-connect-pg-simple/blob/HEAD/table.sql
--
CREATE TABLE IF NOT EXISTS "session" (
  "sid" varchar NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);

ALTER TABLE ONLY "session"
    ADD CONSTRAINT "session_pkey"
    PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;
