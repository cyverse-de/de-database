-- Synthetic analyses (jobs) spanning the common statuses, including a batch
-- parent with two children and two interactive jobs tied to operators. jobs.app_id
-- holds the app UUID as text (the job system stores it denormalized). Each
-- non-parent job gets a job_step; a couple get a job_status_updates trail.
BEGIN;
SET search_path = public, pg_catalog;

INSERT INTO jobs (id, job_name, job_description, app_name, app_description, result_folder_path,
                  start_date, end_date, status, notify, user_id, app_id, job_type_id, parent_id,
                  planned_end_date, app_version_id, operator_id) VALUES
    ('dddddddd-dddd-dddd-dddd-dddddddddd01', 'Test Analysis 1', '', 'Test App 1', 'First synthetic app',
        '/iplant/home/testuser01/analyses/test-analysis-1', '2024-01-15 10:00:00+00', '2024-01-15 10:20:00+00',
        'Completed', true, '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666601',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777701', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd02', 'Test Analysis 2', '', 'Test App 2', 'Second synthetic app',
        '/iplant/home/testuser01/analyses/test-analysis-2', '2024-01-16 09:00:00+00', '2024-01-16 09:05:00+00',
        'Failed', true, '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666602',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777702', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd03', 'Test Analysis 3', '', 'Test App 3', 'Third synthetic app',
        '/iplant/home/testuser02/analyses/test-analysis-3', '2024-02-01 14:00:00+00', '2024-02-01 14:02:00+00',
        'Canceled', true, '11111111-1111-1111-1111-111111111102', '66666666-6666-6666-6666-666666666603',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777703', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd04', 'Test Interactive Analysis 1', '', 'Test Interactive App', 'Synthetic interactive (VICE) app',
        '/iplant/home/testuser02/analyses/test-interactive-1', '2024-02-10 08:00:00+00', NULL,
        'Running', true, '11111111-1111-1111-1111-111111111102', '66666666-6666-6666-6666-666666666605',
        (SELECT id FROM job_types WHERE name='Interactive' AND system_id='interactive'), NULL, '2024-02-12 08:00:00+00',
        '77777777-7777-7777-7777-777777777705', 'cccccccc-cccc-cccc-cccc-cccccccccc01'),
    ('dddddddd-dddd-dddd-dddd-dddddddddd05', 'Test Analysis 5', '', 'Test App 1', 'First synthetic app',
        '/iplant/home/testuser03/analyses/test-analysis-5', '2024-03-01 11:00:00+00', NULL,
        'Submitted', true, '11111111-1111-1111-1111-111111111103', '66666666-6666-6666-6666-666666666601',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777701', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd06', 'Test Analysis 6', '', 'Test App 4', 'Fourth synthetic app',
        '/iplant/home/testuser03/analyses/test-analysis-6', '2024-03-02 11:00:00+00', NULL,
        'Queued', true, '11111111-1111-1111-1111-111111111103', '66666666-6666-6666-6666-666666666604',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777704', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd07', 'Test Analysis 7', '', 'Test App 2', 'Second synthetic app',
        '/iplant/home/testuser04/analyses/test-analysis-7', '2024-03-05 13:00:00+00', '2024-03-05 13:30:00+00',
        'Completed', false, '11111111-1111-1111-1111-111111111104', '66666666-6666-6666-6666-666666666602',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777702', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd08', 'Test Interactive Analysis 2', '', 'Test Interactive App', 'Synthetic interactive (VICE) app',
        '/iplant/home/testuser05/analyses/test-interactive-2', '2024-03-10 08:00:00+00', NULL,
        'Running', true, '11111111-1111-1111-1111-111111111105', '66666666-6666-6666-6666-666666666605',
        (SELECT id FROM job_types WHERE name='Interactive' AND system_id='interactive'), NULL, '2024-03-12 08:00:00+00',
        '77777777-7777-7777-7777-777777777705', 'cccccccc-cccc-cccc-cccc-cccccccccc02'),
    ('dddddddd-dddd-dddd-dddd-dddddddddd09', 'Test Batch Analysis', '', 'Test App 1', 'First synthetic app',
        '/iplant/home/testuser01/analyses/test-batch', '2024-04-01 10:00:00+00', '2024-04-01 10:40:00+00',
        'Completed', true, '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666601',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777701', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd10', 'Test Batch Analysis - 1', '', 'Test App 1', 'First synthetic app',
        '/iplant/home/testuser01/analyses/test-batch/1', '2024-04-01 10:00:00+00', '2024-04-01 10:20:00+00',
        'Completed', true, '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666601',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 'dddddddd-dddd-dddd-dddd-dddddddddd09', NULL, '77777777-7777-7777-7777-777777777701', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd11', 'Test Batch Analysis - 2', '', 'Test App 1', 'First synthetic app',
        '/iplant/home/testuser01/analyses/test-batch/2', '2024-04-01 10:20:00+00', '2024-04-01 10:40:00+00',
        'Failed', true, '11111111-1111-1111-1111-111111111101', '66666666-6666-6666-6666-666666666601',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 'dddddddd-dddd-dddd-dddd-dddddddddd09', NULL, '77777777-7777-7777-7777-777777777701', NULL),
    ('dddddddd-dddd-dddd-dddd-dddddddddd12', 'Test Analysis 12', '', 'Test App 3', 'Third synthetic app',
        '/iplant/home/testuser06/analyses/test-analysis-12', '2024-04-10 16:00:00+00', '2024-04-10 16:15:00+00',
        'Completed', true, '11111111-1111-1111-1111-111111111106', '66666666-6666-6666-6666-666666666603',
        (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), NULL, NULL, '77777777-7777-7777-7777-777777777703', NULL)
