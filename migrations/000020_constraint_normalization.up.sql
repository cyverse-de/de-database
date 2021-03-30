BEGIN;

SET search_path = public, pg_catalog;

-- Primary keys and UNIQUE

ALTER TABLE ONLY apps_htcondor_extra
    DROP CONSTRAINT IF EXISTS apps_htcondor_extra_pkey,
    DROP CONSTRAINT IF EXISTS apps_htcondor_extra_apps_id_pkey,
    ADD PRIMARY KEY (apps_id);

ALTER TABLE ONLY authorization_requests
    DROP CONSTRAINT IF EXISTS authorization_requests_user_id_key;

ALTER TABLE ONLY default_bags
    DROP CONSTRAINT IF EXISTS default_bags_bag_id_fkey;
ALTER TABLE ONLY bags
    DROP CONSTRAINT IF EXISTS bags_id_key; -- duplicated by bags_pkey
ALTER TABLE ONLY default_bags
    ADD FOREIGN KEY (bag_id) REFERENCES bags(id) ON DELETE CASCADE;

ALTER TABLE ONLY container_devices
    DROP CONSTRAINT IF EXISTS container_devices_id_key; -- duplicated by container_devices_pkey

ALTER TABLE ONLY data_containers
    DROP CONSTRAINT IF EXISTS data_containers_container_images_id_fkey,
    DROP CONSTRAINT IF EXISTS data_containers_container_images_fkey;
ALTER TABLE ONLY tools
    DROP CONSTRAINT IF EXISTS tools_container_images_id_fkey,
    DROP CONSTRAINT IF EXISTS tools_container_image_fkey; -- both recreated below
ALTER TABLE ONLY container_images
    DROP CONSTRAINT IF EXISTS container_images_id_key; -- duplicated by container_images_pkey
ALTER TABLE ONLY data_containers
    ADD FOREIGN KEY (container_images_id) REFERENCES container_images(id);

ALTER TABLE ONLY container_ports
    DROP CONSTRAINT IF EXISTS container_ports_pkey,
    DROP CONSTRAINT IF EXISTS container_ports_id_pkey,
    ADD PRIMARY KEY (id),
    DROP CONSTRAINT IF EXISTS container_ports_id_key; -- duplicated by container_ports_pkey

ALTER TABLE ONLY container_devices
    DROP CONSTRAINT IF EXISTS container_devices_container_settings_id_fkey;
ALTER TABLE ONLY container_ports
    DROP CONSTRAINT IF EXISTS container_ports_container_settings_id_fkey;
ALTER TABLE ONLY container_volumes
    DROP CONSTRAINT IF EXISTS container_volumes_container_settings_id_fkey;
ALTER TABLE ONLY container_volumes_from
    DROP CONSTRAINT IF EXISTS container_volumes_from_container_settings_id_fkey;
ALTER TABLE ONLY container_settings
    DROP CONSTRAINT IF EXISTS container_settings_id_key; -- duplicated by container_settings_pkey
ALTER TABLE ONLY container_devices
    ADD FOREIGN KEY (container_settings_id) REFERENCES container_settings(id) ON DELETE CASCADE;
ALTER TABLE ONLY container_ports
    ADD FOREIGN KEY (container_settings_id) REFERENCES container_settings(id) ON DELETE CASCADE;
ALTER TABLE ONLY container_volumes
    ADD FOREIGN KEY (container_settings_id) REFERENCES container_settings(id) ON DELETE CASCADE;
ALTER TABLE ONLY container_volumes_from
    ADD FOREIGN KEY (container_settings_id) REFERENCES container_settings(id) ON DELETE CASCADE;

ALTER TABLE ONLY container_volumes_from
    DROP CONSTRAINT IF EXISTS container_volumes_from_id_key; -- duplicated by container_volumes_from_pkey

ALTER TABLE ONLY container_volumes
    DROP CONSTRAINT IF EXISTS container_volumes_id_key; -- duplicated by container_volumes_pkey

ALTER TABLE ONLY container_volumes_from
    DROP CONSTRAINT IF EXISTS container_volumes_from_data_containers_id_fkey;
