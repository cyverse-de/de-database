BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Group membership moves out of Grouper and into this schema so that expanding
-- a subject to its groups becomes a join inside the permission lookup query
-- rather than a call to another service.
--

--
-- Subject identifiers are usernames for users and group identifiers for groups.
-- 64 characters is too narrow for the longest usernames already in public.users,
-- and group membership now requires every member to have a subject row.
--
ALTER TABLE subjects ALTER COLUMN subject_id TYPE varchar(512);

--
-- Groups imported from Grouper keep their original 32-hex identifiers so that
-- existing permission grants and iRODS group names remain valid. Groups created
-- from here on must be indistinguishable from them, so the default mints the
-- same dashless form rather than a canonical uuid.
--
ALTER TABLE subjects
    ALTER COLUMN subject_id SET DEFAULT replace(uuid_generate_v1()::text, '-', '');

--
-- Redundant with the primary key for uniqueness, but required as the target of
-- the composite foreign keys below, which pin the subject type of a referencing
-- row (a group's backing subject must be a group; an effective member must be a
-- user).
--
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'subjects_id_subject_type_key'
    ) THEN
        ALTER TABLE subjects
            ADD CONSTRAINT subjects_id_subject_type_key UNIQUE (id, subject_type);
    END IF;
END$$;

--
-- The kinds of group the DE models, replacing the folder structure Grouper
-- encoded in colon-delimited paths. owner_required distinguishes kinds that live
-- under a user (teams, collaborator lists) from globally named ones.
--
CREATE TABLE IF NOT EXISTS group_types (
    name varchar(32) NOT NULL,
    description text NOT NULL,
    owner_required boolean NOT NULL,
    PRIMARY KEY (name),
    -- Target of the composite foreign key from groups.
    UNIQUE (name, owner_required)
);

COMMENT ON TABLE group_types IS
    'The kinds of group the Discovery Environment models.';

INSERT INTO group_types (name, description, owner_required) VALUES
    ('collaborator_list', 'A user''s private list of collaborators.', true),
    ('team', 'A user-created team that others may be invited to or may join.', true),
    ('community', 'A curated, globally named community of DE users.', false),
    ('system', 'A group managed by the DE itself, such as the group of all DE users.', false)
    ON CONFLICT DO NOTHING;

--
-- A group is its subject row plus attributes: the primary key is the internal
-- subjects.id, so a permission granted to a group can be expanded to its members
-- without translating between identifier spaces. The externally visible group
-- identifier is subjects.subject_id.
--
CREATE TABLE IF NOT EXISTS groups (
    subject_id uuid NOT NULL,
    subject_type subject_type_enum NOT NULL DEFAULT 'group'
        CHECK (subject_type = 'group'),
    group_type varchar(32) NOT NULL,
    owner varchar(512) CHECK (owner IS NULL OR owner ~ '[^[:space:]]'),
    -- Derived so the (group_type, owner) pairing can be enforced by a foreign
    -- key into group_types rather than a hard-coded CHECK per kind.
    owner_present boolean NOT NULL GENERATED ALWAYS AS (owner IS NOT NULL) STORED,
    -- Grouper's "extension": the short name, unique within (group_type, owner).
    -- Colons are rejected because they were Grouper's path separator and their
    -- presence would mean a name that failed to parse during the import.
    name varchar(255) NOT NULL
        CHECK (name ~ '[^[:space:]]')
        CHECK (name !~ ':'),
    -- NULL means "display the name". Present so a label can diverge from the
    -- identifier later without another migration.
    display_name varchar(255),
    description text NOT NULL DEFAULT '',
    -- The full Grouper path this group was imported under, for provenance and
    -- reconciliation. NULL for groups created after the migration.
    legacy_name text,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    PRIMARY KEY (subject_id),
    FOREIGN KEY (subject_id, subject_type)
        REFERENCES subjects (id, subject_type) ON DELETE CASCADE,
    FOREIGN KEY (group_type, owner_present)
        REFERENCES group_types (name, owner_required),
    UNIQUE (legacy_name)
);

COMMENT ON TABLE groups IS
    'Groups managed by the DE, replacing Grouper. Keyed on the internal subjects.id '
    'of the group''s subject row; the external identifier is subjects.subject_id.';

COMMENT ON COLUMN groups.owner IS
    'Namespace segment (a username) frozen at creation. NOT the current owner of the '
    'group, which is the ''own'' permission in the permissions table and may be transferred.';

--
-- Structured identity. coalesce rather than NULLS NOT DISTINCT so the index works
-- on PostgreSQL before 15; owner is CHECKed non-blank, so the empty string cannot
-- collide with a real owner. Names are compared case- and whitespace-insensitively,
-- matching resource_types_name_unique in migration 000021.
--
CREATE UNIQUE INDEX IF NOT EXISTS groups_identity_unique
    ON groups (
        group_type,
        lower(coalesce(owner, '')),
        lower(trim(regexp_replace(name, '[[:space:]]+', ' ', 'g')))
    );

-- Listing a kind of group, optionally narrowed to one owner, in name order.
CREATE INDEX IF NOT EXISTS groups_type_owner_name_idx
    ON groups (group_type, owner, name);

--
-- Direct membership. A member may be a user or another group: nesting is in
-- regular use and must be preserved.
--
CREATE TABLE IF NOT EXISTS group_memberships (
    group_id uuid NOT NULL,
    member_id uuid NOT NULL,
    member_type subject_type_enum NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    -- Username of whoever added the membership. Not a foreign key: it is often a
    -- service account, which is not a permissions subject.
    added_by varchar(512),
    PRIMARY KEY (group_id, member_id),
    FOREIGN KEY (group_id) REFERENCES groups (subject_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id, member_type)
        REFERENCES subjects (id, subject_type) ON DELETE CASCADE,
    -- Direct self-membership. Longer cycles cannot be caught declaratively and
    -- are rejected by the service before insert.
    CHECK (group_id <> member_id)
);

