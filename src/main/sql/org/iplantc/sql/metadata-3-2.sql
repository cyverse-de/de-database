-- guilty-party: dennis, Dennis Roberts, <dennis@iplantcollaborative.org>
-- date: April 4, 2011

-- Create database tables for information types and file formats.
CREATE TABLE info_type (
	hid BIGINT NOT NULL,
	id VARCHAR(40) NOT NULL,
	name VARCHAR(64) NOT NULL,
	label VARCHAR(255),
	description VARCHAR(255),
	PRIMARY KEY(hid)
);
CREATE TABLE data_format (
	hid BIGINT NOT NULL,
	id VARCHAR(40) NOT NULL,
	name VARCHAR(64) NOT NULL,
	label VARCHAR(255),
	description VARCHAR(255),
	PRIMARY KEY(hid)
);

-- Create info types for existing data object types.
INSERT INTO info_type (hid, id, name, label) VALUES ('1', '97D8CCF7-7242-4038-942C-235F2291AB6C', 'ACEField', 'Reconciled Tree and Trait Information for CACE and DACE');
INSERT INTO info_type (hid, id, name, label) VALUES ('2', 'CA9ADDE4-AB94-4A40-8C2F-C0B814156298', 'ContrastField', 'Reconciled Tree and Trait Informaiton for Independent Contrast');
INSERT INTO info_type (hid, id, name, label) VALUES ('3', '0900E992-3BBD-4F4B-8D2D-ED289CA4E4F1', 'File', 'Unspecified');
INSERT INTO info_type (hid, id, name, label) VALUES ('4', '212907C0-736E-4DBE-B6E7-5DC0431C275F', 'ReconcileTaxa', 'Reconciled Taxonomy Information');
INSERT INTO info_type (hid, id, name, label) VALUES ('5', 'E819FF9A-7398-4DF9-8191-0F5AFBBE5CA3', 'ReferenceDummyGenes', 'Fake Reference Genome for the Cufflinks Post-Processing Step');
INSERT INTO info_type (hid, id, name, label) VALUES ('6', '0E3343E3-C59A-44C4-B5EE-D4501EC3A898', 'ReferenceGenome', 'Reference Sequence and Annotations');
INSERT INTO info_type (hid, id, name, label) VALUES ('7', '57EB7FB6-BDC0-42AA-B494-0483F9347815', 'ReferenceSequence', 'Reference Sequence Only');
INSERT INTO info_type (hid, id, name, label) VALUES ('8', '68246DDF-8B1B-44C0-827F-88945CAD8227', 'ReferenceAnnotation', 'Reference Annotation Only');
INSERT INTO info_type (hid, id, name, label) VALUES ('9', '762E5A0A-AFB2-420E-8456-F79C78A29051', 'SequenceAlignment', 'Sequence Alignment');
INSERT INTO info_type (hid, id, name, label) VALUES ('10', 'F65A8F23-3E46-4DF4-80F9-387641C013A6', 'MultipleSequenceAlignment', 'Multiple Sequence Alignment');
INSERT INTO info_type (hid, id, name, label) VALUES ('11', '4A56F043-C62F-4FE9-A11F-A9A7D18E370F', 'BarcodeFile', 'Barcode File');
INSERT INTO info_type (hid, id, name, label) VALUES ('12', 'DD178256-CE77-41B0-A785-7E955799A20D', 'ExpressionData', 'Expression Data');
INSERT INTO info_type (hid, id, name, label) VALUES ('13', '13313A72-EA0A-49DF-9105-AF798165A482', 'GenomicAnnotation', 'Genomic Annotation');
INSERT INTO info_type (hid, id, name, label) VALUES ('14', 'D4089473-139E-4345-9CA9-ADDCFC4B887E', 'BiologicalModel', 'Biological Model');
INSERT INTO info_type (hid, id, name, label) VALUES ('15', '1C59C759-9CD3-4036-B7B4-82E8DA40D0C2', 'NucleotideOrPeptideSequence', 'Nucleotide or Peptide Sequence');
INSERT INTO info_type (hid, id, name, label) VALUES ('16', '3B4FC426-290A-4F63-ADB4-75A60A43B420', 'Structure', 'Structure');
INSERT INTO info_type (hid, id, name, label) VALUES ('17', 'A378CA30-28C9-4179-8381-EC098A89D12B', 'TraitFile', 'Trait File');
INSERT INTO info_type (hid, id, name, label) VALUES ('18', '7BDA7EF9-7B25-43DA-93D3-A6C483FD24E4', 'TreeFile', 'Tree File');
INSERT INTO info_type (hid, id, name, label) VALUES ('19', 'F1A9CE39-B83D-4820-909E-583F76BC5EBE', 'VariantData', 'Variant Data');
INSERT INTO info_type (hid, id, name, label) VALUES ('20', 'F51BAAE3-4368-4814-BCA0-78BAD9906445', 'Archive', 'Archive');
INSERT INTO info_type (hid, id, name, label) VALUES ('21', '57BD5BA7-C899-4D50-8676-A3CD56E68F8A', 'Binary', 'Binary');
INSERT INTO info_type (hid, id, name, label) VALUES ('22', '3B07F544-86A6-459E-B46A-BA53E6A37F33', 'TabularData', 'Tabular Data');
INSERT INTO info_type (hid, id, name, label) VALUES ('23', 'D433BEE7-BFDE-4696-A2B8-EB2B92AC0E13', 'GraphFile', 'Graph File');
INSERT INTO info_type (hid, id, name, label) VALUES ('24', '6270AB49-D6B6-4D8C-B15A-89657B4227A4', 'PlainText', 'Plain Text');
INSERT INTO info_type (hid, id, name, label) VALUES ('25', '15696BC7-F712-43F3-9910-150B53272841', 'StructuredText', 'Structured Text');
INSERT INTO info_type (hid, id, name, label) VALUES ('26', 'D106C3F9-93B5-4146-AAF0-727A0E8D8A50', 'Image', 'Image');