ALTER TABLE ONLY data_containers
    DROP CONSTRAINT IF EXISTS data_containers_id_key, -- duplicated by data_containers_pkey
    DROP CONSTRAINT IF EXISTS data_containers_container_images_id_name_prefix_read_only_key,
    DROP CONSTRAINT IF EXISTS data_containers_unique,
    ADD UNIQUE (container_images_id, name_prefix, read_only);
ALTER TABLE ONLY container_volumes_from
    ADD FOREIGN KEY (data_containers_id) REFERENCES data_containers(id) ON DELETE CASCADE;

ALTER TABLE ONLY data_source
    DROP CONSTRAINT IF EXISTS data_source_name_key,
    DROP CONSTRAINT IF EXISTS data_source_unique_name,
    ADD UNIQUE (name);

ALTER TABLE ONLY default_instant_launches
    DROP CONSTRAINT IF EXISTS default_instant_launches_id_key, -- duplicated by primary key
    DROP CONSTRAINT IF EXISTS default_instant_launches_pky,
    DROP CONSTRAINT IF EXISTS default_instant_launches_pkey,
    ADD PRIMARY KEY (id),
    DROP CONSTRAINT IF EXISTS default_instant_launches_version_key,
    DROP CONSTRAINT IF EXISTS default_instant_launches_version_unique,
    ADD UNIQUE (version);

ALTER TABLE ONLY genome_reference
    DROP CONSTRAINT IF EXISTS genome_reference_name_key,
    DROP CONSTRAINT IF EXISTS genome_ref_name_unique,
    ADD UNIQUE (name),
    DROP CONSTRAINT IF EXISTS genome_reference_path_key,
    DROP CONSTRAINT IF EXISTS genome_ref_path_unique,
    ADD UNIQUE (path);

ALTER TABLE ONLY instant_launches
    DROP CONSTRAINT IF EXISTS instant_launches_id_key; -- duplicated by instant_launches_pkey

ALTER TABLE ONLY integration_data
    DROP CONSTRAINT IF EXISTS integration_data_integrator_name_integrator_email_key,
    DROP CONSTRAINT IF EXISTS integration_data_name_email_unique,
    ADD UNIQUE (integrator_name, integrator_email);

ALTER TABLE ONLY container_settings
    DROP CONSTRAINT IF EXISTS container_settings_interactive_apps_proxy_settings_id_fkey;
ALTER TABLE ONLY interactive_apps_proxy_settings
    DROP CONSTRAINT IF EXISTS interactive_apps_proxy_settings_id_pkey,
    DROP CONSTRAINT IF EXISTS interactive_apps_proxy_settings_pkey,
    ADD PRIMARY KEY (id),
    DROP CONSTRAINT IF EXISTS interactive_apps_proxy_settings_id_key; -- duplicated by primary key
ALTER TABLE ONLY container_settings
    ADD FOREIGN KEY (interactive_apps_proxy_settings_id) REFERENCES interactive_apps_proxy_settings(id) ON DELETE CASCADE;

ALTER TABLE ONLY job_limits
    DROP CONSTRAINT IF EXISTS job_limits_launcher_key,
    DROP CONSTRAINT IF EXISTS job_limits_launcher_unique,
    ADD UNIQUE (launcher);

-- There was a duplicate entry in the production data set that was preventing the unique indices from
-- being created. The two rows were identical except for the primary key.
DELETE FROM notif_statuses a USING notif_statuses b
    WHERE b.id > a.id
    AND b.analysis_id = a.analysis_id;

ALTER TABLE ONLY notif_statuses
    DROP CONSTRAINT IF EXISTS notif_statuses_analysis_id_key,
    DROP CONSTRAINT IF EXISTS notif_statuses_external_id_key,
    ADD UNIQUE (analysis_id),
    ADD UNIQUE (external_id);

ALTER TABLE ONLY quick_launch_favorites
    DROP CONSTRAINT IF EXISTS quick_launch_favorites_pkey,
    DROP CONSTRAINT IF EXISTS quick_launch_favorites_id_pkey,
    ADD PRIMARY KEY (id),
    DROP CONSTRAINT IF EXISTS quick_launch_favorites_user_id_quick_launch_id_key,
    DROP CONSTRAINT IF EXISTS quick_launch_favorites_user_id_quick_launches_id_unique,
    ADD UNIQUE (user_id, quick_launch_id);

