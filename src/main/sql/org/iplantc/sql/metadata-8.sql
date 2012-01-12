--
-- Create tables/sequences
--
CREATE SEQUENCE integration_data_id_seq;
CREATE TABLE integration_data (
       id               BIGINT PRIMARY KEY DEFAULT nextval('integration_data_id_seq'),
       integrator_name  VARCHAR(255),
       integrator_email VARCHAR(255)
);

CREATE SEQUENCE deployed_component_data_files_id_seq;
CREATE TABLE deployed_component_data_files (
       id                         BIGINT PRIMARY KEY DEFAULT nextval('deployed_component_data_files_id_seq'),
       filename                   VARCHAR(1024) NOT NULL,
       input_file                 BOOLEAN DEFAULT TRUE,
       deployed_component_id      BIGINT REFERENCES deployed_components(hid)
);
COMMENT ON COLUMN deployed_component_data_files.input_file IS 
        'True if the filename in the table is an input file.  False if the filename is for an output file.';

ALTER TABLE transformation_activity ADD COLUMN integration_data_id BIGINT;
ALTER TABLE deployed_components ADD COLUMN integration_data_id BIGINT;

INSERT INTO integration_data (integrator_name, integrator_email) VALUES
       ('No name', 'noreply@iplantcollaborative.org');

UPDATE transformation_activity
SET    integration_data_id = currval('integration_data_id_seq');

UPDATE deployed_components
SET    integration_data_id = currval('integration_data_id_seq');

--
-- Add any constraints that couldn't be added before data migration
--
ALTER TABLE transformation_activity 
      ADD CONSTRAINT trans_act_integration_data_id_fk FOREIGN KEY (integration_data_id)
      REFERENCES integration_data(id),
      ALTER COLUMN integration_data_id SET NOT NULL;

ALTER TABLE deployed_components
      ADD CONSTRAINT deployed_comp_integration_data_id_fk FOREIGN KEY (integration_data_id)
      REFERENCES integration_data(id),
      ALTER COLUMN integration_data_id SET NOT NULL;

-- template_group_template
DELETE FROM template_group_template WHERE hid = 48;

ALTER TABLE template_group_template DROP CONSTRAINT template_group_template_pkey;
ALTER TABLE template_group_template DROP COLUMN hid;
ALTER TABLE template_group_template ADD CONSTRAINT template_group_template_pkey
      PRIMARY KEY (template_group_id, template_id);

CREATE SEQUENCE transformation_activity_references_id_seq;
CREATE TABLE transformation_activity_references (
       id                         BIGINT PRIMARY KEY DEFAULT nextval('transformation_activity_references_id_seq'),
       transformation_activity_id BIGINT NOT NULL REFERENCES transformation_activity(hid),
       reference_text             TEXT NOT NULL
);

ALTER TABLE transformation_activity ADD COLUMN wikiurl VARCHAR(1024);

CREATE TABLE suggested_groups (
       transformation_activity_id BIGINT NOT NULL REFERENCES transformation_activity(hid),
       template_group_id          BIGINT NOT NULL REFERENCES template_group(hid),

       PRIMARY KEY (transformation_activity_id, template_group_id)
);