-- Update the columns in the data object table.
ALTER TABLE dataobjects DROP COLUMN "type";
ALTER TABLE dataobjects ADD COLUMN info_type BIGINT;
ALTER TABLE dataobjects ADD FOREIGN KEY (info_type) REFERENCES info_type (hid);
ALTER TABLE dataobjects ADD COLUMN data_format BIGINT;
ALTER TABLE dataobjects ADD FOREIGN KEY (data_format) REFERENCES data_format (hid);
ALTER TABLE dataobjects ADD COLUMN description VARCHAR(255);

-- Update all existing data objects.
UPDATE dataobjects SET info_type = '3' WHERE hid = '1';
UPDATE dataobjects SET info_type = '3' WHERE hid = '2';
UPDATE dataobjects SET info_type = '3' WHERE hid = '3';
UPDATE dataobjects SET info_type = '3' WHERE hid = '4';
UPDATE dataobjects SET info_type = '3' WHERE hid = '5';
UPDATE dataobjects SET info_type = '3' WHERE hid = '6';
UPDATE dataobjects SET info_type = '6' WHERE hid = '7';
UPDATE dataobjects SET info_type = '3' WHERE hid = '8';
UPDATE dataobjects SET info_type = '3' WHERE hid = '9';
UPDATE dataobjects SET info_type = '3' WHERE hid = '10';
UPDATE dataobjects SET info_type = '6' WHERE hid = '11';
UPDATE dataobjects SET info_type = '3' WHERE hid = '12';
UPDATE dataobjects SET info_type = '3' WHERE hid = '13';
UPDATE dataobjects SET info_type = '3' WHERE hid = '14';
UPDATE dataobjects SET info_type = '3' WHERE hid = '15';
UPDATE dataobjects SET info_type = '3' WHERE hid = '16';
UPDATE dataobjects SET info_type = '3' WHERE hid = '17';
UPDATE dataobjects SET info_type = '3' WHERE hid = '18';
UPDATE dataobjects SET info_type = '3' WHERE hid = '19';
UPDATE dataobjects SET info_type = '3' WHERE hid = '20';
UPDATE dataobjects SET info_type = '7' WHERE hid = '21';
UPDATE dataobjects SET info_type = '3' WHERE hid = '22';
UPDATE dataobjects SET info_type = '3' WHERE hid = '23';
UPDATE dataobjects SET info_type = '7' WHERE hid = '24';
UPDATE dataobjects SET info_type = '3' WHERE hid = '25';
UPDATE dataobjects SET info_type = '3' WHERE hid = '26';
UPDATE dataobjects SET info_type = '7' WHERE hid = '27';
UPDATE dataobjects SET info_type = '3' WHERE hid = '28';
UPDATE dataobjects SET info_type = '3' WHERE hid = '29';
UPDATE dataobjects SET info_type = '3' WHERE hid = '30';
UPDATE dataobjects SET info_type = '7' WHERE hid = '31';
UPDATE dataobjects SET info_type = '3' WHERE hid = '32';
UPDATE dataobjects SET info_type = '3' WHERE hid = '33';
UPDATE dataobjects SET info_type = '8' WHERE hid = '34';
UPDATE dataobjects SET info_type = '5' WHERE hid = '35';
UPDATE dataobjects SET info_type = '3' WHERE hid = '36';
UPDATE dataobjects SET info_type = '3' WHERE hid = '37';
UPDATE dataobjects SET info_type = '3' WHERE hid = '38';
UPDATE dataobjects SET info_type = '3' WHERE hid = '39';
UPDATE dataobjects SET info_type = '3' WHERE hid = '40';
UPDATE dataobjects SET info_type = '2' WHERE hid = '41';
UPDATE dataobjects SET info_type = '4' WHERE hid = '42';
UPDATE dataobjects SET info_type = '3' WHERE hid = '43';
UPDATE dataobjects SET info_type = '3' WHERE hid = '44';
UPDATE dataobjects SET info_type = '1' WHERE hid = '45';
UPDATE dataobjects SET info_type = '4' WHERE hid = '46';
UPDATE dataobjects SET info_type = '3' WHERE hid = '47';
UPDATE dataobjects SET info_type = '3' WHERE hid = '48';
UPDATE dataobjects SET info_type = '3' WHERE hid = '49';
UPDATE dataobjects SET info_type = '3' WHERE hid = '50';
UPDATE dataobjects SET info_type = '3' WHERE hid = '51';
UPDATE dataobjects SET info_type = '1' WHERE hid = '52';
UPDATE dataobjects SET info_type = '4' WHERE hid = '53';
UPDATE dataobjects SET info_type = '3' WHERE hid = '54';
UPDATE dataobjects SET info_type = '3' WHERE hid = '55';
UPDATE dataobjects SET info_type = '3' WHERE hid = '56';
UPDATE dataobjects SET info_type = '3' WHERE hid = '57';
UPDATE dataobjects SET info_type = '3' WHERE hid = '58';
UPDATE dataobjects SET info_type = '3' WHERE hid = '59';
UPDATE dataobjects SET info_type = '3' WHERE hid = '60';
UPDATE dataobjects SET info_type = '3' WHERE hid = '61';
UPDATE dataobjects SET info_type = '3' WHERE hid = '62';
UPDATE dataobjects SET info_type = '3' WHERE hid = '63';
UPDATE dataobjects SET info_type = '3' WHERE hid = '64';
UPDATE dataobjects SET info_type = '3' WHERE hid = '65';
UPDATE dataobjects SET info_type = '3' WHERE hid = '66';
UPDATE dataobjects SET info_type = '3' WHERE hid = '67';
UPDATE dataobjects SET info_type = '3' WHERE hid = '68';
UPDATE dataobjects SET info_type = '3' WHERE hid = '69';
UPDATE dataobjects SET info_type = '3' WHERE hid = '70';
UPDATE dataobjects SET info_type = '3' WHERE hid = '71';
UPDATE dataobjects SET info_type = '3' WHERE hid = '72';
UPDATE dataobjects SET info_type = '3' WHERE hid = '73';