ALTER TABLE ONLY quick_launch_global_defaults
    DROP CONSTRAINT IF EXISTS quick_launch_global_defaults_app_id_key,
    DROP CONSTRAINT IF EXISTS quick_launch_global_defaults_app_id_unique,
    ADD UNIQUE (app_id),
    DROP CONSTRAINT IF EXISTS quick_launch_global_defaults_pkey,
    DROP CONSTRAINT IF EXISTS quick_launch_global_defaults_id_pkey,
    ADD PRIMARY KEY (id),
    DROP CONSTRAINT IF EXISTS quick_launch_global_defaults_quick_launch_id_key,
    DROP CONSTRAINT IF EXISTS quick_launch_global_defaults_quick_launch_id_unique,
    ADD UNIQUE (quick_launch_id);

ALTER TABLE ONLY quick_launch_user_defaults
    DROP CONSTRAINT IF EXISTS quick_launch_user_defaults_user_id_app_id_key,
    DROP CONSTRAINT IF EXISTS quick_launch_user_defaults_user_id_app_id_unique,
    ADD UNIQUE (user_id, app_id),
    DROP CONSTRAINT IF EXISTS quick_launch_user_defaults_pkey,
    DROP CONSTRAINT IF EXISTS quick_launch_user_defaults_id_pkey,
    ADD PRIMARY KEY (id),
    DROP CONSTRAINT IF EXISTS quick_launch_user_defaults_user_id_quick_launch_id_key,
    DROP CONSTRAINT IF EXISTS quick_launch_user_defaults_user_id_quick_launch_id_unique,
    ADD UNIQUE (user_id, quick_launch_id);

ALTER TABLE ONLY ratings
    DROP CONSTRAINT IF EXISTS ratings_user_id_app_id_key,
    DROP CONSTRAINT IF EXISTS votes_unique,
    ADD UNIQUE (user_id, app_id);

ALTER TABLE ONLY request_status_codes
    DROP CONSTRAINT IF EXISTS request_status_codes_display_name_key,
    DROP CONSTRAINT IF EXISTS request_status_codes_display_name_unique,
    ADD UNIQUE (display_name),
    DROP CONSTRAINT IF EXISTS request_status_codes_name_key,
    DROP CONSTRAINT IF EXISTS request_status_codes_name_unique,
    ADD UNIQUE (name);

ALTER TABLE ONLY request_types
    DROP CONSTRAINT IF EXISTS request_types_name_key,
    DROP CONSTRAINT IF EXISTS request_types_name_unique,
    ADD UNIQUE (name);


ALTER TABLE ONLY tool_types
    DROP CONSTRAINT IF EXISTS tool_types_name_key,
    ADD UNIQUE (name);

ALTER TABLE ONLY tools
    DROP CONSTRAINT IF EXISTS tools_name_version_key,
    DROP CONSTRAINT IF EXISTS tools_unique,
    ADD UNIQUE (name, version);

ALTER TABLE ONLY tree_urls
    DROP CONSTRAINT IF EXISTS tree_urls_sha1_key; -- meh

ALTER TABLE ONLY user_instant_launches
    DROP CONSTRAINT IF EXISTS user_instant_launches_id_key, -- duplicated by primary key
    DROP CONSTRAINT IF EXISTS user_instant_launches_user_id_version_key,
    DROP CONSTRAINT IF EXISTS user_instant_launches_user_id_version_unique,
    ADD UNIQUE (user_id, version);

ALTER TABLE ONLY users
    DROP CONSTRAINT IF EXISTS users_username_key,
    DROP CONSTRAINT IF EXISTS username_unique,
    ADD UNIQUE (username);

ALTER TABLE ONLY validation_rule_argument_definitions
    DROP CONSTRAINT IF EXISTS validation_rule_argument_definitions_pkey,
    DROP CONSTRAINT IF EXISTS validation_rule_argument_definitions_id_pkey,
    ADD PRIMARY KEY (id);


