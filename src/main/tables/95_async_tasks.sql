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

--
-- Indices to speed up listing and filtering
--
CREATE INDEX async_tasks_type_index ON async_tasks(type);
CREATE INDEX async_tasks_username_index ON async_tasks(username);
CREATE INDEX async_tasks_start_date_index ON async_tasks(start_date);
CREATE INDEX async_tasks_end_date_index ON async_tasks(end_date);
