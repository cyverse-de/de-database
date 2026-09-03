BEGIN;

SET search_path = permissions, public, pg_catalog;

--
-- Concurrent membership writes corrupted the closure, in two ways.
--
-- recompute_group_closure deletes a group's effective members and reinserts
-- them. Under READ COMMITTED the DELETE blocks on a concurrent writer's locks
-- and then re-evaluates, finding the rows gone, while the following INSERT
-- takes a fresh snapshot that sees the other transaction's committed work. Two
-- transactions recomputing a shared ancestor -- a community holding several
-- nested groups is an ancestor of each of them -- collide on
-- group_effective_members_pkey and one write is lost to a rollback.
--
-- The second is worse because it is silent: group_ancestors is computed from
-- the writer's snapshot, so a parent being attached concurrently is invisible
-- and never recomputed. Both transactions commit and the new member is
-- permanently missing from the new parent's effective membership, so every
-- permission granted to that parent silently fails to reach them.
--
-- Locking the groups whose closure is being rebuilt, in a deterministic order,
-- serializes the recomputations that overlap and leaves disjoint ones
-- concurrent. Ordering by id keeps two recomputations from deadlocking when
-- their ancestor sets intersect in opposite orders. It does not rule deadlock
-- out entirely: the membership triggers and the tuple lock of a group DELETE
-- acquire groups rows outside this ordering, so concurrent bulk writes can
-- still abort with 40P01 -- an availability cost, not a correctness one, and
-- the caller's remedy is to retry the transaction.
--
CREATE OR REPLACE FUNCTION recompute_group_closure(group_ids uuid[]) RETURNS void
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
BEGIN
    PERFORM subject_id
       FROM groups
      WHERE subject_id = ANY(group_ids)
      ORDER BY subject_id
        FOR UPDATE;

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
$$;

COMMENT ON FUNCTION recompute_group_closure(uuid[]) IS
    'Rebuilds the effective membership of the given groups. Locks them in id order first: concurrent recomputations of a shared ancestor otherwise collide on the primary key, and a concurrently-attached parent is never recomputed at all.';

COMMIT;