ALTER TABLE ONLY webhooks_subscription
    DROP CONSTRAINT IF EXISTS webhooks_subscription_webhook_id_topic_id_key,
    DROP CONSTRAINT IF EXISTS webhooks_subscription_ukey,
    ADD UNIQUE (webhook_id, topic_id);

ALTER TABLE ONLY webhooks_type
    DROP CONSTRAINT IF EXISTS webhooks_type_type_key,
    DROP CONSTRAINT IF EXISTS webhooks_type_ukey,
    ADD UNIQUE (type);

ALTER TABLE ONLY webhooks
    DROP CONSTRAINT IF EXISTS webhooks_user_id_url_key,
    DROP CONSTRAINT IF EXISTS webhooks_ukey,
    ADD UNIQUE (user_id, url);

ALTER TABLE ONLY workflow_io_maps
    DROP CONSTRAINT IF EXISTS workflow_io_maps_app_id_target_step_source_step_key,
    DROP CONSTRAINT IF EXISTS workflow_io_maps_unique,
    ADD UNIQUE (app_id, target_step, source_step);

-- depended-on primary keys
-- we have to do this the annoying way because stuff depends on these primary keys
DO $$
BEGIN
    ALTER TABLE ONLY quick_launches
        RENAME CONSTRAINT quick_launches_id_pkey TO quick_launches_pkey;
EXCEPTION
    WHEN undefined_object THEN
        RAISE NOTICE 'quick_launches_id_pkey does not exist, continuing';
END$$;

DO $$
BEGIN
    ALTER TABLE ONLY submissions
        RENAME CONSTRAINT submissions_id_pkey TO submissions_pkey;
EXCEPTION
    WHEN undefined_object THEN
        RAISE NOTICE 'submissions_id_pkey does not exist, continuing';
END$$;

DO $$
BEGIN
    ALTER TABLE ONLY validation_rule_argument_types
        RENAME CONSTRAINT validation_rule_argument_types_id_pkey TO validation_rule_argument_types_pkey;
EXCEPTION
    WHEN undefined_object THEN
        RAISE NOTICE 'validation_rule_argument_types_id_pkey does not exist, continuing';
END$$;

-- Foreign Keys

ALTER TABLE ONLY app_categories
    DROP CONSTRAINT IF EXISTS app_categories_workspace_id_fkey,
    DROP CONSTRAINT IF EXISTS app_categories_workspace_id_fk,
    ADD FOREIGN KEY (workspace_id) REFERENCES workspace(id) ON DELETE CASCADE;

ALTER TABLE ONLY app_publication_request_statuses
    DROP CONSTRAINT IF EXISTS app_publication_request_statu_app_publication_request_stat_fkey,
    DROP CONSTRAINT IF EXISTS app_publication_request_statuses_app_publication_request_status,
    ADD FOREIGN KEY (app_publication_request_status_code_id) REFERENCES app_publication_request_status_codes(id),
    DROP CONSTRAINT IF EXISTS app_publication_request_statuses_app_publication_request_id_fke,
    DROP CONSTRAINT IF EXISTS app_publication_request_statuse_app_publication_request_id_fkey,
    ADD FOREIGN KEY (app_publication_request_id) REFERENCES app_publication_requests(id);

ALTER TABLE ONLY apps
    DROP CONSTRAINT IF EXISTS apps_integration_data_id_fkey,
    DROP CONSTRAINT IF EXISTS app_integration_data_id_fk,
    ADD FOREIGN KEY (integration_data_id) REFERENCES integration_data(id);

ALTER TABLE ONLY input_output_mapping
    DROP CONSTRAINT IF EXISTS input_output_mapping_mapping_id_fkey,
    DROP CONSTRAINT IF EXISTS input_output_mapping_mapping_id_fk,
    ADD FOREIGN KEY (mapping_id) REFERENCES workflow_io_maps(id) ON DELETE CASCADE;

ALTER TABLE ONLY integration_data
    DROP CONSTRAINT IF EXISTS integration_data_user_id_fkey,
    DROP CONSTRAINT IF EXISTS integration_data_user_id_fk,
    ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE ONLY parameter_types
    DROP CONSTRAINT IF EXISTS parameter_types_value_type_id_fkey,
    DROP CONSTRAINT IF EXISTS parameter_types_value_type_fkey,
    ADD FOREIGN KEY (value_type_id) REFERENCES value_type(id);

