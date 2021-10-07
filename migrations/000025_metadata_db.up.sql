BEGIN;
    CREATE SCHEMA IF NOT EXISTS metadata;
    SET search_path = metadata, public, pg_catalog;

    -- dependency free tables: avus, comments, ratings, favorites, file links
    CREATE TABLE avus (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        attribute TEXT,
        value TEXT,
        unit TEXT,
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        created_by varchar(512) NOT NULL,
        modified_by varchar(512) NOT NULL,
        created_on timestamp DEFAULT now() NOT NULL,
        modified_on timestamp DEFAULT now() NOT NULL,
    
        UNIQUE (target_id, target_type, attribute, value, unit),
        PRIMARY KEY (id)
    );
    
    CREATE INDEX avus_target_id_idx ON avus(target_id, target_type);
    CREATE INDEX avus_avu_idx ON avus(attribute, value, unit);

    CREATE TABLE comments (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        value TEXT NOT NULL,
        post_time timestamp DEFAULT now() NOT NULL,
        retracted BOOLEAN NOT NULL DEFAULT false,
        retracted_by varchar(512) DEFAULT NULL,
        deleted BOOLEAN NOT NULL DEFAULT false,
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        owner_id varchar(512) NOT NULL,

	PRIMARY KEY (id)
    );
    
    CREATE INDEX comments_target_id_idx ON comments(target_id);

    CREATE TABLE ratings (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        rating integer NOT NULL,
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        owner_id varchar(512) NOT NULL,
        created_on timestamp DEFAULT now() NOT NULL,

	PRIMARY KEY (id)
    );
    
    CREATE INDEX ratings_target_id_idx ON ratings(target_id);
    CREATE INDEX ratings_owner_id_idx ON ratings(owner_id);

    CREATE TABLE favorites (
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        owner_id varchar(512) NOT NULL,
        created_on timestamp DEFAULT now() NOT NULL,

	PRIMARY KEY (owner_id, target_id)
    );

    CREATE TABLE file_links (
        file_id UUID NOT NULL,
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        owner_id varchar(512) NOT NULL,
        created_on timestamp DEFAULT now() NOT NULL,

	PRIMARY KEY (file_id, target_id, owner_id)
    );
    
    CREATE INDEX file_links_target_id_idx ON file_links(target_id);

    -- Tags and tag attachments
    CREATE TABLE tags (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        value VARCHAR(255) NOT NULL,
        description TEXT,
        public BOOLEAN NOT NULL DEFAULT false,
        owner_id varchar(512),
        created_on timestamp DEFAULT now() NOT NULL,
        modified_on timestamp DEFAULT now() NOT NULL,

	UNIQUE (value, owner_id),
	PRIMARY KEY (id)
    );
    
    CREATE INDEX tags_owner_id_idx ON tags(owner_id);

    CREATE TABLE attached_tags (
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        tag_id UUID NOT NULL,
        attacher_id VARCHAR (512),
        attached_on TIMESTAMP NOT NULL DEFAULT now(),
        detacher_id VARCHAR (512) DEFAULT NULL,
        detached_on TIMESTAMP DEFAULT NULL,

	FOREIGN KEY (tag_id) REFERENCES tags(id)
    );
    
    CREATE INDEX attached_tags_target_id_idx ON attached_tags(target_id);
    CREATE INDEX attached_tags_tag_id_idx ON attached_tags(tag_id);

    -- attributes

    CREATE TABLE value_types (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        name varchar(64) NOT NULL,

	UNIQUE (name),
	PRIMARY KEY (id)
    );

    CREATE TABLE attributes (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        name varchar(64) NOT NULL,
        description text NOT NULL,
        required boolean NOT NULL DEFAULT FALSE,
        value_type_id uuid NOT NULL,
        settings json,
        created_by varchar(512) NOT NULL,
        modified_by varchar(512) NOT NULL,
        created_on timestamp DEFAULT now() NOT NULL,
        modified_on timestamp DEFAULT now() NOT NULL,

	FOREIGN KEY (value_type_id) REFERENCES value_types(id),
	PRIMARY KEY (id)
    );

    CREATE TABLE attr_synonyms (
        attribute_id uuid NOT NULL,
        synonym_id uuid NOT NULL,

	FOREIGN KEY (attribute_id) REFERENCES attributes(id) ON DELETE CASCADE,
	FOREIGN KEY (synonym_id) REFERENCES attributes(id) ON DELETE CASCADE
    );

    CREATE INDEX attr_synonyms_attribute_id ON attr_synonyms(attribute_id);
    CREATE INDEX attr_synonyms_synonym_id ON attr_synonyms(synonym_id);

    CREATE TABLE attr_enum_values (
        id uuid NOT NULL DEFAULT (uuid_generate_v1()),
        attribute_id uuid NOT NULL,
        value text NOT NULL,
        is_default boolean NOT NULL DEFAULT false,
        display_order integer NOT NULL DEFAULT 0,

	FOREIGN KEY (attribute_id) REFERENCES attributes(id) ON DELETE CASCADE,
	UNIQUE (attribute_id, value)
	PRIMARY KEY (id)
    );

    CREATE INDEX attr_enum_values_attribute_id ON attr_enum_values(attribute_id);

    CREATE TABLE attr_attrs (
        parent_id uuid NOT NULL,
        child_id uuid NOT NULL,
        display_order integer NOT NULL,

	FOREIGN KEY (parent_id) REFERENCES attributes(id) ON DELETE CASCADE,
	FOREIGN KEY (child_id) REFERENCES attributes(id) ON DELETE CASCADE,
	CHECK (parent_id != child_id)
    );

    CREATE INDEX attr_attrs_parent_id ON attr_attrs(parent_id);
    CREATE UNIQUE INDEX attr_attrs_child_id ON attr_attrs(child_id);

    CREATE OR REPLACE FUNCTION attribute_synonyms(uuid)
    RETURNS
    TABLE(
        id uuid,
        name varchar(64),
        description varchar(1024),
        required boolean,
        value_type_id uuid
    ) AS $$
        WITH RECURSIVE synonyms(attribute_id, synonym_id) AS (
                SELECT attribute_id, synonym_id
                FROM attr_synonyms
            UNION
                SELECT s.attribute_id AS attribute_id,
                       s0.synonym_id AS synonym_id
                FROM attr_synonyms s, synonyms s0
                WHERE s0.attribute_id = s.synonym_id
        )
        SELECT a.id, a.name, a.description, a.required, a.value_type_id
        FROM (
                SELECT synonym_id AS id FROM synonyms
                WHERE attribute_id = $1
                AND synonym_id != $1
            UNION
                SELECT attribute_id AS id FROM synonyms
                WHERE synonym_id = $1
                AND synonym_id != $1
        ) AS s
        JOIN attributes a ON s.id = a.id
    $$ LANGUAGE SQL;

    -- templates

    CREATE TABLE templates (
        id uuid NOT NULL DEFAULT uuid_generate_v1(),
        name varchar(64) NOT NULL,
        description text,
        deleted boolean DEFAULT FALSE NOT NULL,
        created_by varchar(512) NOT NULL,
        modified_by varchar(512) NOT NULL,
        created_on timestamp DEFAULT now() NOT NULL,
        modified_on timestamp DEFAULT now() NOT NULL,

	PRIMARY KEY (id)
    );

    CREATE TABLE template_attrs (
        template_id uuid NOT NULL,
        attribute_id uuid NOT NULL,
        display_order integer NOT NULL,

	FOREIGN KEY (template_id) REFERENCES templates(id) ON DELETE CASCADE,
	FOREIGN KEY (attribute_id) REFERENCES attributes(id) ON DELETE CASCADE
    );

    CREATE INDEX template_attrs_template_id ON template_attrs(template_id);
    CREATE INDEX template_attrs_attribute_id ON template_attrs(attribute_id);

    -- permanent ID requests

    CREATE TABLE permanent_id_request_types (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        type VARCHAR NOT NULL,
        description TEXT NOT NULL,

	UNIQUE (type),
	PRIMARY KEY (id)
    );

    CREATE TABLE permanent_id_requests (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        requested_by varchar(512) NOT NULL,
        type UUID,
        target_id UUID NOT NULL,
        target_type target_enum NOT NULL,
        original_path TEXT,
        permanent_id TEXT,

	UNIQUE (target_id, type),
	FOREIGN KEY (type) REFERENCES permanent_id_request_types(id),
	PRIMARY KEY (id)
    );

    CREATE TABLE permanent_id_request_status_codes (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        name VARCHAR(64) NOT NULL,
        description TEXT NOT NULL,

	UNIQUE (name),
	PRIMARY KEY (id)
    );

    CREATE TABLE permanent_id_request_statuses (
        id UUID NOT NULL DEFAULT uuid_generate_v1(),
        permanent_id_request UUID NOT NULL,
        permanent_id_request_status_code UUID NOT NULL,
        date_assigned TIMESTAMP DEFAULT now() NOT NULL,
        updated_by varchar(512) NOT NULL,
        comments TEXT,

	FOREIGN KEY (permanent_id_request) REFERENCES permanent_id_requests(id) ON DELETE CASCADE,
	FOREIGN KEY (permanent_id_request_status_code) REFERENCES permanent_id_request_status_codes(id),
	PRIMARY KEY (id)
    );

    -- ontologies

    CREATE TABLE ontologies (
        version VARCHAR NOT NULL,
        iri VARCHAR,
        deleted BOOLEAN NOT NULL DEFAULT FALSE,
        created_by VARCHAR(512) NOT NULL,
        created_on TIMESTAMP DEFAULT now() NOT NULL,
        xml TEXT NOT NULL,

        PRIMARY KEY (version)
    );


    CREATE TABLE ontology_classes (
        ontology_version VARCHAR NOT NULL,
        iri VARCHAR NOT NULL,
        label VARCHAR,
        description TEXT,
      
        FOREIGN KEY (ontology_version) REFERENCES ontologies(version) ON DELETE CASCADE,
        PRIMARY KEY (ontology_version, iri)
    );

    CREATE TABLE ontology_hierarchies (
        ontology_version VARCHAR NOT NULL,
        class_iri VARCHAR NOT NULL,
        subclass_iri VARCHAR NOT NULL,
    
        FOREIGN KEY (ontology_version) REFERENCES ontologies(version) ON DELETE CASCADE,
        FOREIGN KEY (ontology_version, class_iri) REFERENCES ontology_classes(ontology_version, iri),
        FOREIGN KEY (ontology_version, subclass_iri) REFERENCES ontology_classes(ontology_version, iri),
        PRIMARY KEY (ontology_version, class_iri, subclass_iri)
    );

    CREATE OR REPLACE FUNCTION ontology_class_hierarchy(VARCHAR, VARCHAR)
    RETURNS
    TABLE(
        parent_iri VARCHAR,
        iri VARCHAR,
        label VARCHAR
    ) AS $$
        WITH RECURSIVE subclasses AS
        (
          (SELECT h.class_iri AS parent_iri, c.iri, c.label
           FROM ontology_classes c
             LEFT JOIN ontology_hierarchies h ON h.ontology_version = $1 AND
                                                 h.subclass_iri = c.iri
           WHERE c.ontology_version = $1 AND
                 c.iri = $2
           LIMIT 1)
          UNION
          (SELECT h.class_iri AS parent_iri, c.iri, c.label
           FROM subclasses sc, ontology_classes c
             JOIN ontology_hierarchies h ON h.subclass_iri = c.iri
           WHERE c.ontology_version = $1 AND
                 h.ontology_version = $1 AND
                 h.class_iri = sc.iri)
        )
        SELECT * FROM subclasses
    $$ LANGUAGE SQL;
COMMIT;
