BEGIN;

SET search_path = public, pg_catalog;

-- data_formats
INSERT INTO data_formats (id, name, label, display_order) VALUES
    ('9E2F6F6B-8C7C-42A6-B6FF-2CCA8DFFF342', 'ASN-0', 'Genbank ASN1', '999'),
    ('6C4D09B3-0108-4DD3-857A-8225E0645A0A', 'Barcode-0', 'FASTX toolkit barcode file', '999'),
    ('AB391836-9A4D-4EE3-89BA-9DA9CDD28255', 'CSV-0', 'Comma-separated values', '999'),
    ('EBF3B544-FC03-4FDF-8C02-49CEF60B0FD6', 'EMBL-0', 'EMBL multiple sequence alignment', '999'),
    ('FA6554CF-38C0-4F6E-993C-1BB080C637FA', 'FAI-0', 'Samtools Fasta Index (FAI)', '999'),
    ('18FDAE69-750C-421E-B43B-5724455DAC8B', 'FASTA-0', 'FASTA', '999'),
    ('6FEDEA87-6E73-490A-A4E3-3A337085402C', 'FASTQ-0', 'FASTQ (Sanger)', '999'),
    ('B0754D3F-417B-49B3-AE2B-75339C4C392A', 'FASTQ-Illumina-0', 'FASTQ (Illumina 1.3+)', '999'),
    ('06DB90D6-422A-4DF3-8DA5-ADB75BC58B65', 'FASTQ-Int-0', 'FASTQ-Integer sequence file', '999'),
    ('FADDC788-FB75-434D-9820-721292ADF3B6', 'FASTQ-Solexa-0', 'FASTQ (Solexa)', '999'),
    ('6DDD55C6-21C7-4E0A-B0FF-2AC1E24E9762', 'Genbank-0', 'Genbank', '999'),
    ('15F121D1-7885-46F4-B2A9-32AF7EF5DDAA', 'PDB-3.2', 'Protein Data Bank (PDB)', '999'),
    ('A84DA1B1-D515-44B8-8B01-AFDD660E0B77', 'Pileup-0', 'Pileup', '999'),
    ('F3A3E9EB-E46F-49CC-A61C-24DB6EE964C4', 'SAI-0.1.2', 'SAM index', '999'),
    ('13CC9A49-E3E9-4B36-9436-782323F686E0', 'SAM-0.1.2', 'SAM', '999'),
    ('8068B37A-0921-4F34-9272-E5FC93D8F64B', 'SBML-1.2',
     'Systems Biology Markup Language (Level 1, Version 2)', '999'),
    ('8BC057EA-C33D-476F-82F4-61C960BEE223', 'SBML-2.4.1',
     'Systems Biology Markup Language (Level 2, Version 4, Release 1)', '999'),
    ('E79FD13B-B82E-431D-83B6-95B3DC16DCBE', 'SBML-3.1',
     'Systems Biology Markup Language (Level 3, Version 1 Core)', '999'),
    ('1810A7AF-094F-4470-8677-42E217CCEF4E', 'TAB-0', 'Tab-delimited text', '999'),
    ('158E6939-61E2-4297-8049-42AD77B32E51', 'Text-0', 'Plain text', '999'),
    ('6F7EEEC5-CEE5-4562-8515-2795C2399328', 'VCF-3.3', 'Variant call format (VCF)', '999'),
    ('70E56C3C-50EB-41A7-A98C-165A9CD55EE7', 'VCF-4.0', 'Variant call format (VCF)', '999'),
    ('FA730BA6-F6FA-479E-ABF4-E56F4D37D4E7', 'WIG-0', 'UCSC Wiggle', '999'),
    ('E806880B-383D-4AD6-A4AB-8CDD88810A33', 'Unspecified', 'Unspecified Data Format', '1')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, label=EXCLUDED.label, display_order=EXCLUDED.display_order;


-- info_type

INSERT INTO info_type (id, name, label, description, deprecated, display_order) VALUES
    ('212907C0-736E-4DBE-B6E7-5DC0431C275F', 'ReconcileTaxa',
         'Reconciled Taxonomy Information', NULL, FALSE, '999'),
    ('0E3343E3-C59A-44C4-B5EE-D4501EC3A898', 'ReferenceGenome',
         'Reference Sequence and Annotations', NULL, FALSE, '999'),
    ('57EB7FB6-BDC0-42AA-B494-0483F9347815', 'ReferenceSequence',
         'Reference Sequence Only', NULL, FALSE, '999'),
    ('68246DDF-8B1B-44C0-827F-88945CAD8227', 'ReferenceAnnotation',
         'Reference Annotation Only', NULL, FALSE, '999'),
    ('97D8CCF7-7242-4038-942C-235F2291AB6C', 'ACEField',
         'Reconciled Tree and Trait Information for CACE and DACE', NULL,
         TRUE, '999'),
    ('CA9ADDE4-AB94-4A40-8C2F-C0B814156298', 'ContrastField',
         'Reconciled Tree and Trait Informaiton for Independent Contrast',
         NULL, TRUE, '999'),
    ('E819FF9A-7398-4DF9-8191-0F5AFBBE5CA3', 'ReferenceDummyGenes',
         'Fake Reference Genome for the Cufflinks Post-Processing Step',
         NULL, TRUE, '999'),
    ('0900E992-3BBD-4F4B-8D2D-ED289CA4E4F1', 'File', 'Unspecified',
         NULL, FALSE, '1'),
    ('762E5A0A-AFB2-420E-8456-F79C78A29051', 'SequenceAlignment',
         'Sequence Alignment', NULL, FALSE, '999'),
    ('F65A8F23-3E46-4DF4-80F9-387641C013A6',
         'MultipleSequenceAlignment', 'Multiple Sequence Alignment', NULL,
         FALSE, '999'),
    ('4A56F043-C62F-4FE9-A11F-A9A7D18E370F', 'BarcodeFile',
         'Barcode File', NULL, FALSE, '999'),
    ('DD178256-CE77-41B0-A785-7E955799A20D', 'ExpressionData',
         'Expression Data', NULL, FALSE, '999'),
    ('13313A72-EA0A-49DF-9105-AF798165A482', 'GenomicAnnotation',
         'Genomic Annotation', NULL, FALSE, '999'),
    ('D4089473-139E-4345-9CA9-ADDCFC4B887E', 'BiologicalModel',
         'Biological Model', NULL, FALSE, '999'),
    ('1C59C759-9CD3-4036-B7B4-82E8DA40D0C2',
         'NucleotideOrPeptideSequence', 'Nucleotide or Peptide Sequence',
         NULL, FALSE, '999'),
    ('3B4FC426-290A-4F63-ADB4-75A60A43B420', 'Structure',
         'Structure', NULL, FALSE, '999'),
    ('A378CA30-28C9-4179-8381-EC098A89D12B', 'TraitFile',
         'Trait File', NULL, FALSE, '999'),
    ('7BDA7EF9-7B25-43DA-93D3-A6C483FD24E4', 'TreeFile',
         'Tree File', NULL, FALSE, '999'),
    ('F1A9CE39-B83D-4820-909E-583F76BC5EBE', 'VariantData',
         'Variant Data', NULL, FALSE, '999'),
    ('F51BAAE3-4368-4814-BCA0-78BAD9906445', 'Archive', 'Archive',
         NULL, FALSE, '999'),
    ('57BD5BA7-C899-4D50-8676-A3CD56E68F8A', 'Binary', 'Binary',
         NULL, FALSE, '999'),
    ('3B07F544-86A6-459E-B46A-BA53E6A37F33', 'TabularData',
         'Tabular Data', NULL, FALSE, '999'),
    ('D433BEE7-BFDE-4696-A2B8-EB2B92AC0E13', 'GraphFile',
         'Graph File', NULL, FALSE, '999'),
    ('6270AB49-D6B6-4D8C-B15A-89657B4227A4', 'PlainText',
         'Plain Text', NULL, FALSE, '999'),
    ('15696BC7-F712-43F3-9910-150B53272841', 'StructuredText',
         'Structured Text', NULL, FALSE, '999'),
    ('D106C3F9-93B5-4146-AAF0-727A0E8D8A50', 'Image', 'Image', NULL,
         FALSE, '999')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, label=EXCLUDED.label, description=EXCLUDED.description, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order;

