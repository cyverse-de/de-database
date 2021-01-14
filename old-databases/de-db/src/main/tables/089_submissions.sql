SET search_path = public, pg_catalog;

-- Contains job submission data in JSON format.

CREATE TABLE submissions (
  -- Primary Key
  id uuid NOT NULL,
  submission json NOT NULL
);
