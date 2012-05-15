--
-- Name: block_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY block_type
    ADD CONSTRAINT block_type_pkey
    PRIMARY KEY (id);

--
-- Name: data_format_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY data_formats
    ADD CONSTRAINT data_format_pkey
    PRIMARY KEY (id);

--
-- Name: dataelementpreservation_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY dataelementpreservation
    ADD CONSTRAINT dataelementpreservation_pkey
    PRIMARY KEY (hid);

--
-- Name: dataobject_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY dataobject_mapping
    ADD CONSTRAINT dataobject_mapping_pkey
    PRIMARY KEY (mapping_id, output);

--
-- Name: dataobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_pkey
    PRIMARY KEY (hid);

--
-- Name: deployed_component_data_files_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY deployed_component_data_files
    ADD CONSTRAINT deployed_component_data_files_pkey
    PRIMARY KEY (id);

--
-- Name: deployed_components_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY deployed_components
    ADD CONSTRAINT deployed_components_pkey
    PRIMARY KEY (hid);

--
-- Name: file_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY file_type
    ADD CONSTRAINT file_type_pkey
    PRIMARY KEY (id);

--
-- Name: folder_pkey; Type: CONSTRAINT; Schema: public; Owner: de; Tablespace:
--
ALTER TABLE ONLY folder
    ADD CONSTRAINT folder_pkey
    PRIMARY KEY (id);

--
-- Name: importedworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY importedworkflow
    ADD CONSTRAINT importedworkflow_pkey
    PRIMARY KEY (hid);

--
-- Name: info_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY info_type
    ADD CONSTRAINT info_type_pkey
    PRIMARY KEY (hid);

--
-- Name: input_output_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_pkey
    PRIMARY KEY (hid);

--
-- Name: integration_data_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY integration_data
    ADD CONSTRAINT integration_data_pkey
    PRIMARY KEY (id);

--
-- Name: multiplicity_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY multiplicity
    ADD CONSTRAINT multiplicity_pkey
    PRIMARY KEY (hid);

--
-- Name: notification_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey
    PRIMARY KEY (hid);

--
-- Name: notification_set_notification_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_pkey
    PRIMARY KEY (notification_set_id, hid);

--
-- Name: notification_set_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY notification_set
    ADD CONSTRAINT notification_set_pkey
    PRIMARY KEY (hid);

--
-- Name: notifications_receivers_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY notifications_receivers
    ADD CONSTRAINT notifications_receivers_pkey
    PRIMARY KEY (notification_id, hid);

--
-- Name: predicate_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY predicate_lookup
    ADD CONSTRAINT predicate_lookup_pkey
    PRIMARY KEY (id);

--
-- Name: property_group_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY property_group
    ADD CONSTRAINT property_group_pkey
    PRIMARY KEY (hid);

--
-- Name: property_group_property_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY property_group_property
    ADD CONSTRAINT property_group_property_pkey
    PRIMARY KEY (property_group_id, hid);

--
-- Name: property_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_pkey
    PRIMARY KEY (hid);

--
-- Name: property_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY property_type
    ADD CONSTRAINT property_type_pkey
    PRIMARY KEY (hid);

--
-- Name: provenance_device_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY provenance_device
    ADD CONSTRAINT provenance_device_pkey
    PRIMARY KEY (id);

--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey
    PRIMARY KEY (id);

--
-- Name: rule_argument_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY rule_argument
    ADD CONSTRAINT rule_argument_pkey
    PRIMARY KEY (rule_id, hid);

--
-- Name: rule_pkey; Type: CONSTRAINT; Schema: public; Owner: de; Tablespace:
--
ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_pkey
    PRIMARY KEY (hid);

--
-- Name: rule_subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY rule_subtype
    ADD CONSTRAINT rule_subtype_pkey
    PRIMARY KEY (hid);

--
-- Name: rule_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY rule_type
    ADD CONSTRAINT rule_type_pkey
    PRIMARY KEY (hid);

--
-- Name: statement_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY statement_type
    ADD CONSTRAINT statement_type_pkey
    PRIMARY KEY (id);

--
-- Name: suggested_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_pkey
    PRIMARY KEY (transformation_activity_id, template_group_id);

--
-- Name: template_group_group_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY template_group_group
    ADD CONSTRAINT template_group_group_pkey
    PRIMARY KEY (parent_group_id, hid);

--
-- Name: template_group_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY template_group
    ADD CONSTRAINT template_group_pkey
    PRIMARY KEY (hid);