-- value_type

INSERT INTO value_type (id, name, description) VALUES
    ('0115898A-F81A-4598-B1A8-06E538F1D774', 'String',
           'Arbitrary text'),
    ('E8E05E6C-5002-48C0-9167-C9733F0A9716', 'Boolean',
           'True or false value'),
    ('BCB81292-F01D-45B1-8598-3D6CD745D2E9', 'Number',
           'Numeric value'),
    ('94FE4F2B-42F9-4EE7-BC28-F64CC8DAF691', 'Input',
           'Input file or folder'),
    ('65E1E927-A1ED-4E25-BC0C-74C155215973', 'Output',
           'Output file or folder'),
    ('96DE7B1E-FE29-468F-85C0-A9458CE66FB1', 'EnvironmentVariable',
           'An environment variable that is set before running a job')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description;

-- rule_subtype

INSERT INTO rule_subtype (id, name, description) VALUES
    ('B85DE8E1-7DDD-4F65-AD94-E896B74DC133', 'Integer', 'A whole number'),
    ('CE7C5AD2-5FCA-4611-843F-791EEE1F6E87', 'Double', 'A real number'),
    ('6BF5E9DB-86CB-4E6A-A579-0F3819E4FD68', 'String', 'Arbitrary text')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description;

-- rule_type

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '07303d4b-3635-4934-93e6-b24de4f2725b', 'IntBelowField',
           'Needs to be less than another associated parameter', NULL, TRUE, '5',
           'Value must be below: {FieldRef}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Integer'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '2c3eec11-011a-4152-b27b-00d73deab7cf', 'IntAbove',
           'Has a lower limit (integer)', NULL, FALSE, '3',
           'Value must be above: {Number}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Integer'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT 'e04fb2c6-d5fd-47e4-ae89-a67390ccb67e', 'IntRange',
           'Has a range of integers allowed', NULL, FALSE, '1',
           'Value must be between: {Number} and {Number}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Integer'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT 'e1afc242-8962-4f0c-95be-5a6363cdd48b', 'IntAboveField',
           'Needs to be greater than another associated parameter', NULL, TRUE, '6',
           'Value must be above: {FieldRef}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Integer'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '0621f097-1b31-4457-812b-c8ca70bfbe14', 'MustContain',
           'Must contain certain terms', NULL, TRUE, '7',
           'Value must contain: {List}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Integer'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '58cd8b75-5598-4490-a9c9-a6d7a8cd09dd', 'DoubleRange',
           'Has a range of values allowed (non-integer)', NULL, FALSE, '2',
           'Value must be between: {Number} and {Number}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Double'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT 'aebaaff6-3280-442d-b45e-6fd65e2d2c80', 'IntBelow',
           'Has a higher limit (integer)', NULL, FALSE, '4',
           'Value must be below: {Number}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Integer'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '87087b30-e7af-4b04-b08f-49baf5570466', 'DoubleAbove',
           'Has a lower limit (double)', NULL, FALSE, '8',
           'Value must be above {Number}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Double'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '716a791b-47f3-4a53-9585-ed2f731a47f8', 'DoubleBelow',
           'Has a higher limit (double)', NULL, FALSE, '9',
           'Value must be below {Number}.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'Double'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '4b4ee99b-2cf2-4ff8-8474-73fc6a1effa7', 'Regex',
           'Matches a regular expression', NULL, FALSE, '10',
           'Value must match regular expression {String}', rs.id
    FROM rule_subtype rs WHERE rs.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

INSERT INTO rule_type
    (id, name, description, label, deprecated, display_order,
     rule_description_format, rule_subtype_id)
    SELECT '2D531048-A876-4B5D-8D21-54074910C721', 'CharacterLimit',
           'Value must contain at most a maximum number of characters', '', FALSE, '11',
           'Value must contain at most {Number} characters.', rs.id
    FROM rule_subtype rs WHERE rs.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, display_order=EXCLUDED.display_order, rule_description_format=EXCLUDED.rule_description_format, rule_subtype_id=EXCLUDED.rule_subtype_id;

-- parameter_types

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id) VALUES
    ('2cf37b0d-5463-4aef-98a2-4db63d2f3dbc', 'ClipperSelector', '',
            NULL, TRUE, FALSE, '999', NULL),
    ('bea4f078-6296-4511-834a-27b6bc3c88ab', 'Script', '', NULL,
            TRUE, FALSE, '999', NULL),
    ('9935e153-5765-4c2e-a2bc-676f88b11267', 'Mode', '', NULL, TRUE,
            FALSE, '999', NULL),
    ('553f6a79-329e-470b-b827-ebbf2d2811f1', 'BarcodeSelector',
            '', NULL, TRUE, FALSE, '999', NULL),
    ('8d7dfb62-2ba4-4ad1-b38e-068318200d9b', 'TNRSFileSelector',
            '', NULL, TRUE, FALSE, '999', NULL)
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'c5b85c6b-381e-44f6-a568-186f1fe7f03d', 'Info',
           'Informative static text', NULL, FALSE, FALSE, '999', vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'ffeca61a-f1b9-43ba-b6ff-fa77bb34f396', 'Text',
           'A text box (no caption or number check)', NULL, FALSE, TRUE, '1', vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'd2340f11-d260-41b4-93fd-c1d695bf6fef', 'Number',
           'A text box that checks for valid number input', NULL, TRUE, FALSE, '999',
           vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'f22ca553-856b-4253-b0f3-514701ed4567', 'QuotedText',
           'A text box that will add quotes for passing string to command line',
           NULL, TRUE, FALSE, '999', vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '206a93d6-bac4-4925-89fe-39c073e85c47', 'Flag',
           'A checkbox for yes/no selection', NULL, FALSE, TRUE, '3', vt.id
    FROM value_type vt WHERE vt.name = 'Boolean'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'babc3c29-39c2-47b5-8576-f3741f9ae329', 'Selection',
           'A list for selecting a choice (can be text)', NULL, TRUE, FALSE, '999',
           vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '7c71012b-158d-44fd-bda1-a5fb4d43bfd8', 'ValueSelection',
           'A list for selecting a value (numeric range)', NULL, TRUE, FALSE, '999',
           vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'F03DD9AC-B586-4FE1-A75B-3E2967BD0207', 'MultiLineText',
           'A multiline text box', '', FALSE, TRUE, '2', vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '67bdfe81-361e-41fe-852a-35159e1e7bc5', 'XBasePairs',
           'A text box with caption (x=user specified number)', NULL, TRUE,
           FALSE, '999', vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '871AA217-2E6C-48E2-880A-EE7815E8F7F8', 'XBasePairsText',
           'A text box with caption (x=user specified text)', '', TRUE, FALSE, '999',
           vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'C00ED92F-5399-490C-A6E5-AAD0E140D7FE', 'Input',
           'Input file or folder', NULL, TRUE, FALSE, '999', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'F7007237-040D-4253-9323-CAA4F71E9795', 'Output',
           'Output file or folder', NULL, FALSE, TRUE, '999', vt.id
    FROM value_type vt WHERE vt.name = 'Output'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'A024716E-1F18-4AF7-B59E-0745786D1B69', 'EnvironmentVariable',
           'An environment variable that is set before running a job', NULL,
           FALSE, TRUE, '9', vt.id
    FROM value_type vt WHERE vt.name = 'EnvironmentVariable'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '548A55C2-53FE-40A5-AD38-033F79C8C0AB', 'TreeSelection',
           'A hierarchical list for selecting a choice', NULL,
           FALSE, FALSE, '10', vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'C389D80A-F94E-4904-B6EF-BD658A18FC8A', 'Integer',
           'An integer value.', NULL, FALSE, TRUE, '4', vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '01250DB2-F8E9-4D9E-B82E-C4713DA84068', 'Double',
           'A real number value.', NULL, FALSE, TRUE, '5', vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'C529C00A-8B6F-4B73-80DA-C460C09722ED', 'TextSelection',
           'A list for selecting a textual value.', NULL, FALSE, FALSE, '6', vt.id
    FROM value_type vt WHERE vt.name = 'String'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '0F4E0460-893B-4724-BC7C-D145575B9B73', 'IntegerSelection',
           'A list for selecting an integer value.', NULL, FALSE, FALSE, '7', vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'B8566277-C368-40E9-8B66-BC1C884CF69B', 'DoubleSelection',
           'A list for selecting a real number value.', NULL, FALSE, FALSE, '8', vt.id
    FROM value_type vt WHERE vt.name = 'Number'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '3B3FAD4C-691B-44A8-BF34-D406F9052239', 'FileInput',
           'A control allowing for the selection of a single file.', NULL, FALSE,
           FALSE, '11', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '9633FD4C-5FFC-4471-B531-2ECAAA683E26', 'FolderInput',
           'A control allowing for the selection of an entire folder.',
           NULL, FALSE, FALSE, '12', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'FD5C9D3E-663D-469C-9455-5EE59621BF0E', 'MultiFileSelector',
           'A control allowing for the selection of multiple files.',
           NULL, FALSE, FALSE, '13', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '0E2E3BE4-18A8-487B-BB27-C96A5A5A141F', 'FileOutput',
           'A single output file.', NULL, FALSE, TRUE, '14', vt.id
    FROM value_type vt WHERE vt.name = 'Output'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '108011CA-1908-494E-B76F-83BB2BA696D7', 'FolderOutput',
           'A collection of output files in a single folder.', NULL, FALSE,
           TRUE, '15', vt.id
    FROM value_type vt WHERE vt.name = 'Output'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '8EF87E50-460F-402A-B5C8-BFBB83211A54', 'MultiFileOutput',
           'Multiple output files matched by a glob pattern.', NULL, FALSE,
           TRUE, '16', vt.id
    FROM value_type vt WHERE vt.name = 'Output'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '8F6C59D1-CB29-45FD-834E-A42770C3FAA6', 'ReferenceGenome',
           'A reference genome to use for alignments.', NULL, FALSE,
           TRUE, '17', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'D55C28BF-9F00-44A6-9CED-3DB8A46B8B40', 'ReferenceSequence',
           'A reference sequence file to use for alignments.', NULL, FALSE,
           TRUE, '18', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT 'B728413E-69EB-435E-A6F5-D00CB1F43DAA', 'ReferenceAnnotation',
           'A reference annotation file to use for alignments.', NULL, FALSE,
           TRUE, '19', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;

