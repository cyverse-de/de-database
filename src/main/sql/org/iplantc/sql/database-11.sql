\set ON_ERROR_STOP ON

BEGIN;

-- Add a column to indicate the root analysis group for a workspace.
ALTER TABLE workspace ADD COLUMN root_analysis_group_id BIGINT REFERENCES template_group(hid);

-- Add a column to indicate whether or not a workspace is public.
ALTER TABLE workspace ADD COLUMN is_public BOOLEAN DEFAULT FALSE;

-- Add a public workspace.
INSERT INTO workspace (id, user_id, root_analysis_group_id, is_public) VALUES (0, '<public>', 1, TRUE);

-- Create a sequence generator for workspaces.
CREATE SEQUENCE workspace_id_seq;
SELECT setval('workspace_id_seq', (SELECT max(id) FROM workspace));
ALTER TABLE workspace ALTER COLUMN id SET DEFAULT nextval('workspace_id_seq');

COMMIT;
