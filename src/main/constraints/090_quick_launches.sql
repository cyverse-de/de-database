SET search_path = public, pg_catalog;

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_creator_fkey
    FOREIGN KEY (creator)
    REFERENCES users(id);

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_submission_id_fkey
    FOREIGN KEY (submission_id)
    REFERENCES submissions(id);

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_app_id_fkey
    FOREIGN KEY (app_id)
    REFERENCES apps(id);
