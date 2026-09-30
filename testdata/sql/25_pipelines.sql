-- Pipeline wiring for the two-step Test Pipeline 1 (app 66...609, version 77...791):
-- step one's output parameter feeds step two's input parameter. This drives
-- step_count/task_count in app_listing and the pipeline endpoints.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO workflow_io_maps (id, app_version_id, source_step, target_step) VALUES
    ('d1000000-0000-0000-0000-000000000001', '77777777-7777-7777-7777-777777777791',
        '88888888-8888-8888-8888-888888888891', '88888888-8888-8888-8888-888888888892')
ON CONFLICT (id) DO NOTHING;

INSERT INTO input_output_mapping (mapping_id, input, output) VALUES
    ('d1000000-0000-0000-0000-000000000001',
        'a2000000-0000-0000-0000-000000000901',   -- step two input file
        'a2000000-0000-0000-0000-000000000802')   -- step one output file
ON CONFLICT (mapping_id, input, external_input) DO NOTHING;

COMMIT;
