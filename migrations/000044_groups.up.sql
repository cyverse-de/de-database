BEGIN;

SET search_path = public, pg_catalog;

-- Folders (Stems in Grouper terminology)
CREATE TABLE IF NOT EXISTS folders (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL UNIQUE,
    display_name text NOT NULL,
    display_extension text NOT NULL,
    extension text NOT NULL,
    description text,
    id_index bigserial,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    modified_at timestamp NOT NULL DEFAULT now(),
    modified_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_folders_name ON folders(name);
CREATE INDEX idx_folders_created_by ON folders(created_by);

COMMENT ON TABLE folders IS 'Hierarchical containers (stems) that organize groups';
COMMENT ON COLUMN folders.name IS 'Full hierarchical path name';
COMMENT ON COLUMN folders.display_extension IS 'Human-readable name for this level only';
COMMENT ON COLUMN folders.extension IS 'Machine name for this level only';
COMMENT ON COLUMN folders.id_index IS 'Sequential index for compatibility with Grouper idIndex';

-- Groups
CREATE TABLE IF NOT EXISTS groups (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL UNIQUE,
    display_name text NOT NULL,
    display_extension text NOT NULL,
    extension text NOT NULL,
    description text,
    type text NOT NULL DEFAULT 'group',
    id_index bigserial,
    has_composite boolean NOT NULL DEFAULT false,
    is_composite_factor boolean NOT NULL DEFAULT false,
    composite_type text,
    left_group_id uuid REFERENCES groups(id) ON DELETE SET NULL,
    right_group_id uuid REFERENCES groups(id) ON DELETE SET NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    modified_at timestamp NOT NULL DEFAULT now(),
    modified_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id),
    CONSTRAINT composite_groups_check CHECK (
        (has_composite = false) OR
        (has_composite = true AND left_group_id IS NOT NULL AND right_group_id IS NOT NULL AND composite_type IS NOT NULL)
    )
);

CREATE INDEX idx_groups_name ON groups(name);
CREATE INDEX idx_groups_type ON groups(type);
CREATE INDEX idx_groups_created_by ON groups(created_by);
CREATE INDEX idx_groups_left_group_id ON groups(left_group_id);
CREATE INDEX idx_groups_right_group_id ON groups(right_group_id);

COMMENT ON TABLE groups IS 'Groups that contain members (subjects)';
COMMENT ON COLUMN groups.type IS 'Type of group - typically "group" or "role"';
COMMENT ON COLUMN groups.has_composite IS 'Whether this group is composed from other groups';
COMMENT ON COLUMN groups.composite_type IS 'How composite groups are combined: UNION, INTERSECTION, or COMPLEMENT';

-- Group Members
CREATE TABLE IF NOT EXISTS group_members (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    group_id uuid NOT NULL REFERENCES groups(id) ON DELETE CASCADE,
    subject_id text NOT NULL,
    subject_source_id text NOT NULL DEFAULT 'ldap',
    is_direct boolean NOT NULL DEFAULT true,
    via_group_id uuid REFERENCES groups(id) ON DELETE CASCADE,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE UNIQUE INDEX idx_unique_direct_membership ON group_members(group_id, subject_id, subject_source_id)
    WHERE is_direct = true;

CREATE INDEX idx_group_members_group_id ON group_members(group_id);
CREATE INDEX idx_group_members_subject_id ON group_members(subject_id);
CREATE INDEX idx_group_members_subject_source ON group_members(subject_source_id);
CREATE INDEX idx_group_members_via_group ON group_members(via_group_id);

COMMENT ON TABLE group_members IS 'Membership relationships between subjects and groups';
COMMENT ON COLUMN group_members.subject_id IS 'Subject identifier (typically username)';
COMMENT ON COLUMN group_members.subject_source_id IS 'Source system for the subject';
COMMENT ON COLUMN group_members.is_direct IS 'True if explicitly added to group, false if inherited';
COMMENT ON COLUMN group_members.via_group_id IS 'For indirect membership, the intermediate group';

-- Group Privileges
CREATE TYPE group_privilege_type AS ENUM (
    'view',
    'read',
    'update',
    'admin',
    'optin',
    'optout',
    'groupAttrRead',
    'groupAttrUpdate'
);

CREATE TABLE IF NOT EXISTS group_privileges (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    group_id uuid NOT NULL REFERENCES groups(id) ON DELETE CASCADE,
    subject_id text NOT NULL,
    subject_source_id text NOT NULL DEFAULT 'ldap',
    privilege_type group_privilege_type NOT NULL,
    allowed boolean NOT NULL DEFAULT true,
    revokable boolean NOT NULL DEFAULT true,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id),
    CONSTRAINT unique_group_privilege UNIQUE (group_id, subject_id, subject_source_id, privilege_type)
);

