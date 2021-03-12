-- Populates the request_status_codes table

INSERT INTO request_status_codes (id, name, display_name, email_template) VALUES
    ('dc983a80-5cd6-4c56-a9a6-7fbe8787fdd0', 'submitted', 'Submitted', 'request_submitted'),
    ('74c25fd8-5cdf-4a3d-89a2-c55e88277c6a', 'in-progress', 'In Progress', 'request_in_progress'),
    ('184029d3-7767-413e-82a0-4af68f2282b7', 'approved', 'Approved', 'request_complete'),
    ('71c59a1b-f322-4114-9bbe-3aaa6c7c1942', 'rejected', 'Rejected', 'request_rejected')
ON CONFLICT (id) DO UPDATE
SET name = EXCLUDED.name,
    display_name = EXCLUDED.display_name,
    email_template = EXCLUDED.email_template;
