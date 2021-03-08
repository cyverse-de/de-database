BEGIN;

SET search_path = public, pg_catalog;

DROP TABLE IF EXISTS tool_test_data_files;

DROP TABLE IF EXISTS tool_type_parameter_type;

DROP TABLE IF EXISTS tool_request_statuses;
DROP TABLE IF EXISTS tool_request_status_codes;
DROP TABLE IF EXISTS tool_requests;
DROP TABLE IF EXISTS tool_architectures;

DROP TABLE IF EXISTS container_volumes;
DROP TABLE IF EXISTS container_devices;
DROP TABLE IF EXISTS container_ports;
DROP TABLE IF EXISTS container_volumes_from;
DROP TABLE IF EXISTS data_containers;
DROP TABLE IF EXISTS container_settings;
DROP TABLE IF EXISTS interactive_apps_proxy_settings;

COMMIT;
