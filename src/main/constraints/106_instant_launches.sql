SET search_path = public, pg_catalog;

ALTER TABLE instant_launches
    ADD CONSTRAINT instant_launches_quick_launch_id_fkey
    FOREIGN KEY (quick_launches_id)
    REFERENCES quick_launches(id) ON DELETE CASCADE;

ALTER TABLE instant_launches
    ADD CONSTRAINT instant_launches_added_by_fkey
    FOREIGN KEY (added_by)
    REFERENCES users(id);