CREATE INDEX idx_group_privileges_group_id ON group_privileges(group_id);
CREATE INDEX idx_group_privileges_subject_id ON group_privileges(subject_id);
CREATE INDEX idx_group_privileges_privilege_type ON group_privileges(privilege_type);

COMMENT ON TABLE group_privileges IS 'Access control privileges for groups';
COMMENT ON COLUMN group_privileges.allowed IS 'Whether this privilege is granted (true) or denied (false)';
COMMENT ON COLUMN group_privileges.revokable IS 'Whether this privilege assignment can be revoked';

-- Folder Privileges
CREATE TYPE folder_privilege_type AS ENUM (
    'create',
    'stem',
    'stemAttrRead',
    'stemAttrUpdate'
);

CREATE TABLE IF NOT EXISTS folder_privileges (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    folder_id uuid NOT NULL REFERENCES folders(id) ON DELETE CASCADE,
    subject_id text NOT NULL,
    subject_source_id text NOT NULL DEFAULT 'ldap',
    privilege_type folder_privilege_type NOT NULL,
    allowed boolean NOT NULL DEFAULT true,
    revokable boolean NOT NULL DEFAULT true,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id),
    CONSTRAINT unique_folder_privilege UNIQUE (folder_id, subject_id, subject_source_id, privilege_type)
);

CREATE INDEX idx_folder_privileges_folder_id ON folder_privileges(folder_id);
CREATE INDEX idx_folder_privileges_subject_id ON folder_privileges(subject_id);
CREATE INDEX idx_folder_privileges_privilege_type ON folder_privileges(privilege_type);

COMMENT ON TABLE folder_privileges IS 'Access control privileges for folders/stems';
COMMENT ON COLUMN folder_privileges.allowed IS 'Whether this privilege is granted (true) or denied (false)';

