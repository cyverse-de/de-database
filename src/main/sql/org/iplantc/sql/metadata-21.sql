\set ON_ERROR_STOP ON

BEGIN;

-- Add Confluence comment ID column to the ratings table.
ALTER TABLE ratings ADD COLUMN comment_id BIGINT;
DROP VIEW rating_listing;
CREATE VIEW rating_listing AS
    SELECT row_number() OVER (ORDER BY analysis.hid, u.id) AS id,
           analysis.hid AS analysis_id,
           u.id AS user_id,
           ur.comment_id AS comment_id,
           ur.rating AS user_rating
    FROM transformation_activity analysis
         CROSS JOIN users u
         LEFT JOIN ratings ur ON analysis.hid = ur.transformation_activity_id AND ur.user_id = u.id;

-- Add is_implicit column for output dataobjects.
ALTER TABLE dataobjects ADD COLUMN is_implicit BOOLEAN DEFAULT FALSE;

-- Add required column for output validator.
ALTER TABLE validator ADD COLUMN required BOOLEAN DEFAULT FALSE;

COMMIT;
