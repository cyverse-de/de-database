-- guilty-party: dennis, Dennis Roberts, <dennis@iplantcollaborative.org>
-- date: April 4, 2011

-- Remove all rule type references from existing rules.
UPDATE RULE SET rule_type = NULL;

-- Delete all existing rule types;
DELETE FROM rule_type;

-- Insert the new rule types.
INSERT INTO rule_type (hid, id, name, description) VALUES(1, 'rt07303d4b-3635-4934-93e6-b24de4f2725b', 'IntBelowField', '');
INSERT INTO rule_type (hid, id, name, description) VALUES(2, 'rt2c3eec11-011a-4152-b27b-00d73deab7cf', 'IntAbove', '');
INSERT INTO rule_type (hid, id, name, description) VALUES(3, 'rte04fb2c6-d5fd-47e4-ae89-a67390ccb67e', 'IntRange', '');
INSERT INTO rule_type (hid, id, name, description) VALUES(4, 'rte1afc242-8962-4f0c-95be-5a6363cdd48b', 'IntAboveField', '');
INSERT INTO rule_type (hid, id, name, description) VALUES(5, 'rt0621f097-1b31-4457-812b-c8ca70bfbe14', 'MustContain', '');
INSERT INTO rule_type (hid, id, name, description) VALUES(6, 'rt58cd8b75-5598-4490-a9c9-a6d7a8cd09dd', 'DoubleRange', '');

-- Update existing rules.
UPDATE rule SET rule_type = 2 WHERE hid = 1;
UPDATE rule SET rule_type = 2 WHERE hid = 2;
UPDATE rule SET rule_type = 2 WHERE hid = 3;
UPDATE rule SET rule_type = 2 WHERE hid = 4;
UPDATE rule SET rule_type = 5 WHERE hid = 5;
UPDATE rule SET rule_type = 6 WHERE hid = 6;
UPDATE rule SET rule_type = 3 WHERE hid = 7;
UPDATE rule SET rule_type = 3 WHERE hid = 8;
UPDATE rule SET rule_type = 6 WHERE hid = 9;
UPDATE rule SET rule_type = 5 WHERE hid = 10;
UPDATE rule SET rule_type = 2 WHERE hid = 11;
UPDATE rule SET rule_type = 2 WHERE hid = 12;
UPDATE rule SET rule_type = 2 WHERE hid = 13;
UPDATE rule SET rule_type = 2 WHERE hid = 14;
UPDATE rule SET rule_type = 2 WHERE hid = 15;
UPDATE rule SET rule_type = 2 WHERE hid = 16;
UPDATE rule SET rule_type = 2 WHERE hid = 17;
UPDATE rule SET rule_type = 2 WHERE hid = 18;
UPDATE rule SET rule_type = 2 WHERE hid = 19;
UPDATE rule SET rule_type = 2 WHERE hid = 20;
UPDATE rule SET rule_type = 2 WHERE hid = 21;
UPDATE rule SET rule_type = 2 WHERE hid = 22;
UPDATE rule SET rule_type = 2 WHERE hid = 23;
UPDATE rule SET rule_type = 5 WHERE hid = 24;
UPDATE rule SET rule_type = 6 WHERE hid = 25;
UPDATE rule SET rule_type = 3 WHERE hid = 26;
UPDATE rule SET rule_type = 3 WHERE hid = 27;
UPDATE rule SET rule_type = 6 WHERE hid = 28;
UPDATE rule SET rule_type = 5 WHERE hid = 29;
UPDATE rule SET rule_type = 2 WHERE hid = 30;
UPDATE rule SET rule_type = 2 WHERE hid = 31;
UPDATE rule SET rule_type = 2 WHERE hid = 32;
UPDATE rule SET rule_type = 2 WHERE hid = 33;
UPDATE rule SET rule_type = 2 WHERE hid = 34;
UPDATE rule SET rule_type = 2 WHERE hid = 35;
UPDATE rule SET rule_type = 2 WHERE hid = 36;
UPDATE rule SET rule_type = 2 WHERE hid = 37;
UPDATE rule SET rule_type = 2 WHERE hid = 38;
UPDATE rule SET rule_type = 3 WHERE hid = 39;
UPDATE rule SET rule_type = 3 WHERE hid = 40;
UPDATE rule SET rule_type = 2 WHERE hid = 41;
UPDATE rule SET rule_type = 2 WHERE hid = 42;
UPDATE rule SET rule_type = 2 WHERE hid = 43;
UPDATE rule SET rule_type = 2 WHERE hid = 44;
UPDATE rule SET rule_type = 5 WHERE hid = 45;
UPDATE rule SET rule_type = 6 WHERE hid = 46;
UPDATE rule SET rule_type = 3 WHERE hid = 47;
UPDATE rule SET rule_type = 6 WHERE hid = 48;
UPDATE rule SET rule_type = 5 WHERE hid = 49;
UPDATE rule SET rule_type = 2 WHERE hid = 50;
UPDATE rule SET rule_type = 6 WHERE hid = 51;
UPDATE rule SET rule_type = 6 WHERE hid = 52;
UPDATE rule SET rule_type = 3 WHERE hid = 53;
UPDATE rule SET rule_type = 2 WHERE hid = 54;
UPDATE rule SET rule_type = 6 WHERE hid = 55;
UPDATE rule SET rule_type = 6 WHERE hid = 56;
UPDATE rule SET rule_type = 2 WHERE hid = 57;
UPDATE rule SET rule_type = 2 WHERE hid = 58;
UPDATE rule SET rule_type = 2 WHERE hid = 59;
UPDATE rule SET rule_type = 5 WHERE hid = 60;
UPDATE rule SET rule_type = 6 WHERE hid = 61;
UPDATE rule SET rule_type = 3 WHERE hid = 62;
UPDATE rule SET rule_type = 5 WHERE hid = 63;
UPDATE rule SET rule_type = 3 WHERE hid = 64;
UPDATE rule SET rule_type = 3 WHERE hid = 65;
UPDATE rule SET rule_type = 2 WHERE hid = 66;
UPDATE rule SET rule_type = 5 WHERE hid = 67;
UPDATE rule SET rule_type = 2 WHERE hid = 68;
UPDATE rule SET rule_type = 1 WHERE hid = 69;
UPDATE rule SET rule_type = 2 WHERE hid = 70;
UPDATE rule SET rule_type = 4 WHERE hid = 71;

UPDATE rule SET name = '', label = '';
