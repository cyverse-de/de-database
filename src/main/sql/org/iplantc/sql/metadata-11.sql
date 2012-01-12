\set ON_ERROR_STOP ON

BEGIN;

-- Rename the root template group in the public workspace to something that can be displayed.
UPDATE template_group SET "name" = 'Public Applications' WHERE hid = 1;

-- Create a sequence generator for deployed components.
CREATE SEQUENCE deployed_component_id_seq;
SELECT setval('deployed_component_id_seq', (SELECT max(hid) FROM deployed_components));
ALTER TABLE deployed_components ALTER COLUMN hid SET DEFAULT nextval('deployed_component_id_seq');

COMMIT;
