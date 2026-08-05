BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Grouper distinguished two kinds of public group, and collapsing them exposes
-- membership that used to be private.
--
-- A public group is marked by a read grant held by the GrouperAll subject. In
-- Grouper that grant arrived as one of two privileges: `viewers`, meaning the
-- group is discoverable and joinable but its member list is not public, or
-- `readers`, meaning the members are public too. Production applies `viewers`
-- to public teams and `readers` to public communities.
--
-- The permissions service has no level weaker than `read`, so both import as
-- the same grant and the distinction is lost -- which silently makes every
-- public team's membership world-readable. It is recorded here instead, as a
-- property of the group rather than a grant to a subject, because GrouperAll is
-- a sentinel with no members rather than a real subject.
--
-- Defaults to false: a group whose members were not already public must not
-- become public by being migrated.
--
ALTER TABLE groups
    ADD COLUMN IF NOT EXISTS members_public boolean NOT NULL DEFAULT false;

COMMENT ON COLUMN groups.members_public IS
    'Whether a public group''s member list is public too. Grouper''s `readers` privilege for GrouperAll, as opposed to `viewers`. Meaningless unless the group carries a read grant to GrouperAll.';

COMMIT;