ALTER TABLE ONLY parameters
    DROP CONSTRAINT IF EXISTS parameters_parameter_group_id_fkey,
    DROP CONSTRAINT IF EXISTS parameters_parameter_groups_id_fkey,
    ADD FOREIGN KEY (parameter_group_id) REFERENCES parameter_groups(id) ON DELETE CASCADE,
    DROP CONSTRAINT IF EXISTS parameters_parameter_type_fkey,
    DROP CONSTRAINT IF EXISTS parameters_parameter_types_fkey,
    ADD FOREIGN KEY (parameter_type) REFERENCES parameter_types(id);

ALTER TABLE ONLY tasks
    DROP CONSTRAINT IF EXISTS tasks_job_type_id_fkey,
    DROP CONSTRAINT IF EXISTS tasks_job_type_id_fk,
    ADD FOREIGN KEY (job_type_id) REFERENCES job_types(id),
    DROP CONSTRAINT IF EXISTS tasks_tool_id_fkey,
    DROP CONSTRAINT IF EXISTS tasks_tool_id_fk,
    ADD FOREIGN KEY (tool_id) REFERENCES tools(id);

ALTER TABLE ONLY tool_type_parameter_type
    DROP CONSTRAINT IF EXISTS tool_type_parameter_type_parameter_type_id_fkey,
    DROP CONSTRAINT IF EXISTS tool_type_parameter_type_parameter_types_fkey,
    ADD FOREIGN KEY (parameter_type_id) REFERENCES parameter_types(id);

ALTER TABLE ONLY tools
    -- dropped earlier
    ADD FOREIGN KEY (container_images_id) REFERENCES container_images(id),
    DROP CONSTRAINT IF EXISTS tools_integration_data_id_fkey,
    DROP CONSTRAINT IF EXISTS deployed_comp_integration_data_id_fk,
    ADD FOREIGN KEY (integration_data_id) REFERENCES integration_data(id);

ALTER TABLE ONLY validation_rule_arguments
    DROP CONSTRAINT IF EXISTS validation_rule_arguments_rule_id_fkey,
    DROP CONSTRAINT IF EXISTS validation_rule_arguments_validation_rules_id_fkey,
    ADD FOREIGN KEY (rule_id) REFERENCES validation_rules(id) ON DELETE CASCADE;

ALTER TABLE ONLY validation_rules
    DROP CONSTRAINT IF EXISTS validation_rules_parameter_id_fkey,
    DROP CONSTRAINT IF EXISTS validation_rules_parameters_id_fkey,
    ADD FOREIGN KEY (parameter_id) REFERENCES parameters(id) ON DELETE CASCADE;

ALTER TABLE ONLY webhooks_subscription
    DROP CONSTRAINT IF EXISTS webhooks_subscription_topic_id_fkey,
    DROP CONSTRAINT IF EXISTS topic_id_topic_fkey,
    ADD FOREIGN KEY (topic_id) REFERENCES webhooks_topic(id) ON DELETE CASCADE,
    DROP CONSTRAINT IF EXISTS webhooks_subscription_webhook_id_fkey,
    DROP CONSTRAINT IF EXISTS webhook_id_topic_fkey, -- references webhooks(id) despite the name
    ADD FOREIGN KEY (webhook_id) REFERENCES webhooks(id) ON DELETE CASCADE;

ALTER TABLE ONLY webhooks
    DROP CONSTRAINT IF EXISTS webhooks_type_id_fkey,
    ADD FOREIGN KEY (type_id) REFERENCES webhooks_type(id),
    DROP CONSTRAINT IF EXISTS webhooks_user_id_fkey,
    ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE ONLY workflow_io_maps
    DROP CONSTRAINT IF EXISTS workflow_io_maps_source_step_fkey,
    DROP CONSTRAINT IF EXISTS workflow_io_maps_source_fkey,
    ADD FOREIGN KEY (source_step) REFERENCES app_steps(id) ON DELETE CASCADE,
    DROP CONSTRAINT IF EXISTS workflow_io_maps_target_step_fkey,
    DROP CONSTRAINT IF EXISTS workflow_io_maps_target_fkey,
    ADD FOREIGN KEY (target_step) REFERENCES app_steps(id) ON DELETE CASCADE;

