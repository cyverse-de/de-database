--
-- Name: jobs_app_id_start_date; Type: INDEX; Schema: public; Owner: de;
--
CREATE INDEX IF NOT EXISTS jobs_app_id_start_date
ON jobs(app_id, start_date);
