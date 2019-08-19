SET search_path = public, pg_catalog;

ALTER TABLE ONLY async_task_behavior
    ADD CONSTRAINT async_task_behavior_pkey
    PRIMARY KEY(async_task_id, behavior_type);