--
-- Name: template_group_template_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY template_group_template
    ADD CONSTRAINT template_group_template_pkey
    PRIMARY KEY (template_group_id, template_id);

--
-- Name: template_input_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY template_input
    ADD CONSTRAINT template_input_pkey
    PRIMARY KEY (template_id, hid);

--
-- Name: template_output_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY template_output
    ADD CONSTRAINT template_output_pkey
    PRIMARY KEY (template_id, hid);

--
-- Name: template_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY template
    ADD CONSTRAINT template_pkey
    PRIMARY KEY (hid);

--
-- Name: template_property_group_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY template_property_group
    ADD CONSTRAINT template_property_group_pkey
    PRIMARY KEY (template_id, hid);

--
-- Name: thing_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY thing_type_code
    ADD CONSTRAINT thing_type_code_pkey
    PRIMARY KEY (id);

--
-- Name: transformation_activity_mappings_pkey; Type: CONSTRAINT; Schema:
-- public; Owner: de; Tablespace:
--
ALTER TABLE ONLY transformation_activity_mappings
    ADD CONSTRAINT transformation_activity_mappings_pkey
    PRIMARY KEY (transformation_activity_id, hid);

--
-- Name: transformation_activity_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY transformation_activity
    ADD CONSTRAINT transformation_activity_pkey
    PRIMARY KEY (hid);

--
-- Name: transformation_activity_references_pkey; Type: CONSTRAINT; Schema:
-- public; Owner: de; Tablespace:
--
ALTER TABLE ONLY transformation_activity_references
    ADD CONSTRAINT transformation_activity_references_pkey
    PRIMARY KEY (id);

--
-- Name: transformation_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY transformations
    ADD CONSTRAINT transformation_pkey
    PRIMARY KEY (id);

--
-- Name: transformation_step_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY transformation_steps
    ADD CONSTRAINT transformation_step_pkey
    PRIMARY KEY (id);

--
-- Name: transformation_task_steps_pkey; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY transformation_task_steps
    ADD CONSTRAINT transformation_task_steps_pkey
    PRIMARY KEY (transformation_task_id, hid);

--
-- Name: transformation_values_pkey; Type: CONSTRAINT; Schema: public; Owner:
-- de; Tablespace:
--
ALTER TABLE ONLY transformation_values
    ADD CONSTRAINT transformation_values_pkey
    PRIMARY KEY (id);

--
-- Name: transformation_values_unique; Type: CONSTRAINT; Schema: public;
-- Owner: de; Tablespace:
--
ALTER TABLE ONLY transformation_values
    ADD CONSTRAINT transformation_values_unique
    UNIQUE (transformation_id, property);

--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: de; Tablespace:
--
ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey
    PRIMARY KEY (id);

--
-- Name: validator_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY validator
    ADD CONSTRAINT validator_pkey
    PRIMARY KEY (hid);

--
-- Name: validator_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY validator_rule
    ADD CONSTRAINT validator_rule_pkey
    PRIMARY KEY (validator_id, id);

--
-- Name: value_type_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY value_type
    ADD CONSTRAINT value_type_pkey
    PRIMARY KEY (hid);

--
-- Name: votes_unique; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT votes_unique
    UNIQUE (user_id, transformation_activity_id);

--
-- Name: workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: de;
-- Tablespace:
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_pkey
    PRIMARY KEY (id);

--
-- Name: dataobject_mapping_mapping_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY dataobject_mapping
    ADD CONSTRAINT dataobject_mapping_mapping_id_fkey
    FOREIGN KEY (mapping_id)
    REFERENCES input_output_mapping(hid);

--
-- Name: dataobjects_data_format_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_data_format_fkey
    FOREIGN KEY (data_format)
    REFERENCES data_formats(id);

--
-- Name: dataobjects_info_type_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_info_type_fkey
    FOREIGN KEY (info_type)
    REFERENCES info_type(hid);

--
-- Name: dataobjects_multiplicity_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_multiplicity_fkey
    FOREIGN KEY (multiplicity)
    REFERENCES multiplicity(hid);

--
-- Name: deployed_comp_integration_data_id_fk; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY deployed_components
    ADD CONSTRAINT deployed_comp_integration_data_id_fk
    FOREIGN KEY (integration_data_id)
    REFERENCES integration_data(id);

--
-- Name: deployed_component_data_files_deployed_component_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY deployed_component_data_files
    ADD CONSTRAINT deployed_component_data_files_deployed_component_id_fkey
    FOREIGN KEY (deployed_component_id)
    REFERENCES deployed_components(hid);

