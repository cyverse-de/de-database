BEGIN;

SET search_path = public, pg_catalog;

-- Rename the status code, `complete`, to `approved`.
UPDATE request_status_codes
SET name = 'approved', display_name = 'Approved'
WHERE id = '184029d3-7767-413e-82a0-4af68f2282b7';

COMMIT