COMMENT ON TABLE group_memberships IS
    'Direct group membership. Members may be users or groups; the transitive '
    'expansion is maintained in group_effective_members.';

-- Walking from a member to the groups containing it: the ancestor traversal that
-- decides which groups need their effective membership recomputed after a write.
CREATE INDEX IF NOT EXISTS group_memberships_member_idx
    ON group_memberships (member_id, group_id);

--
-- The transitive closure of group_memberships, restricted to users. Derived
-- state, recomputed by the groups service inside the transaction that changes
-- direct membership. It exists so that permission lookup -- the hottest query in
-- the DE -- stays a plain join instead of a recursive CTE.
--
CREATE TABLE IF NOT EXISTS group_effective_members (
    group_id uuid NOT NULL,
    member_id uuid NOT NULL,
    member_type subject_type_enum NOT NULL DEFAULT 'user'
        CHECK (member_type = 'user'),
    PRIMARY KEY (group_id, member_id),
    FOREIGN KEY (group_id) REFERENCES groups (subject_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id, member_type)
        REFERENCES subjects (id, subject_type) ON DELETE CASCADE
);

COMMENT ON TABLE group_effective_members IS
    'Derived: every user reachable from a group through any depth of nesting. '
    'Maintained on write by the groups service; reconcile by recomputing from '
    'group_memberships and diffing. Deleting a nested group cascades away the '
    'membership row without updating this table, so the service must collect the '
    'containing groups BEFORE issuing the delete and recompute them after -- once '
    'the cascade fires, the path is gone and they can no longer be found. Stale '
    'rows here grant access that direct membership no longer justifies.';

-- The permission-lookup direction: given a user, which groups contain them.
CREATE INDEX IF NOT EXISTS group_effective_members_member_idx
    ON group_effective_members (member_id, group_id);

--
-- Every group that transitively contains any of the given groups, including the
-- given groups themselves. This is the set whose closure a membership change
-- invalidates. UNION rather than UNION ALL, so a cycle terminates instead of
-- recursing forever.
--
CREATE OR REPLACE FUNCTION group_ancestors(group_ids uuid[])
RETURNS SETOF uuid AS $$
    WITH RECURSIVE up(id) AS (
        SELECT unnest(group_ids)
        UNION
        SELECT gm.group_id
          FROM group_memberships gm
          JOIN up ON gm.member_id = up.id
         WHERE gm.member_type = 'group'
    )
    SELECT id FROM up;
$$ LANGUAGE sql STABLE;

COMMENT ON FUNCTION group_ancestors(uuid[]) IS
    'The given groups plus every group transitively containing them: the set to '
    'pass to recompute_group_closure after a membership change.';

--
-- Rebuilds group_effective_members for exactly the given groups from the current
-- direct membership. Callers are responsible for passing the full affected set,
-- normally group_ancestors(changed_groups). The groups service calls this after
-- membership writes and the delete trigger below calls it after detaching, so
-- there is one implementation of the closure rather than one per caller.
--
CREATE OR REPLACE FUNCTION recompute_group_closure(group_ids uuid[])
RETURNS void AS $$
BEGIN
    DELETE FROM group_effective_members WHERE group_id = ANY(group_ids);

    INSERT INTO group_effective_members (group_id, member_id)
    WITH RECURSIVE reachable(root, member_id, member_type) AS (
        SELECT gm.group_id, gm.member_id, gm.member_type
          FROM group_memberships gm
         WHERE gm.group_id = ANY(group_ids)
        UNION
        SELECT r.root, gm.member_id, gm.member_type
          FROM reachable r
          JOIN group_memberships gm ON gm.group_id = r.member_id
         WHERE r.member_type = 'group'
    )
    SELECT DISTINCT root, member_id FROM reachable WHERE member_type = 'user';
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION recompute_group_closure(uuid[]) IS
    'Rebuilds the effective membership of the given groups from direct membership.';

--
-- Deleting a group removes it from its containers by cascade, which would leave
-- those containers still granting access to the deleted group's members. By the
-- time an AFTER trigger or the calling service could react, the cascade has
-- destroyed the path back to the containers. Detaching and recomputing here,
-- before the row is gone, is the only point where they are still findable --
-- and it covers deletes initiated by any caller, including a cascade from a
-- subjects row.
--
CREATE OR REPLACE FUNCTION groups_detach_before_delete()
RETURNS TRIGGER AS $$
DECLARE
    containers uuid[];
BEGIN
    SELECT array_agg(a) INTO containers
      FROM group_ancestors(ARRAY[OLD.subject_id]) AS a
     WHERE a <> OLD.subject_id;

    -- Detach first so the recomputation observes the graph without this group.
    DELETE FROM group_memberships WHERE member_id = OLD.subject_id;

    IF containers IS NOT NULL THEN
        PERFORM recompute_group_closure(containers);
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_groups_detach_before_delete ON groups;
CREATE TRIGGER trigger_groups_detach_before_delete
    BEFORE DELETE ON groups
    FOR EACH ROW
    EXECUTE FUNCTION groups_detach_before_delete();

-- Automatically maintain updated_at on row modification.
CREATE OR REPLACE FUNCTION update_groups_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_groups_updated_at ON groups;
CREATE TRIGGER trigger_groups_updated_at
    BEFORE UPDATE ON groups
    FOR EACH ROW
    EXECUTE FUNCTION update_groups_updated_at();

COMMIT;