--
-- Name: folder_folder_child_folder_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY folder_folder
    ADD CONSTRAINT folder_folder_child_folder_id_fkey
    FOREIGN KEY (child_folder_id)
    REFERENCES folder(id);

--
-- Name: folder_folder_parent_folder_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY folder_folder
    ADD CONSTRAINT folder_folder_parent_folder_id_fkey
    FOREIGN KEY (parent_folder_id)
    REFERENCES folder(id);

--
-- Name: input_output_mapping_source_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_source_fkey
    FOREIGN KEY (source)
    REFERENCES transformation_steps(id);

--
-- Name: input_output_mapping_target_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_target_fkey
    FOREIGN KEY (target)
    REFERENCES transformation_steps(id);

--
-- Name: notification_set_notification_notification_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_notification_id_fkey
    FOREIGN KEY (notification_id)
    REFERENCES notification(hid);

--
-- Name: notification_set_notification_notification_set_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_notification_set_id_fkey
    FOREIGN KEY (notification_set_id)
    REFERENCES notification_set(hid);

--
-- Name: notifications_receivers_notification_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY notifications_receivers
    ADD CONSTRAINT notifications_receivers_notification_id_fkey
    FOREIGN KEY (notification_id)
    REFERENCES notification(hid);

--
-- Name: property_dataobject_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_dataobject_id_fkey
    FOREIGN KEY (dataobject_id)
    REFERENCES dataobjects(hid);

--
-- Name: property_group_property_property_group_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY property_group_property
    ADD CONSTRAINT property_group_property_property_group_id_fkey
    FOREIGN KEY (property_group_id)
    REFERENCES property_group(hid);

--
-- Name: property_group_property_property_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY property_group_property
    ADD CONSTRAINT property_group_property_property_id_fkey
    FOREIGN KEY (property_id)
    REFERENCES property(hid);

--
-- Name: property_property_type_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_property_type_fkey
    FOREIGN KEY (property_type)
    REFERENCES property_type(hid);

--
-- Name: property_validator_fkey; Type: FK CONSTRAINT; Schema: public; Owner:
-- de
--
ALTER TABLE ONLY property
    ADD CONSTRAINT property_validator_fkey
    FOREIGN KEY (validator)
    REFERENCES validator(hid);

--
-- Name: ratings_transformation_activity_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_transformation_activity_id_fkey
    FOREIGN KEY (transformation_activity_id)
    REFERENCES transformation_activity(hid);

--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

--
-- Name: rule_argument_rule_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY rule_argument
    ADD CONSTRAINT rule_argument_rule_id_fkey
    FOREIGN KEY (rule_id)
    REFERENCES rule(hid);

--
-- Name: rule_rule_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_rule_type_fkey
    FOREIGN KEY (rule_type)
    REFERENCES rule_type(hid);

--
-- Name: rule_type_value_type_rule_type_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_rule_type_id_fkey
    FOREIGN KEY (rule_type_id)
    REFERENCES rule_type(hid);

--
-- Name: rule_type_value_type_value_type_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_value_type_id_fkey
    FOREIGN KEY (value_type_id)
    REFERENCES value_type(hid);

--
-- Name: suggested_groups_template_group_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_template_group_id_fkey
    FOREIGN KEY (template_group_id)
    REFERENCES template_group(hid);

--
-- Name: suggested_groups_transformation_activity_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY suggested_groups
    ADD CONSTRAINT suggested_groups_transformation_activity_id_fkey
    FOREIGN KEY (transformation_activity_id)
    REFERENCES transformation_activity(hid);

--
-- Name: template_group_group_parent_group_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY template_group_group
    ADD CONSTRAINT template_group_group_parent_group_id_fkey
    FOREIGN KEY (parent_group_id)
    REFERENCES template_group(hid);

--
-- Name: template_group_group_subgroup_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY template_group_group
    ADD CONSTRAINT template_group_group_subgroup_id_fkey
    FOREIGN KEY (subgroup_id)
    REFERENCES template_group(hid);

--
-- Name: template_group_template_template_group_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY template_group_template
    ADD CONSTRAINT template_group_template_template_group_id_fkey
    FOREIGN KEY (template_group_id)
    REFERENCES template_group(hid);

--
-- Name: template_group_template_template_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY template_group_template
    ADD CONSTRAINT template_group_template_template_id_fkey
    FOREIGN KEY (template_id)
    REFERENCES transformation_activity(hid);