-- Create the list of known data formats.
INSERT INTO data_format (hid, id, name, label) VALUES ('1', 'E806880B-383D-4AD6-A4AB-8CDD88810A33', 'Unspecified', 'Unspecified Data Format');
INSERT INTO data_format (hid, id, name, label) VALUES ('2', '9E2F6F6B-8C7C-42A6-B6FF-2CCA8DFFF342', 'ASN-0', 'Genbank ASN1');
INSERT INTO data_format (hid, id, name, label) VALUES ('3', '6C4D09B3-0108-4DD3-857A-8225E0645A0A', 'Barcode-0', 'FASTX toolkit barcode file');
INSERT INTO data_format (hid, id, name, label) VALUES ('4', 'AB391836-9A4D-4EE3-89BA-9DA9CDD28255', 'CSV-0', 'Comma-separated values');
INSERT INTO data_format (hid, id, name, label) VALUES ('5', 'EBF3B544-FC03-4FDF-8C02-49CEF60B0FD6', 'EMBL-0', 'EMBL multiple sequence alignment');
INSERT INTO data_format (hid, id, name, label) VALUES ('6', 'FA6554CF-38C0-4F6E-993C-1BB080C637FA', 'FAI-0', 'Samtools Fasta Index (FAI)');
INSERT INTO data_format (hid, id, name, label) VALUES ('7', '18FDAE69-750C-421E-B43B-5724455DAC8B', 'FASTA-0', 'FASTA');
INSERT INTO data_format (hid, id, name, label) VALUES ('8', '6FEDEA87-6E73-490A-A4E3-3A337085402C', 'FASTQ-0', 'FASTQ (Sanger)');
INSERT INTO data_format (hid, id, name, label) VALUES ('9', 'B0754D3F-417B-49B3-AE2B-75339C4C392A', 'FASTQ-Illumina-0', 'FASTQ (Illumina 1.3+)');
INSERT INTO data_format (hid, id, name, label) VALUES ('10', '06DB90D6-422A-4DF3-8DA5-ADB75BC58B65', 'FASTQ-Int-0', 'FASTQ-Integer sequence file');
INSERT INTO data_format (hid, id, name, label) VALUES ('11', 'FADDC788-FB75-434D-9820-721292ADF3B6', 'FASTQ-Solexa-0', 'FASTQ (Solexa)');
INSERT INTO data_format (hid, id, name, label) VALUES ('12', '6DDD55C6-21C7-4E0A-B0FF-2AC1E24E9762', 'Genbank-0', 'Genbank');
INSERT INTO data_format (hid, id, name, label) VALUES ('13', '15F121D1-7885-46F4-B2A9-32AF7EF5DDAA', 'PDB-3.2', 'Protein Data Bank (PDB)');
INSERT INTO data_format (hid, id, name, label) VALUES ('14', 'A84DA1B1-D515-44B8-8B01-AFDD660E0B77', 'Pileup-0', 'Pileup');
INSERT INTO data_format (hid, id, name, label) VALUES ('15', 'F3A3E9EB-E46F-49CC-A61C-24DB6EE964C4', 'SAI-0.1.2', 'SAM index');
INSERT INTO data_format (hid, id, name, label) VALUES ('16', '13CC9A49-E3E9-4B36-9436-782323F686E0', 'SAM-0.1.2', 'SAM');
INSERT INTO data_format (hid, id, name, label) VALUES ('17', '8068B37A-0921-4F34-9272-E5FC93D8F64B', 'SBML-1.2', 'Systems Biology Markup Language (Level 1, Version 2)');
INSERT INTO data_format (hid, id, name, label) VALUES ('18', '8BC057EA-C33D-476F-82F4-61C960BEE223', 'SBML-2.4.1', 'Systems Biology Markup Language (Level 2, Version 4, Release 1)');
INSERT INTO data_format (hid, id, name, label) VALUES ('19', 'E79FD13B-B82E-431D-83B6-95B3DC16DCBE', 'SBML-3.1', 'Systems Biology Markup Language (Level 3, Version 1 Core)');
INSERT INTO data_format (hid, id, name, label) VALUES ('20', '1810A7AF-094F-4470-8677-42E217CCEF4E', 'TAB-0', 'Tab-delimited text');
INSERT INTO data_format (hid, id, name, label) VALUES ('21', '158E6939-61E2-4297-8049-42AD77B32E51', 'Text-0', 'Plain text');
INSERT INTO data_format (hid, id, name, label) VALUES ('22', '6F7EEEC5-CEE5-4562-8515-2795C2399328', 'VCF-3.3', 'Variant call format (VCF)');
INSERT INTO data_format (hid, id, name, label) VALUES ('23', '70E56C3C-50EB-41A7-A98C-165A9CD55EE7', 'VCF-4.0', 'Variant call format (VCF)');
INSERT INTO data_format (hid, id, name, label) VALUES ('24', 'FA730BA6-F6FA-479E-ABF4-E56F4D37D4E7', 'WIG-0', 'UCSC Wiggle');

