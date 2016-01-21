SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the updater_id field of the permanent_id_request_statuses table.
--
ALTER TABLE ONLY permanent_id_request_statuses
ADD CONSTRAINT permanent_id_request_statuses_updater_id_fkey
FOREIGN KEY (updater_id)
REFERENCES users(id);

--
-- Foreign key constraint for the permanent_id_request field of the permanent_id_request_statuses table.
--
ALTER TABLE ONLY permanent_id_request_statuses
ADD CONSTRAINT permanent_id_request_statuses_request_fkey
FOREIGN KEY (permanent_id_request)
REFERENCES permanent_id_requests(id);

--
-- Foreign key constraint for the permanent_id_request_status_code field of the permanent_id_request_statuses table.
--
ALTER TABLE ONLY permanent_id_request_statuses
ADD CONSTRAINT permanent_id_request_statuses_status_code_fkey
FOREIGN KEY (permanent_id_request_status_code)
REFERENCES permanent_id_request_status_codes(id);
