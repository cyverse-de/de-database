BEGIN;

SET search_path = public, pg_catalog;

--
-- Notify all listeners whenever the operators table changes in a way that
-- affects scheduling so that app-exposer replicas can sync their in-memory
-- scheduler immediately rather than waiting for the periodic poll.
--
-- Two triggers are used because UPDATE OF (column list) requires a row-level
-- trigger, while INSERT/DELETE are kept as a cheaper statement-level trigger.
-- Reconciliation heartbeat writes (last_reconciled_at, updated_at) do NOT
-- fire a notification, preventing a feedback loop where every 30-second
-- reconcile tick would trigger an unnecessary scheduler sync.
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
    AFTER INSERT OR DELETE ON operators
    FOR EACH STATEMENT
    EXECUTE FUNCTION notify_operators_changed();

DROP TRIGGER IF EXISTS trigger_operators_notify_update ON operators;
CREATE TRIGGER trigger_operators_notify_update
    AFTER UPDATE OF name, url, tls_skip_verify, priority ON operators
    FOR EACH ROW
    EXECUTE FUNCTION notify_operators_changed();

COMMIT;
