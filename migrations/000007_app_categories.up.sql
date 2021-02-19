SET search_path = public, pg_catalog;

-- workspace
CREATE TABLE IF NOT EXISTS workspace (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    root_category_id uuid,
    is_public boolean DEFAULT false,
    user_id uuid NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_users_fk
    FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE;

-- app_categories
CREATE TABLE IF NOT EXISTS app_categories (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255),
    description text,
    workspace_id uuid NOT NULL,
    PRIMARY KEY (id)
);

-- circular dependency
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_root_category_id_fkey
    FOREIGN KEY (root_category_id)
    REFERENCES app_categories(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_categories
    ADD CONSTRAINT app_categories_workspace_id_fk
    FOREIGN KEY (workspace_id)
    REFERENCES workspace(id) ON DELETE CASCADE;

-- app_category_group
CREATE TABLE IF NOT EXISTS app_category_group (
    parent_category_id uuid NOT NULL,
    child_category_id uuid NOT NULL,
    child_index integer NOT NULL,
    PRIMARY KEY (parent_category_id, child_category_id)
);

ALTER TABLE ONLY app_category_group
    ADD CONSTRAINT app_category_group_parent_category_id_fkey
    FOREIGN KEY (parent_category_id)
    REFERENCES app_categories(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_category_group
    ADD CONSTRAINT app_category_group_child_category_id_fkey
    FOREIGN KEY (child_category_id)
    REFERENCES app_categories(id) ON DELETE CASCADE;

-- app_category_app
CREATE TABLE IF NOT EXISTS app_category_app (
    app_category_id uuid NOT NULL,
    app_id uuid NOT NULL,
    PRIMARY KEY (app_category_id, app_id)
);

ALTER TABLE ONLY app_category_app
    ADD CONSTRAINT app_category_app_app_category_id_fkey
    FOREIGN KEY (app_category_id)
    REFERENCES app_categories(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_category_app
    ADD CONSTRAINT app_category_app_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

-- suggested_groups
CREATE TABLE IF NOT EXISTS suggested_groups (
    app_id uuid NOT NULL,
    app_category_id uuid NOT NULL,
    PRIMARY KEY (app_id, app_category_id)
);

ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_app_category_id_fkey
    FOREIGN KEY (app_category_id)
    REFERENCES app_categories(id) ON DELETE CASCADE;

ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id) ON DELETE CASCADE;

-- app_hierarchy_version
CREATE TABLE IF NOT EXISTS app_hierarchy_version (
    version VARCHAR NOT NULL,
    applied_by UUID NOT NULL,
    applied timestamp DEFAULT now()
);

ALTER TABLE ONLY app_hierarchy_version
    ADD CONSTRAINT app_hierarchy_version_applied_by_fkey
    FOREIGN KEY (applied_by)
    REFERENCES users(id);

CREATE INDEX IF NOT EXISTS app_hierarchy_version_applied
    ON app_hierarchy_version(applied);
