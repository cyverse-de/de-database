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
-- from here on must be indistinguishable from them, so a group subject inserted
-- without an identifier is given the same dashless form rather than a canonical
-- uuid. A user subject's identifier is its username and is never minted: left
-- NULL, it fails the NOT NULL constraint instead of silently becoming an orphan
-- no username will ever match.
--
CREATE OR REPLACE FUNCTION subjects_default_group_subject_id()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.subject_id IS NULL AND NEW.subject_type = 'group' THEN
        NEW.subject_id := replace(uuid_generate_v1()::text, '-', '');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_subjects_default_group_subject_id ON subjects;
CREATE TRIGGER trigger_subjects_default_group_subject_id
    BEFORE INSERT ON subjects
    FOR EACH ROW
    EXECUTE FUNCTION subjects_default_group_subject_id();

--
-- Correlates a user subject with its DE user row. subject_id is a bare username
-- while public.users.username carries a domain suffix, so a join between the two
-- otherwise has to reconstruct the suffixed form every time.
--
-- Nullable and best-effort by design: a subject can be created before the user
-- has ever logged in to the DE, and 5 of the 19,728 production user subjects
-- correspond to no DE user at all. A NULL means "not correlated", never "no such
-- user", and consumers must not treat it as the latter.
--
-- ON DELETE SET NULL rather than CASCADE: removing a DE user must not remove the
-- subject, because that would cascade away their group memberships and every
-- permission ever granted to them.
--
-- Deliberately not backfilled here. Matching requires the username suffix, which
-- is deployment-specific, so population belongs to the services and the Grouper
-- importer, which have it configured.
--
ALTER TABLE subjects ADD COLUMN IF NOT EXISTS user_id uuid;

-- Constraint names are unique only per table, so the guards name the table too.
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'subjects_user_id_fkey'
           AND conrelid = 'permissions.subjects'::regclass
    ) THEN
        ALTER TABLE subjects
            ADD CONSTRAINT subjects_user_id_fkey FOREIGN KEY (user_id)
                REFERENCES public.users (id) ON DELETE SET NULL;
    END IF;

    -- Only a user subject can name a DE user; a group never does.
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'subjects_user_id_is_user'
           AND conrelid = 'permissions.subjects'::regclass
    ) THEN
        ALTER TABLE subjects
            ADD CONSTRAINT subjects_user_id_is_user
                CHECK (user_id IS NULL OR subject_type = 'user');
    END IF;
END$$;

COMMENT ON COLUMN subjects.user_id IS
    'The public.users row this subject corresponds to, or NULL when it has not been '
    'correlated -- which is not the same as the user not existing.';

-- At most one subject may claim a given DE user. The partial index leaves the
-- uncorrelated rows out entirely rather than relying on NULL distinctness.
CREATE UNIQUE INDEX IF NOT EXISTS subjects_user_id_unique
    ON subjects (user_id) WHERE user_id IS NOT NULL;

--
-- Redundant with the primary key for uniqueness, but required as the target of
-- the composite foreign keys below, which pin the subject type of a referencing
-- row (a group's backing subject must be a group; an effective member must be a
-- user).
--
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint
         WHERE conname = 'subjects_id_subject_type_key'
           AND conrelid = 'permissions.subjects'::regclass
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
-- A public group is marked by a read grant held by the GrouperAll subject.
-- Grouper granted that subject up to three separate privileges -- viewers (the
-- group is discoverable), readers (its member list is public) and optins (a user
-- may add themselves) -- and the permissions service has no level weaker than
-- read, so all three arrive as the same grant. members_public and joinable keep
-- the two finer distinctions, as properties of the group rather than grants,
-- because GrouperAll is a sentinel with no members rather than a real subject.
-- Both default to false: migrating a group must not widen what it exposed.
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
    members_public boolean NOT NULL DEFAULT false,
    joinable boolean NOT NULL DEFAULT false,
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

COMMENT ON COLUMN groups.members_public IS
    'Whether a public group''s member list is public too. Grouper''s `readers` privilege '
    'for GrouperAll, as opposed to `viewers`. Meaningless unless the group carries a read '
    'grant to GrouperAll.';

