BEGIN;

SET search_path = public, pg_catalog;

-- workspace
CREATE TABLE IF NOT EXISTS workspace (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    root_category_id uuid,
    is_public boolean DEFAULT false,
    user_id uuid NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

-- app_categories
CREATE TABLE IF NOT EXISTS app_categories (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255) NOT NULL,
    description text,
    workspace_id uuid NOT NULL,
    FOREIGN KEY (workspace_id) REFERENCES workspace(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

-- circular dependency; drop first then recreate
ALTER TABLE ONLY workspace
    DROP CONSTRAINT IF EXISTS workspace_root_category_id_fkey;

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_root_category_id_fkey
    FOREIGN KEY (root_category_id)
    REFERENCES app_categories(id) ON DELETE CASCADE;

-- app_category_group
CREATE TABLE IF NOT EXISTS app_category_group (
    parent_category_id uuid NOT NULL,
    child_category_id uuid NOT NULL,
    child_index integer NOT NULL,
    FOREIGN KEY (parent_category_id) REFERENCES app_categories(id) ON DELETE CASCADE,
    FOREIGN KEY (child_category_id) REFERENCES app_categories(id) ON DELETE CASCADE,
    PRIMARY KEY (parent_category_id, child_category_id)
);

-- app_category_app
CREATE TABLE IF NOT EXISTS app_category_app (
    app_category_id uuid NOT NULL,
    app_id uuid NOT NULL,
    FOREIGN KEY (app_category_id) REFERENCES app_categories(id) ON DELETE CASCADE,
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    PRIMARY KEY (app_category_id, app_id)
);

-- suggested_groups
CREATE TABLE IF NOT EXISTS suggested_groups (
    app_id uuid NOT NULL,
    app_category_id uuid NOT NULL,
    FOREIGN KEY (app_category_id) REFERENCES app_categories(id) ON DELETE CASCADE,
    FOREIGN KEY (app_id) REFERENCES apps(id) ON DELETE CASCADE,
    PRIMARY KEY (app_id, app_category_id)
);

-- app_hierarchy_version
CREATE TABLE IF NOT EXISTS app_hierarchy_version (
    version VARCHAR NOT NULL,
    applied_by UUID NOT NULL,
    applied timestamp DEFAULT now(),
    FOREIGN KEY (applied_by) REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS app_hierarchy_version_applied
    ON app_hierarchy_version(applied);

COMMIT;
