BEGIN;

SET search_path = public, pg_catalog;

-- async_tasks
CREATE TABLE IF NOT EXISTS async_tasks (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    type text NOT NULL,
    username text,
    data json,
    start_date timestamp,
    end_date timestamp,

    PRIMARY KEY (id)
);

--
-- Indices to speed up listing and filtering
--
CREATE INDEX IF NOT EXISTS async_tasks_type_index ON async_tasks(type);
CREATE INDEX IF NOT EXISTS async_tasks_username_index ON async_tasks(username);
CREATE INDEX IF NOT EXISTS async_tasks_start_date_index ON async_tasks(start_date);
CREATE INDEX IF NOT EXISTS async_tasks_end_date_index ON async_tasks(end_date);

-- async_task_status
CREATE TABLE IF NOT EXISTS async_task_status (
	async_task_id uuid NOT NULL,
	status text NOT NULL,
	detail text,
	created_date timestamp NOT NULL,

	PRIMARY KEY (async_task_id, status, created_date)
);

--
-- Index to speed up listing in sorted date order
--
CREATE INDEX IF NOT EXISTS async_task_status_id_date_index ON async_task_status(async_task_id, created_date);

ALTER TABLE async_task_status
    ADD CONSTRAINT async_task_status_async_task_id_fkey
    FOREIGN KEY (async_task_id)
    REFERENCES async_tasks(id) ON DELETE CASCADE;

-- async_task_behavior
CREATE TABLE IF NOT EXISTS async_task_behavior (
	async_task_id uuid NOT NULL,
	behavior_type text NOT NULL,
	data json,

	PRIMARY KEY (async_task_id, behavior_type)
);

--
-- Index to speed up listings by behavior type
--
CREATE INDEX IF NOT EXISTS async_task_behavior_behavior_type_index ON async_task_behavior(behavior_type);

ALTER TABLE async_task_behavior
    ADD CONSTRAINT async_task_behavior_async_task_id_fkey
    FOREIGN KEY (async_task_id)
    REFERENCES async_tasks(id) ON DELETE CASCADE;

COMMIT;