ALTER TABLE ONLY workspace
    DROP CONSTRAINT IF EXISTS workspace_user_id_fkey,
    DROP CONSTRAINT IF EXISTS workspace_users_fk,
    ADD FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

DROP INDEX IF EXISTS user_preferences_id; -- duplicated by pkey
DROP INDEX IF EXISTS user_saved_searches_id; -- duplicated by pkey
DROP INDEX IF EXISTS user_sessions_id; -- duplicated by pkey

-- Delete old _v192 stuff

ALTER TABLE ONLY access_tokens
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY app_categories
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS workspace_id_v192 CASCADE;

ALTER TABLE ONLY app_category_app
    DROP COLUMN IF EXISTS template_group_id_v192 CASCADE,
    DROP COLUMN IF EXISTS template_id_v192 CASCADE;

ALTER TABLE ONLY app_category_group
    DROP COLUMN IF EXISTS parent_group_id_v192 CASCADE,
    DROP COLUMN IF EXISTS subgroup_id_v192 CASCADE;

ALTER TABLE ONLY app_references
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS transformation_activity_id_v192 CASCADE;

ALTER TABLE ONLY authorization_requests
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY data_formats
    DROP COLUMN IF EXISTS id_v192 CASCADE;

ALTER TABLE ONLY file_parameters
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS name_v192 CASCADE,
    DROP COLUMN IF EXISTS label_v192 CASCADE,
    DROP COLUMN IF EXISTS orderd_v192 CASCADE,
    DROP COLUMN IF EXISTS switch_v192 CASCADE,
    DROP COLUMN IF EXISTS info_type_v192 CASCADE,
    DROP COLUMN IF EXISTS data_format_v192 CASCADE,
    DROP COLUMN IF EXISTS description_v192 CASCADE,
    DROP COLUMN IF EXISTS required_v192 CASCADE,
    DROP COLUMN IF EXISTS multiplicity_v192 CASCADE,
    DROP COLUMN IF EXISTS data_source_id_v192 CASCADE;

ALTER TABLE ONLY genome_reference
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS created_by_v192 CASCADE,
    DROP COLUMN IF EXISTS last_modified_by_v192 CASCADE;

DROP TABLE IF EXISTS hibernate_sequence_v192;

ALTER TABLE ONLY info_type
    DROP COLUMN IF EXISTS hid_v192 CASCADE;

ALTER TABLE ONLY input_output_mapping
    DROP COLUMN IF EXISTS mapping_id_v192 CASCADE,
    DROP COLUMN IF EXISTS input_v192 CASCADE,
    DROP COLUMN IF EXISTS output_v192 CASCADE;

ALTER TABLE ONLY job_types
    DROP COLUMN IF EXISTS id_v192 CASCADE;

ALTER TABLE ONLY jobs
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY job_steps
    DROP COLUMN IF EXISTS job_type_id_v192 CASCADE;

ALTER TABLE ONLY logins
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

DROP TABLE IF EXISTS multiplicity_v192 CASCADE;

ALTER TABLE ONLY parameter_groups
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS group_type_v192 CASCADE;

ALTER TABLE ONLY parameter_types
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS value_type_id_v192 CASCADE;

ALTER TABLE ONLY parameters
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS defalut_value_v192 CASCADE, -- RIP
    DROP COLUMN IF EXISTS property_type_v192 CASCADE,
    DROP COLUMN IF EXISTS validator_v192 CASCADE,
    DROP COLUMN IF EXISTS dataobject_id_v192 CASCADE,
    DROP COLUMN IF EXISTS id_v192 CASCADE;

DROP TABLE IF EXISTS property_group_property_v192 CASCADE;

ALTER TABLE ONLY rule_subtype
    DROP COLUMN IF EXISTS hid_v192 CASCADE;

ALTER TABLE ONLY rule_type
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS rule_subtype_id_v192 CASCADE;

