SET search_path = public, pg_catalog;

--
-- Updates columns in the existing ratings table.
--
ALTER TABLE ONLY ratings RENAME COLUMN id TO id_v187;
ALTER TABLE ONLY ratings RENAME COLUMN user_id TO user_id_v187;
ALTER TABLE ONLY ratings RENAME COLUMN transformation_activity_id TO transformation_activity_id_v187;
ALTER TABLE ONLY ratings RENAME COLUMN comment_id TO comment_id_v187;
ALTER TABLE ONLY ratings ADD COLUMN id UUID DEFAULT (uuid_generate_v1());
ALTER TABLE ONLY ratings ADD COLUMN user_id UUID;
ALTER TABLE ONLY ratings ADD COLUMN app_id UUID;
ALTER TABLE ONLY ratings ADD COLUMN comment_id UUID;

