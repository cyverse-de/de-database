SET search_path = public, pg_catalog;

ALTER TABLE ONLY async_task_status
    ADD CONSTRAINT async_task_status_pkey
    PRIMARY KEY(async_task_id, status, created_date);
