\set ON_ERROR_STOP ON

BEGIN;

-- Get rid of all old-style analysis descriptions.
UPDATE transformation_activity SET description = ''
    WHERE description LIKE 'help/%'
    OR description = 'none';

COMMIT;