--
-- Name: template_input_input_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY template_input
    ADD CONSTRAINT template_input_input_id_fkey
    FOREIGN KEY (input_id)
    REFERENCES dataobjects(hid);

--
-- Name: template_input_template_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY template_input
    ADD CONSTRAINT template_input_template_id_fkey
    FOREIGN KEY (template_id)
    REFERENCES template(hid);

--
-- Name: template_output_output_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY template_output
    ADD CONSTRAINT template_output_output_id_fkey
    FOREIGN KEY (output_id)
    REFERENCES dataobjects(hid);

--
-- Name: template_output_template_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY template_output
    ADD CONSTRAINT template_output_template_id_fkey
    FOREIGN KEY (template_id)
    REFERENCES template(hid);

--
-- Name: template_property_group_property_group_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY template_property_group
    ADD CONSTRAINT template_property_group_property_group_id_fkey
    FOREIGN KEY (property_group_id)
    REFERENCES property_group(hid);

--
-- Name: template_property_group_template_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY template_property_group
    ADD CONSTRAINT template_property_group_template_id_fkey
    FOREIGN KEY (template_id)
    REFERENCES template(hid);

--
-- Name: trans_act_integration_data_id_fk; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY transformation_activity
    ADD CONSTRAINT trans_act_integration_data_id_fk
    FOREIGN KEY (integration_data_id)
    REFERENCES integration_data(id);

--
-- Name: transformation_activity_mapping_transformation_activity_id_fkey;
-- Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY transformation_activity_mappings
    ADD CONSTRAINT transformation_activity_mapping_transformation_activity_id_fkey
    FOREIGN KEY (transformation_activity_id)
    REFERENCES transformation_activity(hid);

--
-- Name: transformation_activity_mappings_mapping_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY transformation_activity_mappings
    ADD CONSTRAINT transformation_activity_mappings_mapping_id_fkey
    FOREIGN KEY (mapping_id)
    REFERENCES input_output_mapping(hid);

--
-- Name: transformation_activity_referen_transformation_activity_id_fkey;
-- Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY
transformation_activity_references
    ADD CONSTRAINT transformation_activity_referen_transformation_activity_id_fkey
    FOREIGN KEY (transformation_activity_id)
    REFERENCES transformation_activity(hid);

--
-- Name: transformation_step_transformation_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY transformation_steps
    ADD CONSTRAINT transformation_step_transformation_id_fkey
    FOREIGN KEY (transformation_id)
    REFERENCES transformations(id);

--
-- Name: transformation_task_steps_transformation_step_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY transformation_task_steps
    ADD CONSTRAINT transformation_task_steps_transformation_step_id_fkey
    FOREIGN KEY (transformation_step_id)
    REFERENCES transformation_steps(id);

--
-- Name: transformation_task_steps_transformation_task_id_fkey; Type: FK
-- CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY transformation_task_steps
    ADD CONSTRAINT transformation_task_steps_transformation_task_id_fkey
    FOREIGN KEY (transformation_task_id)
    REFERENCES transformation_activity(hid);

--
-- Name: transformation_value_transformation_id_fkey; Type: FK CONSTRAINT;
-- Schema: public; Owner: de
--
ALTER TABLE ONLY transformation_values
    ADD CONSTRAINT transformation_value_transformation_id_fkey
    FOREIGN KEY (transformation_id)
    REFERENCES transformations(id);

--
-- Name: validator_rule_rule_id_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY validator_rule
    ADD CONSTRAINT validator_rule_rule_id_fkey
    FOREIGN KEY (rule_id)
    REFERENCES rule(hid);

--
-- Name: validator_rule_validator_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY validator_rule
    ADD CONSTRAINT validator_rule_validator_id_fkey
    FOREIGN KEY (validator_id)
    REFERENCES validator(hid);

--
-- Name: workspace_home_folder_fkey; Type: FK CONSTRAINT; Schema: public;
-- Owner: de
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_home_folder_fkey
    FOREIGN KEY (home_folder)
    REFERENCES folder(id);

--
-- Name: workspace_root_analysis_group_id_fkey; Type: FK CONSTRAINT; Schema:
-- public; Owner: de
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_root_analysis_group_id_fkey
    FOREIGN KEY (root_analysis_group_id)
    REFERENCES template_group(hid);

--
-- Name: workspace_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: de
--
ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_users_fk
    FOREIGN KEY (user_id)
    REFERENCES users(id);
