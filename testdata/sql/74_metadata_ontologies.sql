-- A synthetic ontology with classes and a parent/child hierarchy. The metadata
-- service exposes these through the ontology/hierarchy endpoints, and the apps
-- service's app-hierarchy features classify apps against an active ontology.
-- ontologies is keyed by `version` (text PK) and requires non-null `xml`;
-- ontology_classes/ontology_hierarchies reference it by that version string.
-- ontology_hierarchies uses (class_iri = parent, subclass_iri = child).
BEGIN;
SET search_path = metadata, public, pg_catalog;

INSERT INTO metadata.ontologies (version, iri, created_by, deleted, xml) VALUES
    ('test-ontology-1.0', 'http://edamontology.org/test', 'testuser01@example.org', false,
        '<?xml version="1.0"?><rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"><!-- synthetic test ontology --></rdf:RDF>')
ON CONFLICT (version) DO NOTHING;

-- Classes: a root topic with two child topics.
INSERT INTO metadata.ontology_classes (ontology_version, iri, label, description) VALUES
    ('test-ontology-1.0', 'http://edamontology.org/topic_0003', 'Topic',      'Root topic'),
    ('test-ontology-1.0', 'http://edamontology.org/topic_0091', 'Genomics',   'Genomics topic'),
    ('test-ontology-1.0', 'http://edamontology.org/topic_3168', 'Sequencing', 'Sequencing topic')
ON CONFLICT (ontology_version, iri) DO NOTHING;

-- Hierarchy: the two child topics are subclasses of the root topic.
INSERT INTO metadata.ontology_hierarchies (ontology_version, class_iri, subclass_iri) VALUES
    ('test-ontology-1.0', 'http://edamontology.org/topic_0003', 'http://edamontology.org/topic_0091'),
    ('test-ontology-1.0', 'http://edamontology.org/topic_0003', 'http://edamontology.org/topic_3168')
ON CONFLICT (ontology_version, class_iri, subclass_iri) DO NOTHING;

COMMIT;
