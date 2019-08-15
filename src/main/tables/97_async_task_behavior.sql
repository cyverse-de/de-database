SET search_path = public, pg_catalog;

--
-- async_task_behavior table
--
CREATE TABLE async_task_behavior (
	async_task_id uuid NOT NULL,
	behavior_type text NOT NULL,
	data json
);


