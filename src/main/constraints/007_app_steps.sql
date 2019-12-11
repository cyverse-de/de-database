--
-- Name: app_steps_app_id; Type: INDEX; Schema: public; Owner: de;
--
CREATE INDEX app_steps_app_id ON app_steps (app_id);

--
-- Name: app_steps_task_id; Type: INDEX; Schema: public; Owner: de;
--
CREATE INDEX app_steps_task_id ON app_steps (task_id);
