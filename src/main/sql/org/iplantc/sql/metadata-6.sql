-- guilty-party: psarando, Paul Sarando <psarando@iplantcollaborative.org>
-- date: Aug 11, 2011

\set ON_ERROR_STOP ON

BEGIN;

-- place modifications and addition to the schema for Release 0.6 (version 5)

-- Add a DataObject ID to the property table
ALTER TABLE property ADD COLUMN dataobject_id BIGINT;
ALTER TABLE property ADD FOREIGN KEY (dataobject_id) REFERENCES dataobjects(hid);

INSERT INTO value_type (hid, id, name, description) VALUES (4, '94FE4F2B-42F9-4EE7-BC28-F64CC8DAF691', 'Input', 'Input file or folder');
INSERT INTO value_type (hid, id, name, description) VALUES (5, '65E1E927-A1ED-4E25-BC0C-74C155215973', 'Output', 'Output file or folder');

INSERT INTO property_type (hid, id, name, description, value_type_id) VALUES (17, 'C00ED92F-5399-490C-A6E5-AAD0E140D7FE', 'Input', 'Input file or folder', 4);
INSERT INTO property_type (hid, id, name, description, value_type_id) VALUES (18, 'F7007237-040D-4253-9323-CAA4F71E9795', 'Output', 'Output file or folder', 5);

COMMIT;

