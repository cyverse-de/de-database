BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Drops all group data. Grouper remains the recoverable source of truth until it
-- is decommissioned, which is why the Grouper import is a separate command
-- rather than a migration.
--

DROP TRIGGER IF EXISTS trigger_groups_updated_at ON groups;
DROP FUNCTION IF EXISTS update_groups_updated_at();

DROP TRIGGER IF EXISTS trigger_groups_detach_before_delete ON groups;
DROP FUNCTION IF EXISTS groups_detach_before_delete();
DROP FUNCTION IF EXISTS recompute_group_closure(uuid[]);
DROP FUNCTION IF EXISTS group_ancestors(uuid[]);

DROP INDEX IF EXISTS group_effective_members_member_idx;
DROP TABLE IF EXISTS group_effective_members;

DROP INDEX IF EXISTS group_memberships_member_idx;
DROP TABLE IF EXISTS group_memberships;

DROP INDEX IF EXISTS groups_type_owner_name_idx;
DROP INDEX IF EXISTS groups_identity_unique;
DROP TABLE IF EXISTS groups;

DROP TABLE IF EXISTS group_types;

DROP INDEX IF EXISTS subjects_user_id_unique;
ALTER TABLE subjects DROP CONSTRAINT IF EXISTS subjects_user_id_is_user;
ALTER TABLE subjects DROP CONSTRAINT IF EXISTS subjects_user_id_fkey;
ALTER TABLE subjects DROP COLUMN IF EXISTS user_id;

ALTER TABLE subjects DROP CONSTRAINT IF EXISTS subjects_id_subject_type_key;
ALTER TABLE subjects ALTER COLUMN subject_id DROP DEFAULT;

--
-- Restores the original width. This fails rather than truncates if any subject
-- identifier longer than 64 characters was created while the column was wide --
-- silently discarding part of an identity is worse than refusing to roll back.
--
ALTER TABLE subjects ALTER COLUMN subject_id TYPE varchar(64);

COMMIT;
