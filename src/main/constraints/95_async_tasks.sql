SET search_path = public, pg_catalog;

ALTER TABLE async_task_status
    ADD CONSTRAINT async_task_status_async_task_id_fkey
    FOREIGN KEY (async_task_id)
    REFERENCES async_tasks(id) ON DELETE CASCADE;

ALTER TABLE async_task_behavior
    ADD CONSTRAINT async_task_behavior_async_task_id_fkey
    FOREIGN KEY (async_task_id)
    REFERENCES async_tasks(id) ON DELETE CASCADE;