INSERT INTO parameter_types
    (id, name, description, label, deprecated, hidable, display_order, value_type_id)
    SELECT '8031799A-5C4A-46D6-A984-21230CF4A04A', 'FileFolderInput',
           'An input that can accept either a file or a folder as an input.', NULL, FALSE,
           TRUE, '20', vt.id
    FROM value_type vt WHERE vt.name = 'Input'
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, deprecated=EXCLUDED.deprecated, hidable=EXCLUDED.hidable, display_order=EXCLUDED.display_order, value_type_id=EXCLUDED.value_type_id;


-- rule_type_value_type

WITH rule_value_name_pairs (rule_name, value_name) AS ( VALUES
    ('IntBelow', 'Number'),
    ('IntBelowField', 'Number'),
    ('IntAbove', 'Number'),
    ('IntAboveField', 'Number'),
    ('IntRange', 'Number'),
    ('DoubleRange', 'Number'),
    ('DoubleBelow', 'Number'),
    ('DoubleAbove', 'Number'),
    ('MustContain', 'Number'),
    ('MustContain', 'String'),
    ('MustContain', 'EnvironmentVariable'),
    ('Regex', 'String'),
    ('Regex', 'EnvironmentVariable'),
    ('CharacterLimit', 'String'),
    ('CharacterLimit', 'EnvironmentVariable')
) INSERT INTO rule_type_value_type (rule_type_id, value_type_id)
    SELECT rt.id, vt.id
    FROM rule_value_name_pairs p
    JOIN rule_type rt ON rt.name = p.rule_name
    JOIN value_type vt ON vt.name = p.value_name
    WHERE NOT EXISTS (SELECT * from rule_type_value_type WHERE rule_type_id = rt.id AND value_type_id = vt.id);

-- users

INSERT INTO users (id, username) VALUES ('00000000-0000-0000-0000-000000000000', '<public>')
    ON CONFLICT (id) DO UPDATE
        SET username=EXCLUDED.username;

-- workspace

INSERT INTO workspace (id, is_public, user_id)
       SELECT '00000000-0000-0000-0000-000000000000', TRUE, u.id
       FROM users u
       WHERE u.username = '<public>'
    ON CONFLICT (id) DO UPDATE
        SET is_public=EXCLUDED.is_public, user_id=EXCLUDED.user_id;

-- app_categories

INSERT INTO app_categories (id, name, description, workspace_id) VALUES
    ('12c7a585-ec23-3352-e313-02e323112a7c',
     'Public Apps', '', '00000000-0000-0000-0000-000000000000'),
    ('5401bd146c144470aedd57b47ea1b979',
     'Beta', '', '00000000-0000-0000-0000-000000000000')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, workspace_id=EXCLUDED.workspace_id;

INSERT INTO app_category_group (parent_category_id, child_category_id, child_index)
       SELECT parent.id, child.id, 0 AS child_index
       FROM app_categories parent, app_categories child
       WHERE parent.id = '12c7a585-ec23-3352-e313-02e323112a7c'
       AND child.id = '5401bd146c144470aedd57b47ea1b979'
    ON CONFLICT (parent_category_id, child_category_id) DO UPDATE SET child_index=EXCLUDED.child_index;

UPDATE workspace SET root_category_id = '12c7a585-ec23-3352-e313-02e323112a7c'
       WHERE id = '00000000-0000-0000-0000-000000000000';

--This is the reference_genomes.json from metadactly to be autopopulated in the
--postgresDB in the genome_reference table.

