\set ON_ERROR_STOP ON

BEGIN;

-- Associate the root public analysis group with the public workspace.
UPDATE template_group SET workspace_id = 0 WHERE workspace_id = 1;

-- Create a sequence for the internal template group identifier.
CREATE SEQUENCE template_group_id_seq;
ALTER TABLE template_group ALTER COLUMN hid SET DEFAULT nextval('template_group_id_seq');
SELECT setval('template_group_id_seq', (SELECT max(hid) FROM template_group));

COMMIT;
