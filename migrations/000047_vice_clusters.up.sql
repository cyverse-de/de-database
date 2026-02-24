BEGIN;

SET search_path = public, pg_catalog;

-- Registry of Kubernetes clusters integrated via Liqo for VICE deployments.
CREATE TABLE IF NOT EXISTS vice_clusters (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL,
    description text,
    base_url text NOT NULL,
    namespace text NOT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (id)
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_vice_clusters_name ON vice_clusters(name);
COMMENT ON TABLE vice_clusters IS 'Registry of Kubernetes clusters integrated via Liqo for VICE deployments';
COMMENT ON COLUMN vice_clusters.name IS 'Human-readable cluster name (unique)';
COMMENT ON COLUMN vice_clusters.description IS 'Optional description of the cluster';
COMMENT ON COLUMN vice_clusters.base_url IS 'Base URL for browser access; combined with job subdomain to form full URL (e.g. cyverse.run -> <subdomain>.cyverse.run)';
COMMENT ON COLUMN vice_clusters.namespace IS 'Liqo offloading-enabled namespace where VICE apps are deployed on this cluster';

-- Auto-update updated_at on row modification.
CREATE OR REPLACE FUNCTION update_vice_clusters_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS vice_clusters_updated ON vice_clusters;
CREATE TRIGGER vice_clusters_updated
    BEFORE UPDATE ON vice_clusters
    FOR EACH ROW EXECUTE FUNCTION update_vice_clusters_timestamp();

-- Track which cluster is running each analysis.
ALTER TABLE jobs ADD COLUMN IF NOT EXISTS cluster_id uuid REFERENCES vice_clusters(id) ON DELETE RESTRICT;

CREATE INDEX IF NOT EXISTS idx_jobs_cluster_id ON jobs(cluster_id);

COMMENT ON COLUMN jobs.cluster_id IS 'The VICE cluster running this analysis (NULL for batch jobs or legacy deployments)';

COMMIT;