-- Associate all existing data objects with the unspecified format.
UPDATE dataobjects set data_format = 1;

-- Update the Analysis name for Phylogenetic Independent Contrasts which was Independent Contrasts (CORE-1663: alenards)
UPDATE transformation_activity SET "name" = 'Phylogenetic Independent Contrasts' WHERE hid=8;

-- Update the tool name PHYLIP to Contrast (CORE-1663: alenards)
UPDATE template_group SET "description" = 'Contrast - part of PHYLIP', "name" = 'Contrast' WHERE hid=3;

-- Add the ability to logically delete analyses.
ALTER TABLE transformation_activity ADD COLUMN deleted BOOLEAN;
UPDATE transformation_activity SET deleted = FALSE;

-- Add a table to perserve desired DataElements (aka DataObjects) used for Tool Integration
-- 2011/05/11 (alenards)
CREATE TABLE DataElementPreservation (
       hid BIGINT,
       templateUUID VARCHAR(200),
       infoTypeName VARCHAR(200),
       fileFormatName VARCHAR(200),
       dateCreated VARCHAR(65),
       PRIMARY KEY(hid)
);

-- Add a table to capture raw JSON as it is imported via the `import-workflow` service
CREATE TABLE ImportedWorkflow (
       hid BIGINT,
       importJson TEXT, 
       analysisUUID VARCHAR(400),
       dateCreated VARCHAR(65),
       PRIMARY KEY(hid)
);