ON CONFLICT (id) DO NOTHING;

-- One job step per non-parent job (the batch parent dd...09 has none; its children do).
INSERT INTO job_steps (job_id, step_number, external_id, start_date, end_date, status, job_type_id, app_step_number) VALUES
    ('dddddddd-dddd-dddd-dddd-dddddddddd01', 1, 'extjob-01-0', '2024-01-15 10:00:00+00', '2024-01-15 10:20:00+00', 'Completed', (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd02', 1, 'extjob-02-0', '2024-01-16 09:00:00+00', '2024-01-16 09:05:00+00', 'Failed',    (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd03', 1, 'extjob-03-0', '2024-02-01 14:00:00+00', '2024-02-01 14:02:00+00', 'Canceled',  (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd04', 1, 'extjob-04-0', '2024-02-10 08:00:00+00', NULL, 'Running', (SELECT id FROM job_types WHERE name='Interactive' AND system_id='interactive'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd05', 1, 'extjob-05-0', '2024-03-01 11:00:00+00', NULL, 'Submitted', (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd06', 1, 'extjob-06-0', '2024-03-02 11:00:00+00', NULL, 'Submitted', (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd07', 1, 'extjob-07-0', '2024-03-05 13:00:00+00', '2024-03-05 13:30:00+00', 'Completed', (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd08', 1, 'extjob-08-0', '2024-03-10 08:00:00+00', NULL, 'Running', (SELECT id FROM job_types WHERE name='Interactive' AND system_id='interactive'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd10', 1, 'extjob-10-0', '2024-04-01 10:00:00+00', '2024-04-01 10:20:00+00', 'Completed', (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd11', 1, 'extjob-11-0', '2024-04-01 10:20:00+00', '2024-04-01 10:40:00+00', 'Failed',    (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0),
    ('dddddddd-dddd-dddd-dddd-dddddddddd12', 1, 'extjob-12-0', '2024-04-10 16:00:00+00', '2024-04-10 16:15:00+00', 'Completed', (SELECT id FROM job_types WHERE name='DE' AND system_id='de'), 0)
ON CONFLICT (job_id, step_number) DO NOTHING;

-- Status update trail for the first two analyses. sent_from is an inet address and
-- sent_on is epoch milliseconds.
INSERT INTO job_status_updates (id, external_id, message, status, sent_from, sent_from_hostname, sent_on, propagated) VALUES
    ('eeee0000-0000-0000-0000-000000000101', 'extjob-01-0', 'Job submitted', 'Submitted', '10.0.0.1', 'job-status-listener', 1705312800000, true),
    ('eeee0000-0000-0000-0000-000000000102', 'extjob-01-0', 'Job running',   'Running',   '10.0.0.1', 'job-status-listener', 1705312860000, true),
    ('eeee0000-0000-0000-0000-000000000103', 'extjob-01-0', 'Job completed', 'Completed', '10.0.0.1', 'job-status-listener', 1705314000000, true),
    ('eeee0000-0000-0000-0000-000000000201', 'extjob-02-0', 'Job submitted', 'Submitted', '10.0.0.1', 'job-status-listener', 1705395600000, true),
    ('eeee0000-0000-0000-0000-000000000202', 'extjob-02-0', 'Job failed',    'Failed',    '10.0.0.1', 'job-status-listener', 1705395900000, true)
ON CONFLICT (id) DO NOTHING;

COMMIT;
