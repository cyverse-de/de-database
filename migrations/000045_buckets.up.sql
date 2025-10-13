BEGIN;

SET search_path = public, pg_catalog;

--
-- S3 Buckets table - tracks buckets managed by the Discovery Environment
--
CREATE TABLE IF NOT EXISTS buckets (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL UNIQUE,
    user_id uuid NOT NULL,
    endpoint_url text NOT NULL,
    region text,
    description text,
    deleted boolean NOT NULL DEFAULT false,
    created_at timestamp NOT NULL DEFAULT now(),
    modified_at timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX idx_buckets_name ON buckets(name);
CREATE INDEX idx_buckets_user_id ON buckets(user_id);
CREATE INDEX idx_buckets_deleted ON buckets(deleted);

COMMENT ON TABLE buckets IS 'S3 buckets managed by the Discovery Environment on behalf of users';
COMMENT ON COLUMN buckets.name IS 'S3 bucket name (globally unique)';
COMMENT ON COLUMN buckets.user_id IS 'DE user who owns this bucket';
COMMENT ON COLUMN buckets.endpoint_url IS 'S3 service endpoint URL';
COMMENT ON COLUMN buckets.region IS 'S3 region where bucket is located';
COMMENT ON COLUMN buckets.deleted IS 'Soft delete flag';

--
-- Bucket permission levels
--
DO $$
BEGIN
    CREATE TYPE bucket_permission_level AS ENUM (
        'read',
        'write',
        'admin'
    );
EXCEPTION
    WHEN duplicate_object THEN
        RAISE NOTICE 'bucket_permission_level type already exists, moving on';
END$$;

--
-- Bucket permissions table - tracks user access to buckets
--
CREATE TABLE IF NOT EXISTS bucket_permissions (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    bucket_id uuid NOT NULL,
    user_id uuid NOT NULL,
    permission_level bucket_permission_level NOT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (bucket_id) REFERENCES buckets(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id),
    CONSTRAINT unique_bucket_user_permission UNIQUE (bucket_id, user_id)
);

CREATE INDEX idx_bucket_permissions_bucket_id ON bucket_permissions(bucket_id);
CREATE INDEX idx_bucket_permissions_user_id ON bucket_permissions(user_id);
CREATE INDEX idx_bucket_permissions_permission_level ON bucket_permissions(permission_level);

COMMENT ON TABLE bucket_permissions IS 'Access permissions for shared S3 buckets';
COMMENT ON COLUMN bucket_permissions.bucket_id IS 'The bucket being shared';
COMMENT ON COLUMN bucket_permissions.user_id IS 'User receiving access';
COMMENT ON COLUMN bucket_permissions.permission_level IS 'Level of access granted (read, write, admin)';
COMMENT ON COLUMN bucket_permissions.created_by IS 'User who granted this permission';

COMMIT;