-- Temporarily remove `Phylogenetic Independent Contrasts`, `CACE`, and `DACE` (CORE-1675: alenards)
-- Removes references to the template_group records
DELETE FROM template_group_group WHERE parent_group_id = 2 AND subgroup_id = 3 AND hid = 0;
DELETE FROM template_group_group WHERE parent_group_id = 2 AND subgroup_id = 4 AND hid = 1;
DELETE FROM template_group_template WHERE template_group_id = 3 AND template_id = 8 AND hid = 0;
DELETE FROM template_group_template WHERE template_group_id = 4 AND template_id = 11 AND hid = 0;
DELETE FROM template_group_template WHERE template_group_id = 4 AND template_id = 10 AND hid = 1;
-- This removes the actual grouping record
DELETE FROM template_group WHERE hid = 3;
DELETE FROM template_group WHERE hid = 4;

-- To revert these changes remove the above DELETE statements and re-fresh your local database, or use the INSERT statements below

--INSERT INTO template_group(hid, id, name, description, workspace_id) VALUES (3, 'g12c7a5852e933352e31302e3231fa5e9ef573b34a19', 'PHYLIP', '', 0);
--INSERT INTO template_group(hid, id, name, description, workspace_id) VALUES (4, 'g12c7a5853e533352e31302e32315ae67c3c0b3003', 'ACE', 'Ancestral Character Estimation', 0);
--INSERT INTO template_group_group(parent_group_id, subgroup_id, hid) VALUES (2, 3, 0);
--INSERT INTO template_group_group(parent_group_id, subgroup_id, hid) VALUES (2, 4, 1);
--INSERT INTO template_group_template(template_group_id, template_id, hid) VALUES (3, 8, 0);
--INSERT INTO template_group_template(template_group_id, template_id, hid) VALUES (4, 11, 0);
--INSERT INTO template_group_template(template_group_id, template_id, hid) VALUES (4, 10, 1);

-- ####### End CORE-1675 #####################################################################

-- Add descriptions to some property types.
UPDATE property_type SET description = 'A text box that checks for valid number input' WHERE hid = 1;
UPDATE property_type SET description = 'A checkbox for yes/no selection' WHERE hid = 5;
UPDATE property_type SET description = 'Informative static text' WHERE hid = 6;
UPDATE property_type SET description = 'A list for selecting a choice (can be text)' WHERE hid = 8;
UPDATE property_type SET description = 'A list for selecting a value (numeric range)' WHERE hid = 9;
UPDATE property_type SET description = 'A text box that will add quotes for passing string to command line' WHERE hid = 10;
UPDATE property_type SET description = 'A text field with caption (x=user specified text)' WHERE hid = 11;
UPDATE property_type SET description = 'A text box (no caption or number check)' WHERE hid = 12;

