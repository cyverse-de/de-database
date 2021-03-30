BEGIN;
    CREATE SCHEMA IF NOT EXISTS permissions;
    SET search_path = permissions, public, pg_catalog;

    --
    -- Table for storing the types of resources to which permissions may be applied.
    --
    CREATE TABLE IF NOT EXISTS resource_types (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        name varchar(64) NOT NULL,
        description text NOT NULL,
        PRIMARY KEY (id)
    );

    --
    -- Uniqueness constraint on the resource type name.
    --
    CREATE UNIQUE INDEX IF NOT EXISTS resource_types_name_unique
        ON resource_types (lower(trim(regexp_replace(name, '\s+', ' ', 'g'))));

    --
    -- Table for storing specific resources to which permissions may be applied.
    --
    CREATE TABLE IF NOT EXISTS resources (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        name varchar(64) NOT NULL,
        resource_type_id uuid NOT NULL,
        PRIMARY KEY (id),
        UNIQUE (name, resource_type_id),
        FOREIGN KEY (resource_type_id) REFERENCES resource_types(id)
    );

    --
    -- subject type enumeration
    --
    DO $$
    BEGIN
        CREATE TYPE subject_type_enum AS ENUM ('user', 'group');
    EXCEPTION
        WHEN duplicate_object THEN
            RAISE NOTICE 'subject_type_enum type already exists, moving on';
    END$$;

    --
    -- Table for storing subjects to whom permissions can be granted.
    --
    CREATE TABLE IF NOT EXISTS subjects (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        subject_id varchar(64) UNIQUE NOT NULL,
        subject_type subject_type_enum NOT NULL,
        PRIMARY KEY (id)
    );

    --
    -- The table for storing permission levels that can be applied to resources.
    --
    CREATE TABLE IF NOT EXISTS permission_levels (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        name varchar(64) UNIQUE NOT NULL,
        description text NOT NULL,
        precedence integer UNIQUE NOT NULL,
        PRIMARY KEY (id)
    );

    --
    -- Table for storing permissions that have been granted.
    --
    CREATE TABLE IF NOT EXISTS permissions (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        subject_id uuid NOT NULL,
        resource_id uuid NOT NULL,
        permission_level_id uuid NOT NULL,
        PRIMARY KEY (id),
        UNIQUE (subject_id, resource_id),
        FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
        FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE,
        FOREIGN KEY (permission_level_id) REFERENCES permission_levels(id)
    );

INSERT INTO resource_types (id, name, description) VALUES
    ('de6e3a52-3d51-11e6-ba3c-008cfa5ae621', 'app', 'A Discovery Environment application.'),
    ('de6e50aa-3d51-11e6-ba3c-008cfa5ae621', 'analysis', 'The results of running a Discovery Environment application.'),
    ('f968f35c-13d8-11e7-82d3-008cfa5ae621', 'tool', 'A Discovery Environment tool run by an application.')
    ON CONFLICT DO NOTHING;

INSERT INTO permission_levels (id, name, description, precedence) VALUES
    ('de6d5498-3d51-11e6-ba3c-008cfa5ae621', 'own', 'Implies that the user can assign permissions to, read, and modify a resource.', 0),
    ('de6d6172-3d51-11e6-ba3c-008cfa5ae621', 'write', 'Implies that the user can read and modify a resource.', 1),
    ('de6d63b6-3d51-11e6-ba3c-008cfa5ae621', 'admin', 'Implies that a user can read and make limited motifications to a resource.', 2),
    ('de6d6514-3d51-11e6-ba3c-008cfa5ae621', 'read', 'Implies that a user can read a resource.', 3)
    ON CONFLICT DO NOTHING;

COMMIT;
