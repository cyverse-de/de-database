BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS async_task_behavior;
DROP TABLE IF EXISTS async_task_status;
DROP TABLE IF EXISTS async_tasks;

COMMIT;