-- Deprecate some property types.
ALTER TABLE property_type ADD COLUMN deprecated BOOLEAN DEFAULT FALSE;
UPDATE property_type SET deprecated = TRUE WHERE hid = 2;
UPDATE property_type SET deprecated = TRUE WHERE hid = 3;
UPDATE property_type SET deprecated = TRUE WHERE hid = 4;
UPDATE property_type SET deprecated = TRUE WHERE hid = 6;
UPDATE property_type SET deprecated = TRUE WHERE hid = 13;
UPDATE property_type SET deprecated = TRUE WHERE hid = 14;

-- Impose an order upon property types.
ALTER TABLE property_type ADD COLUMN display_order INTEGER DEFAULT 999;
UPDATE property_type SET display_order = 1 WHERE hid = 12;
UPDATE property_type SET display_order = 2 WHERE hid = 1;
UPDATE property_type SET display_order = 3 WHERE hid = 10;
UPDATE property_type SET display_order = 4 WHERE hid = 11;
UPDATE property_type SET display_order = 5 WHERE hid = 5;
UPDATE property_type SET display_order = 6 WHERE hid = 8;
UPDATE property_type SET display_order = 7 WHERE hid = 9;
UPDATE property_type SET display_order = 8 WHERE hid = 6;

-- Add descriptions to some rule types.
UPDATE rule_type SET description = 'Needs to be less than another associated parameter' WHERE hid = 1;
UPDATE rule_type SET description = 'Has a lower limit (integer)' WHERE hid = 2;
UPDATE rule_type SET description = 'Has a range of integers allowed' WHERE hid = 3;
UPDATE rule_type SET description = 'Needs to be greater than another associated parameter' WHERE hid = 4;
UPDATE rule_type SET description = 'Must contain certain terms' WHERE hid = 5;
UPDATE rule_type SET description = 'Has a range of values allowed (non-integer)' WHERE hid = 6;

-- Add a new rule type.
INSERT INTO rule_type (hid, id, name, description) VALUES ('7', 'rtaebaaff6-3280-442d-b45e-6fd65e2d2c80', 'IntBelow', 'Has a higher limit (integer)');

-- Deprecate some rule types.
ALTER TABLE rule_type ADD COLUMN deprecated BOOLEAN DEFAULT FALSE;
UPDATE rule_type SET deprecated = TRUE WHERE hid = 1;
UPDATE rule_type SET deprecated = TRUE WHERE hid = 4;

-- Impose an order upon rule types.
ALTER TABLE rule_type ADD COLUMN display_order INTEGER DEFAULT 999;
UPDATE rule_type SET display_order = 1 WHERE hid = 2;
UPDATE rule_type SET display_order = 2 WHERE hid = 7;
UPDATE rule_type SET display_order = 3 WHERE hid = 3;
UPDATE rule_type SET display_order = 4 WHERE hid = 6;
UPDATE rule_type SET display_order = 5 WHERE hid = 1;
UPDATE rule_type SET display_order = 6 WHERE hid = 4;
UPDATE rule_type SET display_order = 7 WHERE hid = 5;

-- Add rule description formats to some rule types.
ALTER TABLE rule_type ADD COLUMN rule_description_format VARCHAR(255) DEFAULT '';
UPDATE rule_type SET rule_description_format = 'Value must be between: {Number} and {Number}.' WHERE hid = 3;
UPDATE rule_type SET rule_description_format = 'Value must be above: {Number}.' WHERE hid = 2;
UPDATE rule_type SET rule_description_format = 'Value must be below: {Number}.' WHERE hid = 7;
UPDATE rule_type SET rule_description_format = 'Value must be above: {FieldRef}.' WHERE hid = 4;
UPDATE rule_type SET rule_description_format = 'Value must be below: {FieldRef}.' WHERE hid = 1;
UPDATE rule_type SET rule_description_format = 'Value must contain: {List}.' WHERE hid = 5;
UPDATE rule_type SET rule_description_format = 'Value must be between: {Number} and {Number}.' WHERE hid = 6;

