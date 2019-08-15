SET search_path = public, pg_catalog;

--
-- async_task_status table
--
CREATE TABLE async_task_status (
	async_task_id uuid NOT NULL,
	status text NOT NULL,
	created_date timestamp NOT NULL
);


