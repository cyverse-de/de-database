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

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_app_id_creator_is_creator_default_unique
    UNIQUE (app_id, creator, is_creator_default);

ALTER TABLE ONLY quick_launches
    ADD CONSTRAINT quick_launches_app_id_is_global_default_unique
    UNIQUE (app_id, is_global_default);
