-- Metadata templates and the attribute system that backs them.
--
-- value_types is reference data seeded by migration 000025, so it is referenced
-- here by natural key (name) rather than re-inserted. The rest is synthetic: a
-- template whose attributes cover several value types, including an Enum attribute
-- with values, an attribute group with nested sub-attributes (attr_attrs), and a
-- synonym pair (attr_synonyms). Loaded with search_path = metadata, public so the
-- unqualified table/value_type names resolve to the metadata schema.
BEGIN;
SET search_path = metadata, public, pg_catalog;

-- Attributes. Contact (a Grouping) parents two child attributes; Title and Name
-- are synonyms; Organism is an Enum with values defined below. description is
-- NOT NULL on this table.
INSERT INTO metadata.attributes (id, name, description, required, value_type_id, created_by, modified_by) VALUES
    ('a7000000-0000-0000-0000-000000000001', 'Title',         'Title of the dataset',      true,  (SELECT id FROM value_types WHERE name='String'),         'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000002', 'Description',   'Free-text description',      false, (SELECT id FROM value_types WHERE name='Multiline Text'), 'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000003', 'Organism',      'Source organism',            false, (SELECT id FROM value_types WHERE name='Enum'),           'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000004', 'Sample Count',  'Number of samples',          false, (SELECT id FROM value_types WHERE name='Integer'),        'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000005', 'Contact',       'Contact information group',  false, (SELECT id FROM value_types WHERE name='Grouping'),       'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000006', 'Contact Name',  'Name of the contact',        false, (SELECT id FROM value_types WHERE name='String'),         'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000007', 'Contact Email', 'Email of the contact',       false, (SELECT id FROM value_types WHERE name='URL/URI'),        'testuser01@example.org', 'testuser01@example.org'),
    ('a7000000-0000-0000-0000-000000000008', 'Name',          'Synonym of Title',           false, (SELECT id FROM value_types WHERE name='String'),         'testuser01@example.org', 'testuser01@example.org')
ON CONFLICT (id) DO NOTHING;

-- Enum values for the Organism attribute (Human is the default).
INSERT INTO metadata.attr_enum_values (id, attribute_id, value, is_default, display_order) VALUES
    ('a8000000-0000-0000-0000-000000000001', 'a7000000-0000-0000-0000-000000000003', 'Human',       true,  0),
    ('a8000000-0000-0000-0000-000000000002', 'a7000000-0000-0000-0000-000000000003', 'Mouse',       false, 1),
    ('a8000000-0000-0000-0000-000000000003', 'a7000000-0000-0000-0000-000000000003', 'Arabidopsis', false, 2)
ON CONFLICT (id) DO NOTHING;

-- Contact group's sub-attributes (attr_attrs: parent_id -> child_id; child_id is unique).
INSERT INTO metadata.attr_attrs (parent_id, child_id, display_order) VALUES
    ('a7000000-0000-0000-0000-000000000005', 'a7000000-0000-0000-0000-000000000006', 0),
    ('a7000000-0000-0000-0000-000000000005', 'a7000000-0000-0000-0000-000000000007', 1)
ON CONFLICT (child_id) DO NOTHING;

-- Title and Name are synonyms (no unique constraint on this table, so guard with NOT EXISTS).
INSERT INTO metadata.attr_synonyms (attribute_id, synonym_id)
SELECT 'a7000000-0000-0000-0000-000000000001', 'a7000000-0000-0000-0000-000000000008'
WHERE NOT EXISTS (
    SELECT 1 FROM metadata.attr_synonyms
    WHERE attribute_id = 'a7000000-0000-0000-0000-000000000001'
      AND synonym_id   = 'a7000000-0000-0000-0000-000000000008');

-- Templates: an active one wired to the top-level attributes, plus a deleted one
-- so listings can exercise the deleted filter.
INSERT INTO metadata.templates (id, name, description, deleted, created_by, modified_by) VALUES
    ('7e000000-0000-0000-0000-000000000001', 'Test Metadata Template', 'A synthetic template', false, 'testuser01@example.org', 'testuser01@example.org'),
    ('7e000000-0000-0000-0000-000000000002', 'Old Template',           'A deleted template',   true,  'testuser01@example.org', 'testuser01@example.org')
ON CONFLICT (id) DO NOTHING;

-- Top-level attributes on the active template (sub-attributes come via attr_attrs).
-- No unique constraint on template_attrs, so guard with NOT EXISTS.
INSERT INTO metadata.template_attrs (template_id, attribute_id, display_order)
SELECT v.template_id, v.attribute_id, v.display_order
FROM (VALUES
    ('7e000000-0000-0000-0000-000000000001'::uuid, 'a7000000-0000-0000-0000-000000000001'::uuid, 0),
    ('7e000000-0000-0000-0000-000000000001'::uuid, 'a7000000-0000-0000-0000-000000000002'::uuid, 1),
    ('7e000000-0000-0000-0000-000000000001'::uuid, 'a7000000-0000-0000-0000-000000000003'::uuid, 2),
    ('7e000000-0000-0000-0000-000000000001'::uuid, 'a7000000-0000-0000-0000-000000000004'::uuid, 3),
    ('7e000000-0000-0000-0000-000000000001'::uuid, 'a7000000-0000-0000-0000-000000000005'::uuid, 4)
) AS v(template_id, attribute_id, display_order)
WHERE NOT EXISTS (
    SELECT 1 FROM metadata.template_attrs ta
    WHERE ta.template_id = v.template_id AND ta.attribute_id = v.attribute_id);

COMMIT;
