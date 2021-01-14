SET search_path = public, pg_catalog;

--
-- async_task_behavior table
--
CREATE TABLE async_task_behavior (
	async_task_id uuid NOT NULL,
	behavior_type text NOT NULL,
	data json
);

--
-- Index to speed up listings by behavior type
--
CREATE INDEX async_task_behavior_behavior_type_index ON async_task_behavior(behavior_type);
