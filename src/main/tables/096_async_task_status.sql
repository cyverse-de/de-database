SET search_path = public, pg_catalog;

--
-- async_task_status table
--
CREATE TABLE async_task_status (
	async_task_id uuid NOT NULL,
	status text NOT NULL,
	created_date timestamp NOT NULL
);

--
-- Index to speed up listing in sorted date order
--
CREATE INDEX async_task_status_id_date_index ON async_task_status(async_task_id, created_date);
