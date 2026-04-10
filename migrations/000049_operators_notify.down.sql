BEGIN;

SET search_path = public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_operators_notify ON operators;
DROP FUNCTION IF EXISTS notify_operators_changed();

COMMIT;
