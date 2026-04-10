BEGIN;

SET search_path = public, pg_catalog;

--
-- Notify all listeners whenever the operators table changes so that
-- app-exposer replicas can sync their in-memory scheduler immediately
-- rather than waiting for the periodic poll.
--
CREATE OR REPLACE FUNCTION notify_operators_changed()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM pg_notify('operator_changed', '');
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_operators_notify ON operators;
CREATE TRIGGER trigger_operators_notify
    AFTER INSERT OR UPDATE OR DELETE ON operators
    FOR EACH STATEMENT
    EXECUTE FUNCTION notify_operators_changed();

COMMIT;
