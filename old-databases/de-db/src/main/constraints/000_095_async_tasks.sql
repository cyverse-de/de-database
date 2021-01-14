SET search_path = public, pg_catalog;

ALTER TABLE ONLY async_tasks
    ADD CONSTRAINT async_tasks_pkey
    PRIMARY KEY(id);