COMMENT ON COLUMN groups.joinable IS
    'Whether a user may add themselves to this group without approval. Grouper''s `optins` '
    'privilege for GrouperAll, as opposed to `viewers` (discoverable) or `readers` (members '
    'listable). Meaningless unless the group also carries a read grant to GrouperAll.';

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
    'Maintained by the groups service: after changing a group''s direct membership '
    'it must call recompute_group_closure(group_ancestors(ARRAY[group_id])) in the '
    'same transaction, keyed on the group written to and not on the member -- '
    'once a nested group is detached, its own ancestors no longer include the '
    'former parent. Group deletion is handled by the trigger on groups, which '
    'detaches and recomputes the containers itself. Reconcile by recomputing from '
    'group_memberships and diffing; stale rows here grant access that direct '
    'membership no longer justifies.';

-- The permission-lookup direction: given a user, which groups contain them.
CREATE INDEX IF NOT EXISTS group_effective_members_member_idx
    ON group_effective_members (member_id, group_id);

--
-- Every write to the group graph serializes on one transaction-scoped advisory
-- lock. A closure recomputation reads the whole subtree below the groups it
-- rebuilds, so it must not overlap an attach or detach anywhere in that subtree;
-- row locks on the rebuilt groups alone cannot express that, and a change one
-- level further down would leave a concurrently attached ancestor permanently
-- stale, with no error. Group-graph writes are rare next to the permission reads
-- that consume the closure, so serializing all of them costs little.
--
-- The lock is taken by statement-level BEFORE triggers so that it precedes every
-- tuple lock a write takes: a DELETE locks its rows before any row-level trigger
-- runs, and a row-level trigger taking the advisory lock afterwards would order
-- the two locks oppositely to a recomputation, which holds the advisory lock and
-- then locks group and subject rows through its foreign keys. Deleting a subject
-- cascades into the graph, so subject deletion takes the lock as well.
--
-- A transaction that locks a groups or subjects row some other way -- a SELECT
-- FOR UPDATE, say -- before its first group-graph write can still deadlock
-- against a concurrent delete of that row. Calling lock_group_graph() first
-- prevents it; otherwise the remedy is to retry on SQLSTATE 40P01.
--
CREATE OR REPLACE FUNCTION lock_group_graph()
RETURNS void AS $$
    SELECT pg_advisory_xact_lock(hashtext('permissions.group_graph'));
$$ LANGUAGE sql;

COMMENT ON FUNCTION lock_group_graph() IS
    'Takes the transaction-scoped advisory lock that serializes every write to the '
    'group graph. Taken automatically by the first write to groups or '
    'group_memberships or delete from subjects; call it explicitly to take it earlier.';

CREATE OR REPLACE FUNCTION group_graph_lock_before_statement()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM lock_group_graph();
    RETURN NULL;
END;
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_subjects_lock_group_graph ON subjects;
CREATE TRIGGER trigger_subjects_lock_group_graph
    BEFORE DELETE ON subjects
    FOR EACH STATEMENT
    EXECUTE FUNCTION group_graph_lock_before_statement();

DROP TRIGGER IF EXISTS trigger_groups_lock_group_graph ON groups;
CREATE TRIGGER trigger_groups_lock_group_graph
    BEFORE INSERT OR UPDATE OR DELETE ON groups
    FOR EACH STATEMENT
    EXECUTE FUNCTION group_graph_lock_before_statement();

DROP TRIGGER IF EXISTS trigger_group_memberships_lock_group_graph ON group_memberships;
CREATE TRIGGER trigger_group_memberships_lock_group_graph
    BEFORE INSERT OR UPDATE OR DELETE ON group_memberships
    FOR EACH STATEMENT
    EXECUTE FUNCTION group_graph_lock_before_statement();

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
$$ LANGUAGE sql STABLE
-- Pinned so the function resolves the group tables no matter what the calling
-- session's search_path is. Without this, deleting a group from any client that
-- does not put this schema on its path fails inside the delete trigger.
SET search_path = permissions, public, pg_catalog;

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
    PERFORM lock_group_graph();

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
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

COMMENT ON FUNCTION recompute_group_closure(uuid[]) IS
    'Rebuilds the effective membership of the given groups from direct membership, '
    'under the group-graph lock. Pass group_ancestors(ARRAY[group_id]) for the group '
    'whose direct membership changed.';

--
-- The foreign key on (member_id, member_type) guarantees a group-typed member has
-- a group subject, but not that it has a groups row. Reachable only by direct
-- SQL, but a membership pointing at a subject with no group would leave closure
-- rows nothing can recompute, so it is refused rather than silently orphaned.
--
CREATE OR REPLACE FUNCTION group_memberships_check_member_group()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.member_type = 'group'
       AND NOT EXISTS (SELECT 1 FROM groups WHERE subject_id = NEW.member_id) THEN
        RAISE EXCEPTION 'group-typed member % has no groups row; the member group does not exist or was deleted concurrently', NEW.member_id
            USING ERRCODE = 'foreign_key_violation';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_group_memberships_check_member_group ON group_memberships;