-- Add a table to store rule subtypes.
CREATE TABLE rule_subtype (
	hid BIGINT NOT NULL,
	id VARCHAR(40) NOT NULL,
	name VARCHAR(40) NOT NULL,
	description VARCHAR(255) NOT NULL,
	PRIMARY KEY(hid)
);

-- Add the known rule subtypes.
INSERT INTO rule_subtype (hid, id, name, description) VALUES ('1', 'B85DE8E1-7DDD-4F65-AD94-E896B74DC133', 'Integer', 'A whole number');
INSERT INTO rule_subtype (hid, id, name, description) VALUES ('2', 'CE7C5AD2-5FCA-4611-843F-791EEE1F6E87', 'Double', 'A real number');
INSERT INTO rule_subtype (hid, id, name, description) VALUES ('3', '6BF5E9DB-86CB-4E6A-A579-0F3819E4FD68', 'String', 'Arbitrary text');

-- Associate rule types with rule subtypes.
ALTER TABLE rule_type ADD COLUMN rule_subtype_id BIGINT;
UPDATE rule_type SET rule_subtype_id = 1 WHERE hid = 1;
UPDATE rule_type SET rule_subtype_id = 1 WHERE hid = 2;
UPDATE rule_type SET rule_subtype_id = 1 WHERE hid = 3;
UPDATE rule_type SET rule_subtype_id = 1 WHERE hid = 4;
UPDATE rule_type SET rule_subtype_id = 1 WHERE hid = 5;
UPDATE rule_type SET rule_subtype_id = 2 WHERE hid = 6;
UPDATE rule_type SET rule_subtype_id = 1 WHERE hid = 7;

-- Add a table to store value types associated with various property types.
CREATE TABLE value_type (
    hid BIGINT NOT NULL,
    id VARCHAR(40) NOT NULL,
    name VARCHAR(40) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY(hid)
);

-- Add the known value types.
INSERT INTO value_type (hid, id, name, description) VALUES ('1', '0115898A-F81A-4598-B1A8-06E538F1D774', 'String', 'Arbitrary text');
INSERT INTO value_type (hid, id, name, description) VALUES ('2', 'E8E05E6C-5002-48C0-9167-C9733F0A9716', 'Boolean', 'True or false value');
INSERT INTO value_type (hid, id, name, description) VALUES ('3', 'BCB81292-F01D-45B1-8598-3D6CD745D2E9', 'Number', 'Numeric value');

-- Associate property types with value types.
ALTER TABLE property_type ADD COLUMN value_type_id BIGINT;
UPDATE property_type SET value_type_id = 1 WHERE hid = 12;
UPDATE property_type SET value_type_id = 3 WHERE hid = 1;
UPDATE property_type SET value_type_id = 1 WHERE hid = 10;
UPDATE property_type SET value_type_id = 3 WHERE hid = 11;
UPDATE property_type SET value_type_id = 2 WHERE hid = 5;
UPDATE property_type SET value_type_id = 1 WHERE hid = 8;
UPDATE property_type SET value_type_id = 3 WHERE hid = 9;
UPDATE property_type SET value_type_id = 1 WHERE hid = 6;

