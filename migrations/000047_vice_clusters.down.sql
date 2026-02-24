BEGIN;

SET search_path = public, pg_catalog;

ALTER TABLE jobs DROP COLUMN IF EXISTS cluster_id;

DROP TRIGGER IF EXISTS vice_clusters_updated ON vice_clusters;
DROP FUNCTION IF EXISTS update_vice_clusters_timestamp();

DROP TABLE IF EXISTS vice_clusters;

COMMIT;
