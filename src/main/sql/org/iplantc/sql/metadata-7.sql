\set ON_ERROR_STOP ON

BEGIN;

ALTER TABLE transformation RENAME TO transformations;

CREATE SEQUENCE transformations_id_seq;
ALTER TABLE transformations ALTER COLUMN id SET DEFAULT nextval('transformations_id_seq');

SELECT setval('transformations_id_seq', (SELECT max(id) FROM transformations));
-- transformation_values
ALTER TABLE transformation_value RENAME TO transformation_values;

CREATE SEQUENCE transformation_values_id_seq;
ALTER TABLE transformation_values 
      DROP CONSTRAINT transformation_value_pkey,
      ADD COLUMN id bigint,
      ALTER COLUMN id SET DEFAULT nextval('transformation_values_id_seq'),
      ADD CONSTRAINT transformation_values_unique UNIQUE (transformation_id, property);

UPDATE transformation_values
SET    id = nextval('transformation_values_id_seq');

ALTER TABLE transformation_values ADD CONSTRAINT transformation_values_pkey PRIMARY KEY (id);
-- precedence_constraint
CREATE SEQUENCE precedence_constraints_id_seq;

ALTER TABLE precedence_constraint RENAME TO precedence_constraints;

ALTER TABLE precedence_constraints RENAME COLUMN id TO guid;
ALTER TABLE precedence_constraints RENAME COLUMN hid TO id;
ALTER TABLE precedence_constraints ALTER COLUMN id SET DEFAULT nextval('precedence_constraints_id_seq');
-- transformation_steps
ALTER TABLE transformation_step RENAME TO transformation_steps;

CREATE SEQUENCE transformation_steps_id_seq;
ALTER TABLE transformation_steps RENAME COLUMN id TO guid;
ALTER TABLE transformation_steps RENAME COLUMN hid TO id;
ALTER TABLE transformation_steps ALTER COLUMN id SET DEFAULT nextval('transformation_steps_id_seq');

SELECT setval('transformation_steps_id_seq', (SELECT max(id) FROM transformation_steps));
-- step_precedence
CREATE SEQUENCE step_precedence_id_seq;
ALTER TABLE step_precedence RENAME COLUMN id TO guid;
ALTER TABLE step_precedence RENAME COLUMN hid TO id;
ALTER TABLE step_precedence ALTER COLUMN id SET DEFAULT nextval('step_precedence_id_seq');

ALTER TABLE step_precedence RENAME TO step_precedences;
-- data_formats
ALTER TABLE data_format RENAME TO data_formats;

ALTER TABLE data_formats RENAME COLUMN id TO guid;
ALTER TABLE data_formats RENAME COLUMN hid TO id;
ALTER TABLE data_formats DROP COLUMN description;

CREATE SEQUENCE data_formats_id_seq;
ALTER TABLE data_formats ALTER COLUMN id SET DEFAULT nextval('data_formats_id_seq');

SELECT setval('data_formats_id_seq', (SELECT max(id) FROM data_formats));

COMMIT;