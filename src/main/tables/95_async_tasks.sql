SET search_path = public, pg_catalog;

--
-- async_tasks table
--
CREATE TABLE async_tasks (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    type text NOT NULL,
    username text,
    data json,
    start_date timestamp,
    end_date timestamp
);

