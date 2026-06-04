BEGIN;

SET search_path = public, pg_catalog;

--
-- accepting_launches is a graceful drain switch: when false, app-exposer routes
-- no new launches to the operator, but it stays in service otherwise (still
-- reconciled, existing analyses remain listable/searchable/quota-counted).
--
ALTER TABLE IF EXISTS ONLY operators
    ADD COLUMN IF NOT EXISTS accepting_launches boolean NOT NULL DEFAULT true;

--
-- deactivated is a full kill switch: when true, the operator drops out of the
-- live scheduler pool entirely (no launches, reconciliation bypassed, removed
-- from listing/search/quota fan-out). It takes precedence over
-- accepting_launches.
--
ALTER TABLE IF EXISTS ONLY operators
    ADD COLUMN IF NOT EXISTS deactivated boolean NOT NULL DEFAULT false;

--
-- accepting_launches and deactivated are scheduling-relevant, so changes must
-- notify listeners immediately (rather than waiting for the periodic poll).
-- Recreate the per-row update trigger with the two new columns added to its
-- column list. Reuse the existing notify_operators_changed() function.
--
DROP TRIGGER IF EXISTS trigger_operators_notify_update ON operators;
CREATE TRIGGER trigger_operators_notify_update
    AFTER UPDATE OF name, url, tls_skip_verify, priority, accepting_launches, deactivated ON operators
    FOR EACH ROW
    EXECUTE FUNCTION notify_operators_changed();

COMMIT;
