-- guilty-party: dennis, Dennis Roberts <dennis@iplantcollaborative.org>
-- date: July 8, 2011

\set ON_ERROR_STOP ON

BEGIN;

-- Delete the TNRS demo analysis.
UPDATE transformation_activity SET deleted = TRUE WHERE hid = 17;

-- Deprecate the MustContain rule type.
UPDATE rule_type SET deprecated = TRUE WHERE name = 'MustContain';

-- Create a table for our enumeration of multiplicities.
CREATE TABLE multiplicity (
    hid BIGINT NOT NULL,
    id VARCHAR(36),
    name VARCHAR(64),
    label VARCHAR(255),
    description VARCHAR(255),
    type_name VARCHAR(64),
    PRIMARY KEY (hid)
);

-- Add the list of valid multiplicities
INSERT INTO multiplicity (hid, id, name, label, description, type_name) VALUES ('0', 'F137B03F-A685-4D4F-ADCA-391A6D57BDFA', 'many', 'Many', '', 'MultiFileSelector');
INSERT INTO multiplicity (hid, id, name, label, description, type_name) VALUES ('1', 'AE1D0568-2F11-4624-B8F1-220E77F14AF7', 'single', 'Single', '', 'FileInput');
INSERT INTO multiplicity (hid, id, name, label, description, type_name) VALUES ('2', '57C3C939-FB72-4E89-8D6F-E01A5A336445', 'collection', 'Folder', '', 'FolderInput');

-- Replace the string multiplicities with references to the enumeration.
ALTER TABLE dataobjects RENAME COLUMN multiplicity TO multiplicity_name;
ALTER TABLE dataobjects ADD COLUMN multiplicity BIGINT;
ALTER TABLE dataobjects ADD FOREIGN KEY (multiplicity) REFERENCES multiplicity (hid);

-- Update all existing data objects.
UPDATE dataobjects SET multiplicity = '0' WHERE multiplicity_name = 'many';
UPDATE dataobjects SET multiplicity = '1' WHERE multiplicity_name = 'single';
UPDATE dataobjects SET multiplicity = '2' WHERE multiplicity_name = 'folder';

-- Drop the multiplicity_name column, which is not needed any longer.
ALTER TABLE dataobjects DROP COLUMN multiplicity_name;

-- Correct the name of one of the template groups.
UPDATE template_group SET name = 'Phylogenetics/Systematics' WHERE hid = 2;

-- Add a new property type for multiline text fields.
INSERT INTO property_type (hid, id, name, description, label, deprecated, display_order, value_type_id) VALUES ('15', 'F03DD9AC-B586-4FE1-A75B-3E2967BD0207', 'MultiLineText', 'A multiline text box', '', FALSE, 9, 1);

-- Modify the existing XBasePairs property type.
UPDATE property_type SET description = 'A text box with caption (x=user specified number)' WHERE name = 'XBasePairs';

-- Add a new XBasePairs property type for text.
INSERT INTO property_type (hid, id, name, description, label, deprecated, display_order, value_type_id)
VALUES ('16', '871AA217-2E6C-48E2-880A-EE7815E8F7F8', 'XBasePairsText', 'A text box with caption (x=user specified text)', '', FALSE, 4, 1);

-- Add a new rule type for a character length limit.
INSERT INTO rule_type (hid, id, name, description, label, deprecated, display_order, rule_description_format, rule_subtype_id)
VALUES ('11', '2D531048-A876-4B5D-8D21-54074910C721', 'CharacterLimit', 'Value must contain at most a maximum number of characters', '', FALSE, '11', 'Value must contain at most {Number} characters.', 3);

-- Associate the rule type with the appropriate value types.
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES ('11', '1');

COMMIT;
