BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Attaching a group to a new parent, concurrently with a membership change
-- inside that group, left the new parent permanently stale -- silently.
--
-- 000060 serializes recomputations that share a group, which fixes the case
-- where two writers rebuild the same ancestor. It cannot fix this one: the two
-- writers lock disjoint sets. One recomputes A and its ancestors, which do not
-- yet include Q; the other attaches A under Q and recomputes Q, reading A's
-- membership from a snapshot that does not yet include the new member. Both
-- commit, and nothing ever recomputes Q again.
--
-- Reproduced: A holds one member, Q is standalone. T1 adds a member to A and
-- recomputes; T2 concurrently nests A under Q and recomputes Q. Afterwards A
-- has both members and Q has only the first.
--
-- The two do share one object -- the group being attached. Locking it when a
-- nested membership is written gives them a meeting point: the attach waits for
-- an in-flight recomputation of that group, and then reads its committed
-- membership.
--
CREATE OR REPLACE FUNCTION group_memberships_lock_nested_member() RETURNS trigger
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    IF NEW.member_type = 'group' THEN
        PERFORM subject_id FROM groups WHERE subject_id = NEW.member_id FOR UPDATE;
    END IF;
    RETURN NEW;
END;
$$;

COMMENT ON FUNCTION group_memberships_lock_nested_member() IS
    'Locks a group as it is attached to a parent, so the attach serializes against any concurrent recomputation of that group. Without it the new parent misses members added concurrently, permanently and with no error.';

DROP TRIGGER IF EXISTS group_memberships_lock_nested_member ON group_memberships;
CREATE TRIGGER group_memberships_lock_nested_member
    BEFORE INSERT ON group_memberships
    FOR EACH ROW EXECUTE FUNCTION group_memberships_lock_nested_member();

COMMIT;