-- Associate rule types with value types.
CREATE TABLE rule_type_value_type (
    rule_type_id BIGINT NOT NULL REFERENCES rule_type(hid),
    value_type_id BIGINT NOT NULL REFERENCES value_type(hid)
);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (2, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (7, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (3, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (6, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (1, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (4, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (5, 1);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (5, 3);

-- Deprecate some information types.
ALTER TABLE info_type ADD COLUMN deprecated BOOLEAN DEFAULT FALSE;
UPDATE info_type SET deprecated = TRUE WHERE hid = 1;
UPDATE info_type SET deprecated = TRUE WHERE hid = 2;
UPDATE info_type SET deprecated = TRUE WHERE hid = 5;

-- Impose a display order on information types.
ALTER TABLE info_type ADD COLUMN display_order INTEGER DEFAULT 999;
UPDATE info_type SET display_order = 1 WHERE hid = 3;

-- Impose a display order on data formats.
ALTER TABLE data_format ADD COLUMN display_order INTEGER DEFAULT 999;
UPDATE data_format SET display_order = 1 WHERE hid = 1;

-- Add more rule types
INSERT INTO rule_type (hid, id, name, description, display_order, rule_description_format, rule_subtype_id) VALUES ('8', '87087b30-e7af-4b04-b08f-49baf5570466', 'DoubleAbove', 'Has a lower limit (double)', 8, 'Value must be above {Number}.', 2);
INSERT INTO rule_type (hid, id, name, description, display_order, rule_description_format, rule_subtype_id) VALUES ('9', '716a791b-47f3-4a53-9585-ed2f731a47f8', 'DoubleBelow', 'Has a higher limit (double)', 9, 'Value must be below {Number}.', 2);
INSERT INTO rule_type (hid, id, name, description, display_order, rule_description_format, rule_subtype_id) VALUES ('10', '4b4ee99b-2cf2-4ff8-8474-73fc6a1effa7', 'Regex', 'Matches a regular expression', 10, 'Value must match regular expression {String}', 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (8, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (9, 3);
INSERT INTO rule_type_value_type (rule_type_id, value_type_id) VALUES (10, 1);

-- Add a "required" field to dataobjects.
ALTER TABLE dataobjects ADD COLUMN required BOOLEAN DEFAULT TRUE;

-- Move IntRange and DoubleRange to the top
UPDATE rule_type SET display_order=1 WHERE id='rte04fb2c6-d5fd-47e4-ae89-a67390ccb67e';
UPDATE rule_type SET display_order=3 WHERE id='rt2c3eec11-011a-4152-b27b-00d73deab7cf';
UPDATE rule_type SET display_order=2 WHERE id='rt58cd8b75-5598-4490-a9c9-a6d7a8cd09dd';
UPDATE rule_type SET display_order=4 WHERE id='rtaebaaff6-3280-442d-b45e-6fd65e2d2c80';

-- Set displayOrder values that haven't been set yet
UPDATE rule_type SET display_order=8 WHERE id='87087b30-e7af-4b04-b08f-49baf5570466';
UPDATE rule_type SET display_order=9 WHERE id='716a791b-47f3-4a53-9585-ed2f731a47f8';
UPDATE rule_type SET display_order=10 WHERE id='4b4ee99b-2cf2-4ff8-8474-73fc6a1effa7';

-- move from metadata-2-0.sql and translated from INSERT to UPDATE statements (alenards)

-- these update statements originally appeared in commit 
-- 273953be74bd0bf06e911ffb85341e970fb176c4 which had to be reverted because it 
-- violates the incremental-versioned scripts approach used to maintain the 
-- schema.

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/TopHat.html'
WHERE id='ad4fbbe44ff06445445882d8d2132a1e148ef4';

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/Burrows-Wheeler_Aligner__analysis_.html'
WHERE id='adb0cc4e638184808b1f24212ca2e806f';

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/Burrows-Wheeler_Aligner__analysis_.html'
WHERE id='a7c0b6f5ee44b409a8498c37383dbbef1';

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/TopHat.html '
WHERE id='aea24bd53fa4e430e93fd2b7f10f6453d';

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/Cufflinks_Transcript_Quantification.html'
WHERE id='a5beb7172c6984e72aea36a0ab26c64830';

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/FASTX_Trimmer__all_versions_.html'
WHERE id='a65fa62bcebc0418cbb947485a63b30cd';

UPDATE transformation_activity SET 
 description='help/user_manual/lessons/FASTX_Barcode_Splitter__all_versions_.html'
WHERE id='adc2cec84781645899a6ccd4d025b0443';

UPDATE transformation_activity SET
 description='help/user_manual/lessons/FASTQ_Quality_Rescaler.html'
WHERE id='af8ac873952e549e4869f862d59e98e48';

UPDATE transformation_activity SET
 description='help/user_manual/lessons/FASTX_Clipper__all_versions_.html'
WHERE id='ad042f00f8cf24143a9ce71820d691b2a';

UPDATE transformation_activity SET
 description='help/user_manual/lessons/FASTX_Quality_Filter__all_versions_.html'
WHERE id='a4ce6a7961e1f4aafabfce922fd00810f';