ALTER TABLE ONLY rule_type_value_type
    DROP COLUMN IF EXISTS rule_type_id_v192 CASCADE,
    DROP COLUMN IF EXISTS value_type_id_v192 CASCADE;

ALTER TABLE ONLY suggested_groups
    DROP COLUMN IF EXISTS transformation_activity_id_v192 CASCADE,
    DROP COLUMN IF EXISTS template_group_id_v192 CASCADE;

DROP TABLE IF EXISTS template_input_v192 CASCADE;
DROP TABLE IF EXISTS template_output_v192 CASCADE;
DROP TABLE IF EXISTS template_property_group_v192 CASCADE;

ALTER TABLE ONLY tool_architectures
    DROP COLUMN IF EXISTS id_v192 CASCADE;

ALTER TABLE ONLY tool_request_statuses
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS tool_request_id_v192 CASCADE,
    DROP COLUMN IF EXISTS updater_id_v192 CASCADE;

ALTER TABLE ONLY tool_requests
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS requestor_id_v192 CASCADE,
    DROP COLUMN IF EXISTS tool_architecture_id_v192 CASCADE,
    DROP COLUMN IF EXISTS deployed_component_id_v192 CASCADE;

ALTER TABLE ONLY tool_test_data_files
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS deployed_component_id_v192 CASCADE;

ALTER TABLE ONLY tool_type_parameter_type
    DROP COLUMN IF EXISTS tool_type_id_v192 CASCADE,
    DROP COLUMN IF EXISTS property_type_id_v192 CASCADE;

DROP TABLE IF EXISTS transformation_activity_mappings_v192 CASCADE;
DROP TABLE IF EXISTS transformation_steps_v192 CASCADE;
DROP TABLE IF EXISTS transformation_values_v192 CASCADE;
DROP TABLE IF EXISTS transformations_v192 CASCADE;

ALTER TABLE ONLY user_preferences
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY user_saved_searches
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY user_sessions
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY validation_rule_arguments
    DROP COLUMN IF EXISTS rule_id_v192 CASCADE;

ALTER TABLE ONLY validation_rules
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS name_v192 CASCADE,
    DROP COLUMN IF EXISTS description_v192 CASCADE,
    DROP COLUMN IF EXISTS label_v192 CASCADE,
    DROP COLUMN IF EXISTS rule_type_v192 CASCADE;

DROP TABLE IF EXISTS validator_rule_v192 CASCADE;
DROP TABLE IF EXISTS validator_v192 CASCADE;

ALTER TABLE ONLY value_type
    DROP COLUMN IF EXISTS hid_v192 CASCADE;

ALTER TABLE ONLY workflow_io_maps
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS source_v192 CASCADE,
    DROP COLUMN IF EXISTS target_v192 CASCADE;

ALTER TABLE ONLY workspace
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS home_folder_v192 CASCADE,
    DROP COLUMN IF EXISTS root_analysis_group_id_v192 CASCADE,
    DROP COLUMN IF EXISTS user_id_v192 CASCADE;

ALTER TABLE ONLY app_steps
    DROP COLUMN IF EXISTS transformation_task_id_v192 CASCADE,
    DROP COLUMN IF EXISTS transformation_step_id_v192 CASCADE;

ALTER TABLE ONLY apps
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS workspace_id_v192 CASCADE,
    DROP COLUMN IF EXISTS type_v192 CASCADE,
    DROP COLUMN IF EXISTS integration_data_id_v192 CASCADE,
    DROP COLUMN IF EXISTS id_v192 CASCADE;

ALTER TABLE ONLY tasks
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS type_v192 CASCADE,
    DROP COLUMN IF EXISTS component_id_v192 CASCADE;

ALTER TABLE ONLY tool_types
    DROP COLUMN IF EXISTS id_v192 CASCADE;

ALTER TABLE ONLY tools
    DROP COLUMN IF EXISTS hid_v192 CASCADE,
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS integration_data_id_v192 CASCADE,
    DROP COLUMN IF EXISTS tool_type_id_v192 CASCADE;

ALTER TABLE ONLY integration_data
    DROP COLUMN IF EXISTS id_v192 CASCADE;

