BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Whether a group can be joined without approval is a third thing, distinct
-- from being public and from exposing its members.
--
-- Grouper spent three privileges on the all-users subject: `viewers` (the group
-- is discoverable), `readers` (its membership is listable), and `optins` (a user
-- may add themselves). The DE gave public communities `read` + `optin` and
-- public teams `view` alone, so Grouper refused a self-join on a public team --
-- teams use the join-request flow, where an administrator approves.
--
-- Collapsing optin into either of the others loses that: with only the public
-- marker to go on, every public team becomes directly joinable and the approval
-- workflow is bypassed. members_public looks like a usable proxy because the two
-- coincide in current data, but it records `readers` and means something else.
--
-- Defaults to false: migrating must not make a group joinable that was not.
--
ALTER TABLE groups
    ADD COLUMN IF NOT EXISTS joinable boolean NOT NULL DEFAULT false;

COMMENT ON COLUMN groups.joinable IS
    'Whether a user may add themselves to this group without approval. Grouper''s `optins` privilege for GrouperAll, as opposed to `viewers` (discoverable) or `readers` (members listable). Meaningless unless the group also carries a read grant to GrouperAll.';

COMMIT;
