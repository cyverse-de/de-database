--
-- Name: tasks_tool_id_fk; Type: CONSTRAINT; Schema: public; Owner: de;
--
ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_tool_id_fk
    FOREIGN KEY (tool_id)
    REFERENCES tools(id);

--
-- Foreign key constraint for the job_type_id field of the tasks table.
--
ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_job_type_id_fk
    FOREIGN KEY (job_type_id)
    REFERENCES job_types(id);
