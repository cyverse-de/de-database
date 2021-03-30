BEGIN;

SET search_path = public, pg_catalog;

-- Rename the status code, `approved`, to `complete`.
UPDATE request_status_codes
SET name = 'complete', display_name = 'Complete'
WHERE id = '184029d3-7767-413e-82a0-4af68f2282b7';

COMMIT
