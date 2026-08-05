BEGIN;

SET search_path = permissions, public, pg_catalog;

-- Restores the unlocked form from 000054, which loses concurrent membership
-- writes and can leave a concurrently-attached parent permanently stale.
CREATE OR REPLACE FUNCTION recompute_group_closure(group_ids uuid[]) RETURNS void
    LANGUAGE plpgsql
    SET search_path = permissions, public, pg_catalog
AS $$
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
$$;

COMMIT;
