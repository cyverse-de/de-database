BEGIN;

SET search_path = public, pg_catalog;

-- Destructive: any rows loaded by the notifications_db_merge playbook are
-- lost. Reverting after the cutover means restoring from the dump that
-- playbook leaves behind.
DROP INDEX IF EXISTS notifications_time_created_index;
DROP INDEX IF EXISTS notifications_notification_type_id_index;
DROP INDEX IF EXISTS notifications_user_id_index;
DROP TABLE IF EXISTS notifications;

COMMIT;
