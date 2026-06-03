BEGIN;

SET search_path = public, pg_catalog;

--
-- Restore the update trigger to its original scheduling-column list before
-- dropping the columns it would otherwise reference.
--
DROP TRIGGER IF EXISTS trigger_operators_notify_update ON operators;
CREATE TRIGGER trigger_operators_notify_update
    AFTER UPDATE OF name, url, tls_skip_verify, priority ON operators
    FOR EACH ROW
    EXECUTE FUNCTION notify_operators_changed();

ALTER TABLE IF EXISTS ONLY operators
    DROP COLUMN IF EXISTS deactivated,
    DROP COLUMN IF EXISTS accepting_launches;

COMMIT;
