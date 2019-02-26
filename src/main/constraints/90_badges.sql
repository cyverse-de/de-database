SET search_path = public, pg_catalog;

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_submission_id_fkey
    FOREIGN KEY (submission_id)
    REFERENCES submissions(id);