ALTER TABLE ONLY ratings
    DROP COLUMN IF EXISTS id_v192 CASCADE,
    DROP COLUMN IF EXISTS user_id_v192 CASCADE,
    DROP COLUMN IF EXISTS transformation_activity_id_v192 CASCADE;

ALTER TABLE ONLY users
    DROP COLUMN IF EXISTS id_v192 CASCADE;

-- Now, recreate views that may reference these columns
CREATE OR REPLACE VIEW app_listing AS
    SELECT apps.id,
           apps."name",
           lower(apps."name") AS lower_case_name,
           apps.description,
           integration.integrator_name,
           integration.integrator_email,
           apps.integration_date,
           apps.edited_date,
           apps.wiki_url,
           (   SELECT CAST(COALESCE(AVG(rating), 0.0) AS DOUBLE PRECISION)
               FROM ratings
               WHERE app_id = apps.id
           ) AS average_rating,
           (   SELECT COUNT(rating)
               FROM ratings
               WHERE app_id = apps.id
           ) AS total_ratings,
           EXISTS (
               SELECT *
               FROM app_category_app aca
               JOIN app_categories ac ON aca.app_category_id = ac.id
               JOIN workspace w ON ac.workspace_id = w.id
               WHERE apps.id = aca.app_id
               AND w.is_public IS TRUE
           ) AS is_public,
           COUNT(steps.*) AS step_count,
           COUNT(t.tool_id) AS tool_count,
           COUNT(t.external_app_id) AS external_app_count,
           COUNT(t.id) AS task_count,
           apps.deleted,
           apps.disabled,
           CASE WHEN COUNT(DISTINCT tt.name) = 0 THEN 'unknown'
                WHEN COUNT(DISTINCT tt.name) > 1 THEN 'mixed'
                ELSE MAX(tt.name)
           END AS overall_job_type,
           integration.user_id AS integrator_id,
           u.username AS integrator_username,
           array_agg(tt.name) as job_types
    FROM apps
         LEFT JOIN integration_data integration ON apps.integration_data_id = integration.id
         LEFT JOIN users u ON integration.user_id = u.id
         LEFT JOIN app_steps steps ON apps.id = steps.app_id
         LEFT JOIN tasks t ON steps.task_id = t.id
         LEFT JOIN tools tool ON t.tool_id = tool.id
         LEFT JOIN tool_types tt ON tool.tool_type_id = tt.id
    GROUP BY apps.id,
             apps."name",
             apps.description,
             integration.integrator_name,
             integration.integrator_email,
             integration.user_id,
             u.username,
             apps.integration_date,
             apps.edited_date,
             apps.wiki_url,
             apps.deleted,
             apps.disabled;

CREATE OR REPLACE VIEW job_listings AS
    SELECT j.id,
           j.job_name,
           j.app_name,
           j.start_date,
           j.end_date,
           j.status,
           j.deleted,
           j.notify,
           u.username,
           j.job_description,
           j.app_id,
           j.app_wiki_url,
           j.app_description,
           j.result_folder_path,
           j.submission,
           t.name AS job_type,
           j.parent_id,
           EXISTS (
               SELECT * FROM jobs child
               WHERE child.parent_id = j.id
           ) AS is_batch,
           t.system_id,
           j.planned_end_date,
           j.user_id
    FROM jobs j
    JOIN users u ON j.user_id = u.id
    JOIN job_types t ON j.job_type_id = t.id;

CREATE OR REPLACE VIEW tool_listing AS
    SELECT row_number() OVER (ORDER BY apps.id, steps.step) AS id,
           apps.id AS app_id,
           apps.is_public,
           steps.step AS execution_order,
           tool.id AS tool_id,
           tool."name",
           tool.description,
           tool.location,
           tt."name" AS "type",
           tt.hidden,
           tool.version,
           tool.attribution,
           tool.container_images_id
    FROM app_listing AS apps
         JOIN app_steps steps ON apps.id = steps.app_id
         JOIN tasks t ON steps.task_id = t.id
         JOIN tools tool ON t.tool_id = tool.id
         JOIN tool_types tt ON tool.tool_type_id = tt.id;

COMMIT;
