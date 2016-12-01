SET search_path = public, pg_catalog;

--
-- Contains details about docker registries & authentication information
--
CREATE TABLE docker_registries (
  name text NOT NULL, -- PRIMARY KEY; name of the registry; for image names with a slash or several in them, this is everything up to the last slash. For images without a slash, the registry "" is assumed (though this should need no authentication information)
  username text NOT NULL, -- username to use with this registry
  password text NOT NULL -- password to use with this registry
);