-- Attribute Definitions
CREATE TABLE IF NOT EXISTS attribute_definitions (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name text NOT NULL UNIQUE,
    description text,
    id_index bigserial,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_attribute_definitions_name ON attribute_definitions(name);

COMMENT ON TABLE attribute_definitions IS 'Defines types of attributes that can be assigned to entities';
COMMENT ON COLUMN attribute_definitions.name IS 'Full hierarchical name of the attribute definition';

-- Attribute Definition Names
CREATE TABLE IF NOT EXISTS attribute_names (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    attribute_definition_id uuid NOT NULL REFERENCES attribute_definitions(id) ON DELETE CASCADE,
    name text NOT NULL UNIQUE,
    display_name text NOT NULL,
    display_extension text NOT NULL,
    extension text NOT NULL,
    description text,
    id_index bigserial,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_attribute_names_name ON attribute_names(name);
CREATE INDEX idx_attribute_names_attr_def_id ON attribute_names(attribute_definition_id);

COMMENT ON TABLE attribute_names IS 'Named attributes that can be assigned, associated with attribute definitions';
COMMENT ON COLUMN attribute_names.name IS 'Full hierarchical name of the attribute';

-- Permission Actions
CREATE TABLE IF NOT EXISTS permission_actions (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    attribute_definition_id uuid NOT NULL REFERENCES attribute_definitions(id) ON DELETE CASCADE,
    name text NOT NULL,
    created_at timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (id),
    CONSTRAINT unique_action_per_definition UNIQUE (attribute_definition_id, name)
);

CREATE INDEX idx_permission_actions_attr_def_id ON permission_actions(attribute_definition_id);

COMMENT ON TABLE permission_actions IS 'Available actions that can be used in permission assignments';
COMMENT ON COLUMN permission_actions.name IS 'Name of the action (e.g., read, write, admin)';

-- Permission Assignments
CREATE TYPE permission_assignment_type AS ENUM (
    'role',
    'role_subject'
);

CREATE TABLE IF NOT EXISTS permission_assignments (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    attribute_name_id uuid NOT NULL REFERENCES attribute_names(id) ON DELETE CASCADE,
    action_id uuid NOT NULL REFERENCES permission_actions(id) ON DELETE CASCADE,
    assignment_type permission_assignment_type NOT NULL,
    role_id uuid REFERENCES groups(id) ON DELETE CASCADE,
    membership_id uuid REFERENCES group_members(id) ON DELETE CASCADE,
    subject_id text,
    subject_source_id text,
    disallowed boolean NOT NULL DEFAULT false,
    enabled boolean NOT NULL DEFAULT true,
    created_at timestamp NOT NULL DEFAULT now(),
    created_by uuid NOT NULL REFERENCES users(id),
    modified_at timestamp NOT NULL DEFAULT now(),
    PRIMARY KEY (id),
    CONSTRAINT role_permission_check CHECK (
        (assignment_type = 'role' AND role_id IS NOT NULL AND membership_id IS NULL) OR
        (assignment_type = 'role_subject' AND membership_id IS NOT NULL AND role_id IS NOT NULL AND subject_id IS NOT NULL)
    )
);

CREATE UNIQUE INDEX idx_unique_role_permission ON permission_assignments(attribute_name_id, action_id, role_id)
    WHERE assignment_type = 'role';

CREATE UNIQUE INDEX idx_unique_membership_permission ON permission_assignments(attribute_name_id, action_id, membership_id, subject_id)
    WHERE assignment_type = 'role_subject';

CREATE INDEX idx_permission_assignments_attr_name ON permission_assignments(attribute_name_id);
CREATE INDEX idx_permission_assignments_action ON permission_assignments(action_id);
CREATE INDEX idx_permission_assignments_role ON permission_assignments(role_id);
CREATE INDEX idx_permission_assignments_membership ON permission_assignments(membership_id);
CREATE INDEX idx_permission_assignments_subject ON permission_assignments(subject_id);
CREATE INDEX idx_permission_assignments_type ON permission_assignments(assignment_type);

COMMENT ON TABLE permission_assignments IS 'Permission assignments to roles or role members';
COMMENT ON COLUMN permission_assignments.assignment_type IS 'Whether permission is for entire role or specific member';
COMMENT ON COLUMN permission_assignments.role_id IS 'Target role for role-level permissions';
COMMENT ON COLUMN permission_assignments.membership_id IS 'Target membership for member-level permissions';
COMMENT ON COLUMN permission_assignments.disallowed IS 'Whether this permission is explicitly disallowed';

-- Group Type Names
CREATE TABLE IF NOT EXISTS group_type_names (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    group_id uuid NOT NULL REFERENCES groups(id) ON DELETE CASCADE,
    type_name text NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_group_type UNIQUE (group_id, type_name)
);

CREATE INDEX idx_group_type_names_group_id ON group_type_names(group_id);
CREATE INDEX idx_group_type_names_type_name ON group_type_names(type_name);

COMMENT ON TABLE group_type_names IS 'Custom type classifications that can be assigned to groups';
COMMENT ON COLUMN group_type_names.type_name IS 'Name of the type classification';

-- Group Attributes
CREATE TABLE IF NOT EXISTS group_attributes (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    group_id uuid NOT NULL REFERENCES groups(id) ON DELETE CASCADE,
    attribute_name text NOT NULL,
    attribute_value text NOT NULL,
    PRIMARY KEY (id)
);

CREATE INDEX idx_group_attributes_group_id ON group_attributes(group_id);
CREATE INDEX idx_group_attributes_name ON group_attributes(attribute_name);

COMMENT ON TABLE group_attributes IS 'Custom key-value attributes for groups';
COMMENT ON COLUMN group_attributes.attribute_name IS 'Name of the custom attribute';
COMMENT ON COLUMN group_attributes.attribute_value IS 'Value of the custom attribute';

COMMIT;