INSERT INTO genome_reference (id, name, path, created_by, last_modified_by) VALUES
    ('4bb9856a-43da-4f67-bdf9-f90916b4c11f', 'Arabidopsis lyrata (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Arabidopsis_lyrata.1.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('18027404-d09f-41bf-99a4-74197ce0e7bf', 'Rattus norvegicus [Rat] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Rattus_norvegicus.RGSC3.4/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('2b1154f3-6c10-4707-a5ea-50d6eb890582', 'Zea mays [Maize] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Zea_mays.AGPv2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('e38b6fae-2e4b-4217-8c1f-6badea3ff7fc', 'Canis familiaris [Dog] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Canis_familiaris.BROAD2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('72facaa7-ba29-49ee-b184-42ba3c015ca4', 'Equus caballus [Horse] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Equus_caballus.EquCab2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('e21e71f2-219f-4704-a8a6-9ab487a759a6', 'Oryza brachyantha (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_brachyantha.v1.4b/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('9875f6cc-0503-418b-b5cc-8cb8dd44d56d', 'Setaria italica [Foxtail millet] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Setaria_italica.JGIv2.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('46f9d53d-36b6-4bd9-b4f2-ff952833103f', 'Oryza indica (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_indica.ASM465v1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('2d748e14-47f5-4a91-bc67-214787ad0843', 'Chlamydomonas reinhardtii (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Chlamydomonas_reinhardtii.v3.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('ef269f1a-e561-4f0c-92b7-3d9d8e7362f3', 'Drosophila melanogaster [Fruitfly] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Drosophila_melanogaster.BGDP5/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('8af62f2b-15fc-4f36-ae04-c6b801d98c1b', 'Vitis vinifera [Grape] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Vitis_vinifera.IGPP_12x/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('2c967e76-9b8a-4a3b-aa30-2e7de3a0a952', 'Sorghum bicolor [Sorghum] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Sorghum_bicolor.Sorbi1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('58a84f5e-3922-43dc-8414-e42b1513be78', 'Physcomitrella patens (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Physcomitrella_patens.AMS242v1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('c4dadc23-e0d2-481c-a3d1-1f5067e6528e', 'Gallus gallus [Chicken] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Gallus_gallus.WASHUC2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('4fce9ee9-0471-436b-938d-2e1820a71e6c', 'Homo sapiens [Human] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Homo_sapiens.GRCh37/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('f772929d-0ba3-4432-8623-7a74bf2720aa', 'Meleagris gallopavo [Turkey] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Meleagris_gallopavo.UMD2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('ba3d662f-0f71-45fa-83a3-7a80b9bb2b3f', 'Xenopus tropicalis [Xenopus] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Xenopus_tropicalis.JGI_4.2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('41149e71-4328-4391-b1d2-25fdbdca5a54', 'Felis catus [Cat] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Felis_catus.CAT/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('bb5317ce-ad00-466b-8109-432c117c0781', 'Sus scrofa [Pig] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Sus_scrofa.Sscrofa10.2/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('eb059ac7-ee82-421a-bbc1-12f117366c4a', 'Danio rerio [Zebrafish] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Danio_rerio.Zv9/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('a55701bc-44e6-4661-bc3a-888ca1febaed', 'Pan troglodytes [Chimp] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Pan_troglodytes.CHIMP2.1.4/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('6149be1b-7aaa-43b4-84df-de2567ab9489', 'Mus musculus [Mouse] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Mus_musculus.NCBIM37/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('ca94864b-b5a3-49a7-9638-0d57715a301d', 'Brassica rapa (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Brassica_rapa.IVFCAASv1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('826f0934-69a5-401d-8b5f-36da33fc520e', 'Glycine max [Soybean] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Glycine_max.V1.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('80aa0d1a-f32c-439a-940d-c9a6d629ed43', 'Populus trichocarpa [Poplar] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Populus_trichocarpa.JGI2.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('756adb31-72f4-487f-ba95-c5bcca7b13b5', 'Caenorhabditis elegans [C. elegans] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Caenorhabditis_elegans.WBcel215/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('7f66a989-9bb6-42c4-9db3-0e316304c93e', 'Arabidopsis thaliana (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Arabidopsis_thaliana.TAIR10/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('999a1d22-d2d8-4845-b685-da6403e9016e', 'Cyanidioschyzon merolae (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Cyanidioschyzon_merolae.ASM9120v1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('8683bbe8-c577-42f8-8d9b-1bdd861122ae', 'Brachypodium distachyon (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Brachypodium_distachyon.1.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('e4785abc-f1e7-4d71-9ae6-bff4f2b4613b', 'Oreochromis niloticus [Tilapia] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Oreochromis_niloticus.Orenil1.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('72de2532-bdf6-46b3-bffa-6c4860d63813', 'Bos taurus [Cow] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Bos_taurus.UMD3.1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('f3197615-747d-44c6-bd5f-293cbde95bab', 'Gadus morhua [Cod] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Gadus_morhua.gadMor1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('bdc96014-9b89-4dbc-9376-bc4805d9c1dd', 'Selaginella moellendorffii (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Selaginella_moellendorffii.v1.0/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('1e1c62e5-bd56-4cfa-b3ab-aa6a1496d3e5', 'Solanum lycopersicum [Tomato] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Solanum_lycopersicum.SL2.40/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('0876c503-9634-488b-9584-ac6c0d565b8d', 'Oryza sativa [Rice] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_sativa.MSU6/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('ea2e3413-924e-4de3-b012-05d906dd5d4a', 'Caenorhabditis elegans [C. elegans] (Ensembl 66)',
 '/data2/collections/genomeservices/0.2.1/Caenorhabditis_elegans.WS220/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('443befdd-c7ed-4b33-ac67-56a6748d7a48', 'Tursiops truncatus [Dolphin] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Tursiops_truncatus.turTru1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('70a34bd3-a7a4-4c7e-8ff5-36335b3f9b57', 'Saccharomyces cerevisiae [Yeast] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Saccharomyces_cerevisiae.EF4/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000'),
    ('7e5eff7b-35fa-4635-806c-06ef5ef50db4', 'Oryza glaberrima (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_glaberrima.AGI1.1/de_support/',
 '00000000-0000-0000-0000-000000000000', '00000000-0000-0000-0000-000000000000')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, path=EXCLUDED.path, created_by=EXCLUDED.created_by, last_modified_by=EXCLUDED.last_modified_by;

-- Populates the data_source table.

INSERT INTO data_source (id, name, label, description, display_order) VALUES
    ('8D6B8247-F1E7-49DB-9FFE-13EAD7C1AED6', 'file', 'File',
     'A regular file.', 1),
    ('1EEECF26-367A-4038-8D19-93EA80741DF2', 'stdout', 'Standard Output',
     'Redirected standard output from a job.', 2),
    ('BC4CF23F-18B9-4466-AF54-9D40F0E2F6B5', 'stderr', 'Standard Error Output',
     'Redirected error output from a job.', 3)
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, label=EXCLUDED.label, description=EXCLUDED.description, display_order=EXCLUDED.display_order;

-- Populates the tool_types table.

-- make sure the constraint is here first
ALTER TABLE ONLY tool_types
    DROP CONSTRAINT IF EXISTS tool_types_name_key,
    ADD UNIQUE (name);

INSERT INTO tool_types (id, name, label, description, hidden, notification_type) VALUES
    ( 'DE1DBE6A-A2BB-4219-986B-D878C6A9E3E4', 'executable', 'UA', 'Run at the University of Arizona', false, 'analysis' ),
    ( 'FA713BB8-2838-4B63-AB3A-265DBB1D719C', 'fAPI', 'TACC', 'Run at the Texas Advanced Computing Center', false, 'analysis' ),
    ( '01E14110-1420-4DE0-8A70-B0DD420F6A84', 'internal', 'Internal DE tools.', 'Tools used internally by the Discovery Environment.', true, 'data' ),
    ( '4166B913-EAFA-4731-881F-21C3751DFFBB', 'interactive', 'Interactive DE tools.', 'Interactive tools used by the Discovery Environment.', false, 'analysis' ),
    ( '7EC7063B-A96D-4AE5-9815-4548BA7D9C74', 'osg', 'OSG DE tools.', 'DE tools capable of running on the Open Science Grid.', false, 'analysis' )
    ON CONFLICT DO NOTHING;

-- Populates the tool_type_parameter_type table.

INSERT INTO tool_type_parameter_type (tool_type_id, parameter_type_id)
    SELECT tt.id, pt.id
    FROM tool_types tt, parameter_types pt
    WHERE tt."name" = 'executable'
    AND NOT EXISTS (SELECT * FROM tool_type_parameter_type WHERE tool_type_id = tt.id AND parameter_type_id = pt.id)
    ORDER BY pt.display_order;

INSERT INTO tool_type_parameter_type (tool_type_id, parameter_type_id)
    SELECT tt.id, pt.id
    FROM tool_types tt, parameter_types pt
    WHERE tt."name" = 'fAPI'
    AND pt."name" != 'EnvironmentVariable'
    AND NOT EXISTS (SELECT * FROM tool_type_parameter_type WHERE tool_type_id = tt.id AND parameter_type_id = pt.id)
    ORDER BY pt.display_order;

INSERT INTO tool_type_parameter_type (tool_type_id, parameter_type_id)
    SELECT tt.id, pt.id
    FROM tool_types tt, parameter_types pt
    WHERE tt."name" = 'internal'
    AND NOT EXISTS (SELECT * FROM tool_type_parameter_type WHERE tool_type_id = tt.id AND parameter_type_id = pt.id)
    ORDER BY pt.display_order;

-- Populates the tool_request_status_codes table.

INSERT INTO tool_request_status_codes ( id, name, description, email_template ) VALUES
    ( '1FB4295B-684E-4657-AFAB-6CC0912312B1',
      'Submitted',
      'The request has been submitted, but not acted upon by the support team.',
      'tool_request_submitted' ),
    ( 'AFBBCDA8-49C3-47C0-9F28-DE87CBFBCBD6',
      'Pending',
      'The support team is waiting for a response from the requesting user.',
      'tool_request_pending' ),
    ( 'B15FD4B9-A8D3-48EC-BD29-B0AACB51D335',
      'Evaluation',
      'The support team is evaluating the tool for installation.',
      'tool_request_evaluation' ),
    ( '031D4F2C-3880-4483-88F8-E6C27C374340',
      'Installation',
      'The support team is installing the tool.',
      'tool_request_installation' ),
    ( 'E4A0210C-663C-4943-BAE9-7D2FA7063301',
      'Validation',
      'The support team is verifying that the installation was successful.',
      'tool_request_validation' ),
    ( '5ED94200-7565-45D8-B576-D7FF839E9993',
      'Completion',
      'The tool has been installed successfully.',
      'tool_request_completion' ),
    ( '461F24EE-5521-461A-8C20-C400D912FB2D',
      'Failed',
      'The tool could not be installed.',
      'tool_request_failed' )
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, email_template=EXCLUDED.email_template;

-- Populates the tool_architectures table.

INSERT INTO tool_architectures ( id, name, description ) VALUES
    ( 'A8220BBA-63FE-4139-B6C3-5E22B43E8413', '32-bit Generic', '32-bit executables on an unspecified architecture.' ),
    ( 'EF254514-6D9F-4869-8FB8-A719262EFCA3', '64-bit Generic', '64-bit executables on an unspecified architecture.' ),
    ( '44DF2E72-36C0-4753-99F7-10AF851BAE8F', 'Others', 'Another specific architecture.' ),
    ( '6AF24F59-5DE7-4E43-A000-B8059DC80B0A', 'Don''t know', 'Used in cases where the user doesn''t know the architecture.' )
    ON CONFLICT DO NOTHING;

-- Populates the job_types table.

INSERT INTO job_types(id, name, system_id) VALUES
    ( 'AD069D9F-E38F-418C-84F6-21F620CADE77', 'DE', 'de' ),
    ( '61433582-A271-4154-B3C5-F4C1D91DB2A4', 'Agave', 'agave' ),
    ( 'EAD7467A-67C1-4087-90E1-F29EBF2EA084', 'Interactive', 'interactive'),
    ( '769AB85C-539C-4F08-A9E7-A565BCE9B009', 'OSG', 'osg')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, system_id=EXCLUDED.system_id;

--
-- The integration data information to be used for internal apps, and
-- the integration data information to be used for default DE apps.
--
INSERT INTO integration_data (id, integrator_name, integrator_email) VALUES
    ('11aa036c-854b-11e4-b945-6fcf37fdc1b6', 'Internal DE Tools', 'support@iplantcollaborative.org'),
    ('16f23c00-3ac6-11e5-a192-c336c89e8b6a', 'Default DE Tools', 'support@iplantcollaborative.org')
    ON CONFLICT (id) DO UPDATE
        SET integrator_name=EXCLUDED.integrator_name, integrator_email=EXCLUDED.integrator_email;

--
-- The internal tool for the Go tool used for URL imports.
--
INSERT INTO tools (id, "name", location, description, version, tool_type_id, integration_data_id)
    SELECT '681251EF-EE59-4FE9-9436-DC8A23FEB11A',
           'urlimport',
           '',
           'Go tool for DE URL imports',
           '1.0.0',
           tool_types.id,
           integration_data.id
    FROM tool_types, integration_data
    WHERE tool_types."name" = 'internal'
    AND integration_data.integrator_name = 'Internal DE Tools'
    LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, location=EXCLUDED.location, description=EXCLUDED.description, version=EXCLUDED.version, tool_type_id=EXCLUDED.tool_type_id, integration_data_id=EXCLUDED.integration_data_id;

--
-- A fake tool for testing.
--
INSERT INTO tools (id, "name", location, description, version, tool_type_id, integration_data_id)
    SELECT '4c7105ce-b900-405f-b067-cd3b152d3b4b',
           'notreal',
           '/not/real/',
           'not a real tool',
           '1.0.0',
           tool_types.id,
           integration_data.id
      FROM tool_types, integration_data
     WHERE tool_types."name" = 'internal'
       AND integration_data.integrator_name = 'Internal DE Tools'
     LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, location=EXCLUDED.location, description=EXCLUDED.description, version=EXCLUDED.version, tool_type_id=EXCLUDED.tool_type_id, integration_data_id=EXCLUDED.integration_data_id;

--
-- The internal app for the Go tool used for URL imports.
--
INSERT INTO apps (id, "name", description, integration_data_id, wiki_url, integration_date)
    SELECT '1E8F719B-0452-4D39-A2F3-8714793EE3E6',
           'Url Import',
           'A Go tool for DE URL imports',
           integration_data.id,
           '',
           now()
    FROM integration_data
    WHERE integrator_name = 'Internal DE Tools'
    LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, integration_data_id=EXCLUDED.integration_data_id, wiki_url=EXCLUDED.wiki_url, integration_date=EXCLUDED.integration_date;

INSERT INTO tasks (id, "name", description, label, tool_id, job_type_id) VALUES
    ('212C5980-9A56-417E-A8C6-394AC445CA4D',
     'Curl Wrapper',
     'curl wrapper for DE URL imports',
     'Curl Wrapper',
     '681251EF-EE59-4FE9-9436-DC8A23FEB11A',
     'AD069D9F-E38F-418C-84F6-21F620CADE77')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, tool_id=EXCLUDED.tool_id, job_type_id=EXCLUDED.job_type_id;

INSERT INTO parameter_groups (id, "name", description, label, task_id) VALUES
    ('30345113-D3E5-406B-A4E8-170A685E7A8B',
     'Parameters',
     'URL upload parameters',
     'Parameters',
     '212C5980-9A56-417E-A8C6-394AC445CA4D')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, task_id=EXCLUDED.task_id;

INSERT INTO parameters (id, "name", description, label, ordering, parameter_group_id,
                        parameter_type, display_order, required)
    SELECT '1DD009B1-CE1E-4933-ABA8-66314757288B',
           '-filename',
           'The name of the uploaded file.',
           'Output Filename',
           0,
           '30345113-D3E5-406B-A4E8-170A685E7A8B',
           pt.id,
           0,
           TRUE
    FROM parameter_types pt
    WHERE pt."name" = 'FileOutput'
    LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, ordering=EXCLUDED.ordering, parameter_group_id=EXCLUDED.parameter_group_id, parameter_type=EXCLUDED.parameter_type, display_order=EXCLUDED.display_order, required=EXCLUDED.required;


INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id, retain)
    SELECT '75288DE6-323D-44CA-BEFA-8E14DAE109E4',
           '1DD009B1-CE1E-4933-ABA8-66314757288B',
           info_type.id,
           data_formats.id,
           data_source.id,
           TRUE
    FROM info_type, data_formats, data_source
    WHERE info_type."name" = 'File'
    AND data_formats."name" = 'Unspecified'
    AND data_source."name" = 'file'
    LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET parameter_id=EXCLUDED.parameter_id, info_type=EXCLUDED.info_type, data_format=EXCLUDED.data_format, data_source_id=EXCLUDED.data_source_id, retain=EXCLUDED.retain;

INSERT INTO parameters (id, "name", description, label, ordering, parameter_group_id,
                        parameter_type, display_order, required)
    SELECT 'A0D6A102-8623-47B9-A57F-224D6A71F28D',
           '-url',
           'The URL to retrieve the file from.',
           'Source URL',
           1,
           '30345113-D3E5-406B-A4E8-170A685E7A8B',
           pt.id,
           1,
           TRUE
    FROM parameter_types pt
    WHERE pt."name" = 'Text'
    LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, ordering=EXCLUDED.ordering, parameter_group_id=EXCLUDED.parameter_group_id, parameter_type=EXCLUDED.parameter_type, display_order=EXCLUDED.display_order, required=EXCLUDED.required;

INSERT INTO app_steps (step, id, app_id, task_id) VALUES
    (0,
     'EE78DEB5-EBBB-4D9D-8DCF-8DFE457A7856',
     '1E8F719B-0452-4D39-A2F3-8714793EE3E6',
     '212C5980-9A56-417E-A8C6-394AC445CA4D')
    ON CONFLICT (id) DO UPDATE
        SET step=EXCLUDED.step, app_id=EXCLUDED.app_id, task_id=EXCLUDED.task_id;

--
-- New containerized word count tool
--
INSERT INTO tools (id, "name", location, description, version, tool_type_id, integration_data_id)
  SELECT '85cf7a33-386b-46fe-87c7-8c9d59972624',
         'wc',
         '',
         'Word Count',
         '0.0.1',
         tool_types.id,
         integration_data.id
    FROM tool_types, integration_data
   WHERE tool_types."name" = 'executable'
     AND integration_data.integrator_name = 'Default DE Tools'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, location=EXCLUDED.location, description=EXCLUDED.description, version=EXCLUDED.version, tool_type_id=EXCLUDED.tool_type_id, integration_data_id=EXCLUDED.integration_data_id;

--
-- The app for word count
--
INSERT INTO apps(id, "name", description, integration_data_id, wiki_url, integration_date)
   SELECT '67d15627-22c5-42bd-8daf-9af5deecceab',
          'DE Word Count',
          'Counts the number of words in a file',
          integration_data.id,
          '',
          now()
     FROM integration_data
    WHERE integrator_name = 'Default DE Tools'
    LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, integration_data_id=EXCLUDED.integration_data_id, wiki_url=EXCLUDED.wiki_url, integration_date=EXCLUDED.integration_date;

INSERT INTO tasks (id, "name", description, label, tool_id, job_type_id) VALUES
    ('1ac31629-231a-4090-b3b4-63ee078a0c37',
     'DE Word Count',
     'Counts the number of words in a file',
     'DE Word Count',
     '85cf7a33-386b-46fe-87c7-8c9d59972624',
     'AD069D9F-E38F-418C-84F6-21F620CADE77')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, tool_id=EXCLUDED.tool_id, job_type_id=EXCLUDED.job_type_id;

INSERT INTO parameter_groups (id, "name", description, label, task_id) VALUES
    ('741711b0-0b95-4ac9-98b4-ca58225e76be',
     'Parameters',
     'Word count parameters',
     'Parameters',
     '1ac31629-231a-4090-b3b4-63ee078a0c37')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, task_id=EXCLUDED.task_id;

INSERT INTO parameters (id, "name", description, label, ordering, parameter_group_id,
                     parameter_type, display_order, required)
  SELECT '13914010-89cd-406d-99c3-9c4ff8b023c3',
         '',
         'The file to count words in.',
         'Input Filename',
         0,
         '741711b0-0b95-4ac9-98b4-ca58225e76be',
         pt.id,
         0,
         TRUE
    FROM parameter_types pt
   WHERE pt."name" = 'FileInput'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, ordering=EXCLUDED.ordering, parameter_group_id=EXCLUDED.parameter_group_id, parameter_type=EXCLUDED.parameter_type, display_order=EXCLUDED.display_order, required=EXCLUDED.required;

INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id, retain)
    SELECT 'a350604d-48a0-4083-b6b3-425f3b1f7f51',
           '13914010-89cd-406d-99c3-9c4ff8b023c3',
           info_type.id,
           data_formats.id,
           data_source.id,
           TRUE
      FROM info_type, data_formats, data_source
     WHERE info_type."name" = 'File'
       AND data_formats."name" = 'Unspecified'
       AND data_source."name" = 'file'
     LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET parameter_id=EXCLUDED.parameter_id, info_type=EXCLUDED.info_type, data_format=EXCLUDED.data_format, data_source_id=EXCLUDED.data_source_id, retain=EXCLUDED.retain;

WITH to_insert (app_category_id, app_id) AS ( VALUES
    ('5401bd146c144470aedd57b47ea1b979'::uuid,
     '67d15627-22c5-42bd-8daf-9af5deecceab'::uuid))
INSERT INTO app_category_app (app_category_id, app_id)
    SELECT app_category_id, app_id FROM to_insert i
    WHERE NOT EXISTS (SELECT * FROM app_category_app aca WHERE aca.app_category_id = i.app_category_id AND aca.app_id = i.app_id);

INSERT INTO app_steps (step, id, app_id, task_id) VALUES
    (0,
     '089a61a0-23d9-4021-9354-a8498ef3ff19',
     '67d15627-22c5-42bd-8daf-9af5deecceab',
     '1ac31629-231a-4090-b3b4-63ee078a0c37')
    ON CONFLICT (id) DO UPDATE
        SET step=EXCLUDED.step, app_id=EXCLUDED.app_id, task_id=EXCLUDED.task_id;

INSERT INTO container_images (id, "name", tag, url) VALUES
    ('15959300-b972-4571-ace2-081af0909599',
     'discoenv/url-import',
     'latest',
     'https://registry.hub.docker.com/u/discoenv/url-import/')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, tag=EXCLUDED.tag, url=EXCLUDED.url;

INSERT INTO container_images (id, deprecated, "name", tag, url) VALUES
    ('fc210a84-f7cd-4067-939c-a68ec3e3bd2b',
     TRUE,
     'docker.cyverse.org/backwards-compat',
     'latest',
     'https://registry.hub.docker.com/u/discoenv/backwards-compat')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, tag=EXCLUDED.tag, url=EXCLUDED.url;

INSERT INTO container_settings (tools_id, network_mode)
  VALUES ('681251EF-EE59-4FE9-9436-DC8A23FEB11A', 'bridge')
    ON CONFLICT (tools_id) DO UPDATE
        SET network_mode=EXCLUDED.network_mode;

INSERT INTO container_settings (tools_id, network_mode, entrypoint)
  VALUES ('85cf7a33-386b-46fe-87c7-8c9d59972624', 'none', 'wc')
    ON CONFLICT (tools_id) DO UPDATE
        SET network_mode=EXCLUDED.network_mode, entrypoint=EXCLUDED.entrypoint;

-- Insert default container settings for tools that don't already have them.
INSERT INTO container_settings (tools_id)
  SELECT tools.id
    FROM tools
   WHERE tools.id NOT IN (
     SELECT container_settings.tools_id
       FROM container_settings
      WHERE container_settings.tools_id IS NOT NULL
   )
   AND tools.name != 'notreal';

INSERT INTO data_containers (id, name_prefix, container_images_id)
  VALUES ('115584ad-7bc3-4601-89a2-85a4e5b5f6a4', 'wc-data', '15959300-b972-4571-ace2-081af0909599')
    ON CONFLICT (id) DO UPDATE
        SET name_prefix=EXCLUDED.name_prefix, container_images_id=EXCLUDED.container_images_id;

INSERT INTO container_volumes_from (data_containers_id, container_settings_id)
  SELECT '115584ad-7bc3-4601-89a2-85a4e5b5f6a4',
         container_settings.id
    FROM container_settings
   WHERE container_settings.tools_id = '85cf7a33-386b-46fe-87c7-8c9d59972624'
     AND container_settings.network_mode = 'none'
     AND container_settings.entrypoint = 'wc'
   LIMIT 1;


UPDATE ONLY tools
   SET container_images_id = '15959300-b972-4571-ace2-081af0909599'
 WHERE id = '681251EF-EE59-4FE9-9436-DC8A23FEB11A';

-- The wc tool reuses the curl-wrapper image.
UPDATE ONLY tools
   SET container_images_id = '15959300-b972-4571-ace2-081af0909599'
 WHERE id = '85cf7a33-386b-46fe-87c7-8c9d59972624';

-- Everything else should use the docker.cyverse.org/backwards-compat:latest container.
UPDATE ONLY tools
   SET container_images_id = 'fc210a84-f7cd-4067-939c-a68ec3e3bd2b'
 WHERE container_images_id IS NULL;

--
-- The container image for Python 2.7
--
INSERT INTO container_images (id, "name", tag, url) VALUES
    ('bad7e301-4442-4e82-8cc4-8db681cae364',
     'python',
     '2.7',
     'https://hub.docker.com/_/python/')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, tag=EXCLUDED.tag, url=EXCLUDED.url;
--
-- The internal tool for Python 2.7
--
INSERT INTO tools
    (id,
     "name",
     location,
     description,
     version,
     tool_type_id,
     integration_data_id,
     time_limit_seconds,
     container_images_id)
  SELECT '4e3b1710-0f15-491f-aca9-812335356fdb',
         'python',
         '/usr/local/bin',
         'Python 2.7 with no networking, a 1GB RAM limit, and a 10% cpu share. Entrypoint is python.',
         '1.0.0',
         tool_types.id,
         integration_data.id,
         14400,
         'bad7e301-4442-4e82-8cc4-8db681cae364'
    FROM tool_types, integration_data
   WHERE tool_types."name" = 'executable'
     AND integration_data.integrator_name = 'Default DE Tools'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, location=EXCLUDED.location, description=EXCLUDED.description, version=EXCLUDED.version, tool_type_id=EXCLUDED.tool_type_id, integration_data_id=EXCLUDED.integration_data_id, time_limit_seconds=EXCLUDED.time_limit_seconds, container_images_id=EXCLUDED.container_images_id;

INSERT INTO container_settings (tools_id, network_mode, entrypoint, memory_limit, cpu_shares)
  VALUES ('4e3b1710-0f15-491f-aca9-812335356fdb', 'none', 'python', 1000000000, 102)
    ON CONFLICT (tools_id) DO UPDATE
        SET network_mode=EXCLUDED.network_mode, entrypoint=EXCLUDED.entrypoint, memory_limit=EXCLUDED.memory_limit, cpu_shares=EXCLUDED.cpu_shares;

--
-- The app for Python 2.7
--
INSERT INTO apps
    (id,
     "name",
     description,
     integration_data_id,
     wiki_url,
     integration_date)
  SELECT '336bbfb3-7899-493a-b4a2-ed3bc353ead8',
         'Python 2.7',
         'Runs an arbitrary Python script with a time limit of 4 hours, a 1GB RAM limit, a 10% cpu share, and no networking. Accepts a script and a data file as inputs.',
         integration_data.id,
         '',
         now()
    FROM integration_data
   WHERE integrator_name = 'Default DE Tools'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, integration_data_id=EXCLUDED.integration_data_id, wiki_url=EXCLUDED.wiki_url, integration_date=EXCLUDED.integration_date;

INSERT INTO tasks (id, "name", description, label, tool_id, job_type_id) VALUES
    ('66b59035-6036-46c3-a30a-ee3bd4af47b6',
     'Run a Python 2.7 script',
     'Runs a Python 2.7 script against a data file',
     'Run a Python 2.7 script',
     '4e3b1710-0f15-491f-aca9-812335356fdb',
     'AD069D9F-E38F-418C-84F6-21F620CADE77')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, tool_id=EXCLUDED.tool_id, job_type_id=EXCLUDED.job_type_id;

INSERT INTO parameter_groups (id, "name", description, label, task_id) VALUES
    ('f252f7b2-5c27-4a27-bbbb-f4f2f2acf407',
     'Parameters',
     'Python 2.7 parameters',
     'Parameters',
     '66b59035-6036-46c3-a30a-ee3bd4af47b6')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, task_id=EXCLUDED.task_id;

INSERT INTO parameters
      (id,
     "name",
     description,
     label,
     ordering,
     parameter_group_id,
     parameter_type,
     display_order,
     required)
  SELECT '5e1339f0-e01a-4fa3-8546-f7f16af547bf',
         '',
         'The Python script to run',
         'Script',
         0,
         'f252f7b2-5c27-4a27-bbbb-f4f2f2acf407',
         pt.id,
         0,
         TRUE
    FROM parameter_types pt
   WHERE pt."name" = 'FileInput'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, ordering=EXCLUDED.ordering, parameter_group_id=EXCLUDED.parameter_group_id, parameter_type=EXCLUDED.parameter_type, display_order=EXCLUDED.display_order, required=EXCLUDED.required;

INSERT INTO parameters
    (id,
     "name",
     description,
     label,
     ordering,
     parameter_group_id,
     parameter_type,
     display_order,
     required)
  SELECT '41d1a467-17fa-4b25-ba5e-43c8cb88948b',
         '',
         'The data file to process',
         'Data file',
         1,
         'f252f7b2-5c27-4a27-bbbb-f4f2f2acf407',
         pt.id,
         1,
         TRUE
    FROM parameter_types pt
   WHERE pt."name" = 'FileInput'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, label=EXCLUDED.label, ordering=EXCLUDED.ordering, parameter_group_id=EXCLUDED.parameter_group_id, parameter_type=EXCLUDED.parameter_type, display_order=EXCLUDED.display_order, required=EXCLUDED.required;

INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id, retain)
  SELECT '78244fb8-d5bb-479b-b73e-a12c20dbb774',
         '5e1339f0-e01a-4fa3-8546-f7f16af547bf',
         info_type.id,
         data_formats.id,
         data_source.id,
         TRUE
    FROM info_type, data_formats, data_source
   WHERE info_type."name" = 'File'
     AND data_formats."name" = 'Unspecified'
     AND data_source."name" = 'file'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET parameter_id=EXCLUDED.parameter_id, info_type=EXCLUDED.info_type, data_format=EXCLUDED.data_format, data_source_id=EXCLUDED.data_source_id, retain=EXCLUDED.retain;

INSERT INTO file_parameters (id, parameter_id, info_type, data_format, data_source_id, retain)
  SELECT '73ec6e74-d5e6-4977-b999-620b4e79ebda',
         '41d1a467-17fa-4b25-ba5e-43c8cb88948b',
         info_type.id,
         data_formats.id,
         data_source.id,
         TRUE
    FROM info_type, data_formats, data_source
   WHERE info_type."name" = 'File'
     AND data_formats."name" = 'Unspecified'
     AND data_source."name" = 'file'
   LIMIT 1
    ON CONFLICT (id) DO UPDATE
        SET parameter_id=EXCLUDED.parameter_id, info_type=EXCLUDED.info_type, data_format=EXCLUDED.data_format, data_source_id=EXCLUDED.data_source_id, retain=EXCLUDED.retain;

WITH to_insert (app_category_id, app_id) AS ( VALUES
    ('5401bd146c144470aedd57b47ea1b979'::uuid,
     '336bbfb3-7899-493a-b4a2-ed3bc353ead8'::uuid))
INSERT INTO app_category_app (app_category_id, app_id)
    SELECT app_category_id, app_id FROM to_insert i
    WHERE NOT EXISTS (SELECT * FROM app_category_app aca WHERE aca.app_category_id = i.app_category_id AND aca.app_id = i.app_id);

INSERT INTO app_steps (step, id, app_id, task_id) VALUES
    (0,
     'b34736a8-aa68-4845-803d-c0d1942ccdff',
     '336bbfb3-7899-493a-b4a2-ed3bc353ead8',
     '66b59035-6036-46c3-a30a-ee3bd4af47b6')
    ON CONFLICT (id) DO UPDATE
        SET step=EXCLUDED.step, app_id=EXCLUDED.app_id, task_id=EXCLUDED.task_id;

-- webhooks_type

INSERT INTO webhooks_type (id, type, template) VALUES
    ('f4dbf5f4-c3f6-11e7-a333-008cfa5ae621', 'Slack','
{
	"text": "{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}"
}
'),
    ('c9cd5218-d9e0-11e7-ac79-008cfa5ae621', 'Zapier', '
{
  "id": "{{.ID}}",
  "name": "{{.Name}}",
  "text": "{{.Msg}}. {{if .Completed}} <{{.Link}}|{{.LinkText}}> {{- end}}"
}
'),
    ('32aaf1c4-91db-11e9-857c-008cfa5ae621', 'Custom','')
    ON CONFLICT (id) DO UPDATE
        SET type=EXCLUDED.type, template=EXCLUDED.template;

-- webhooks_topic

INSERT INTO webhooks_topic (id, topic) VALUES
    ('f4dcbf16-c3f6-11e7-a333-008cfa5ae621', 'data'),
    ('f4dced88-c3f6-11e7-a333-008cfa5ae621', 'apps'),
    ('f4dd14f2-c3f6-11e7-a333-008cfa5ae621', 'analysis'),
    ('f4dd39fa-c3f6-11e7-a333-008cfa5ae621', 'permanent_id_request'),
    ('f4dd6164-c3f6-11e7-a333-008cfa5ae621', 'team'),
    ('f4dd834c-c3f6-11e7-a333-008cfa5ae621', 'tool_request')
    ON CONFLICT (id) DO UPDATE
        SET topic=EXCLUDED.topic;

-- validation_rule_argument_types

INSERT INTO validation_rule_argument_types (id, name) VALUES
    ('485d6288-9bf8-4f62-89da-eca90b0ca68b', 'String'),
    ('aabf8059-ae4f-454e-a791-434580530530', 'Integer'),
    ('9049a4cd-3385-4a3d-8db2-a49ce69b091d', 'Double')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name;

-- validation_rule_argument_definitions

INSERT INTO validation_rule_argument_definitions
    (id, rule_type_id, argument_index, name, description, argument_type_id)
VALUES
    ('5f05b059-0e27-4854-8471-2161e740c9dd', '07303d4b-3635-4934-93e6-b24de4f2725b', 0, 'FieldRef',
     'The other field to compare to this field.', '485d6288-9bf8-4f62-89da-eca90b0ca68b'),
    ('e4a26b96-6ca6-46b6-8897-f4475db4c3bd', '2c3eec11-011a-4152-b27b-00d73deab7cf', 0, 'LowerLimit',
     'The lower limit of this field.', 'aabf8059-ae4f-454e-a791-434580530530'),
    ('192b9618-6811-4922-b44c-13d10fdad781', 'e04fb2c6-d5fd-47e4-ae89-a67390ccb67e', 0, 'LowerLimit',
     'The lower limit of this field.', 'aabf8059-ae4f-454e-a791-434580530530'),
    ('91faecde-1dca-4eb0-be2d-8a8bf23d0b84', 'e04fb2c6-d5fd-47e4-ae89-a67390ccb67e', 1, 'UpperLimit',
     'The upper limit of this field.', 'aabf8059-ae4f-454e-a791-434580530530'),
    ('eb50537e-07c2-4f64-b5d7-15765954334e', 'e1afc242-8962-4f0c-95be-5a6363cdd48b', 0, 'FieldRef',
     'The other field to compare to this field.', '485d6288-9bf8-4f62-89da-eca90b0ca68b'),
    ('d038c593-0dd1-4403-b13a-e1d816d1a31d', '0621f097-1b31-4457-812b-c8ca70bfbe14', 0, 'List',
     'The list of valid values for this field.', '485d6288-9bf8-4f62-89da-eca90b0ca68b'),
    ('b86c8c26-6123-462d-b47c-93540eb4cacb', '58cd8b75-5598-4490-a9c9-a6d7a8cd09dd', 0, 'LowerLimit',
     'The lower limit of this field.', '9049a4cd-3385-4a3d-8db2-a49ce69b091d'),
    ('7bec62bb-9489-4acb-99c6-577f13e38063', '58cd8b75-5598-4490-a9c9-a6d7a8cd09dd', 1, 'UpperLimit',
     'The upper limit of this field.', '9049a4cd-3385-4a3d-8db2-a49ce69b091d'),
    ('f981dd45-e99d-489c-bcd3-75aef05678fd', 'aebaaff6-3280-442d-b45e-6fd65e2d2c80', 0, 'UpperLimit',
     'The upper limit of this field.', 'aabf8059-ae4f-454e-a791-434580530530'),
    ('626f0bcd-4675-42f4-9a4c-3af516902d70', '87087b30-e7af-4b04-b08f-49baf5570466', 0, 'LowerLimit',
     'The lower limit of this field.', '9049a4cd-3385-4a3d-8db2-a49ce69b091d'),
    ('51d0682b-088f-4dc8-869d-15f564f3dbe3', '716a791b-47f3-4a53-9585-ed2f731a47f8', 0, 'UpperLimit',
     'The upper limit of this field.', '9049a4cd-3385-4a3d-8db2-a49ce69b091d'),
    ('d36c49c9-4a10-41b2-a796-7453fd26cfb4', '4b4ee99b-2cf2-4ff8-8474-73fc6a1effa7', 0, 'Regex',
     'The regular expression.', '485d6288-9bf8-4f62-89da-eca90b0ca68b'),
    ('7ce39813-e26a-479d-832c-755a024e41fa', '2D531048-A876-4B5D-8D21-54074910C721', 0, 'MaxLength',
     'The maximum length of the field.', 'aabf8059-ae4f-454e-a791-434580530530')
    ON CONFLICT (id) DO UPDATE
        SET rule_type_id=EXCLUDED.rule_type_id, argument_index=EXCLUDED.argument_index, name=EXCLUDED.name, description=EXCLUDED.description, argument_type_id=EXCLUDED.argument_type_id;

-- Populates the app_publication_request_status_codes table.

INSERT INTO app_publication_request_status_codes ( id, name, description, email_template ) VALUES
    ( '1FB4295B-684E-4657-AFAB-6CC0912312B1',
      'Submitted',
      'The request has been submitted, but not acted upon by the support team.',
      NULL ),
    ( '046C9445-9070-4CCD-A2E9-66EE23124CE8',
      'Completion',
      'The app has been made available for public use.',
      'app_publication_completion' )
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, description=EXCLUDED.description, email_template=EXCLUDED.email_template;

-- Populates the job_limits table.

INSERT INTO job_limits (id, launcher, concurrent_jobs) VALUES
    ('72DFEF9A-F6B1-482E-B2A0-16194247BE31', NULL, 8)
    ON CONFLICT (id) DO UPDATE
        SET launcher=EXCLUDED.launcher, concurrent_jobs=EXCLUDED.concurrent_jobs;

-- Populates the request_status_codes table

INSERT INTO request_status_codes (id, name, display_name, email_template) VALUES
    ('dc983a80-5cd6-4c56-a9a6-7fbe8787fdd0', 'submitted', 'Submitted', 'request_submitted'),
    ('74c25fd8-5cdf-4a3d-89a2-c55e88277c6a', 'in-progress', 'In Progress', 'request_in_progress'),
    ('184029d3-7767-413e-82a0-4af68f2282b7', 'approved', 'Approved', 'request_complete'),
    ('71c59a1b-f322-4114-9bbe-3aaa6c7c1942', 'rejected', 'Rejected', 'request_rejected')
    ON CONFLICT (id) DO UPDATE
        SET name=EXCLUDED.name, display_name=EXCLUDED.display_name, email_template=EXCLUDED.email_template;

COMMIT;