CREATE TRIGGER trigger_group_memberships_check_member_group
    BEFORE INSERT OR UPDATE ON group_memberships
    FOR EACH ROW
    EXECUTE FUNCTION group_memberships_check_member_group();

--
-- Deleting a group removes it from its containers by cascade, which would leave
-- those containers still granting access to the deleted group's members. By the
-- time an AFTER trigger or the calling service could react, the cascade has
-- destroyed the path back to the containers. Detaching and recomputing here,
-- before the row is gone, is the only point where they are still findable --
-- and it covers deletes initiated by any caller, including a cascade from a
-- subjects row.
--
-- A container that is itself being deleted by the same statement is skipped: it
-- may already be gone by the time this row is reached, and rebuilding its
-- closure would insert rows for a group no longer in groups.
--
CREATE OR REPLACE FUNCTION groups_detach_before_delete()
RETURNS TRIGGER AS $$
DECLARE
    containers uuid[];
BEGIN
    SELECT array_agg(a) INTO containers
      FROM group_ancestors(ARRAY[OLD.subject_id]) AS a
     WHERE a <> OLD.subject_id
       AND EXISTS (SELECT 1 FROM groups g WHERE g.subject_id = a);

    -- Detach first so the recomputation observes the graph without this group.
    DELETE FROM group_memberships WHERE member_id = OLD.subject_id;

    IF containers IS NOT NULL THEN
        PERFORM recompute_group_closure(containers);
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

COMMENT ON FUNCTION groups_detach_before_delete() IS
    'Detaches a group from its containers and recomputes them before the row is '
    'deleted, while the containers can still be found.';

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
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_groups_updated_at ON groups;
CREATE TRIGGER trigger_groups_updated_at
    BEFORE UPDATE ON groups
    FOR EACH ROW
    EXECUTE FUNCTION update_groups_updated_at();

--
-- Which system owns group data. The Grouper importer reconciles -- it removes
-- memberships and grants that Grouper no longer has -- which is correct only
-- while Grouper is still authoritative. Run it once after cutover and it would
-- delete whatever was created natively in the meantime.
--
-- The importer refuses to start unless this says 'grouper'. There is deliberately
-- no override flag: the only way to run a destructive reconcile after cutover is
-- to set this back, which is a deliberate write with attribution and a timestamp
-- rather than something typed at the end of an argument list. Flipping it to
-- 'native' is an ordered step of the cutover, performed before anything is
-- pointed at the new store.
--
CREATE TABLE IF NOT EXISTS group_data_source (
    -- Single row: the only permitted key is true, and the primary key makes it
    -- unique, so a second row cannot be inserted.
    id boolean NOT NULL DEFAULT true CHECK (id),
    source varchar(16) NOT NULL CHECK (source IN ('grouper', 'native')),
    changed_at timestamp with time zone NOT NULL DEFAULT now(),
    -- Who performed the change. Free text: this is usually an operator, not a
    -- subject or a DE user.
    changed_by varchar(512) NOT NULL CHECK (changed_by ~ '[^[:space:]]'),
    note text,
    PRIMARY KEY (id)
);

COMMENT ON TABLE group_data_source IS
    'Single row recording whether Grouper or this database is authoritative for group '
    'data. The Grouper importer refuses to run a destructive reconcile unless it says '
    'grouper; set it to native as part of cutover.';

INSERT INTO group_data_source (source, changed_by, note)
     VALUES ('grouper', 'migration 000057',
             'Grouper remains authoritative until cutover.')
ON CONFLICT DO NOTHING;

--
-- Keeps changed_at honest: the timestamp matters precisely because someone will
-- want to know when the cutover happened, and an operator flipping source by
-- hand would not think to set it.
--
CREATE OR REPLACE FUNCTION update_group_data_source_changed_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.changed_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql
SET search_path = permissions, public, pg_catalog;

DROP TRIGGER IF EXISTS trigger_group_data_source_changed_at ON group_data_source;
CREATE TRIGGER trigger_group_data_source_changed_at
    BEFORE UPDATE ON group_data_source
    FOR EACH ROW
    EXECUTE FUNCTION update_group_data_source_changed_at();

COMMIT;
