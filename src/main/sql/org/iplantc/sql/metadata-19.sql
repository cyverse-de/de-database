\set ON_ERROR_STOP ON

BEGIN;

DROP TABLE block_graph;
DROP TABLE statement_graph;
DROP TABLE statement;
DROP TABLE block;

DROP TABLE file_matrix;
DROP TABLE file_tree;
DROP TABLE folder_file;

DROP TABLE recordtablevalue;
DROP TABLE recordtablerecord;
DROP TABLE recordtablefield;
DROP TABLE recordtable;

DROP TABLE graph_triple;
DROP TABLE graph_thing;

DROP TABLE triple;
--DROP TABLE precedence_constraints;
DROP TABLE provenance_action;

-- The file and graph table relationship is circular.  We have to break
-- the foreign key constraints to drop the tables.
ALTER TABLE graph DROP CONSTRAINT "graph_file_id_fkey";
DROP TABLE file;
DROP TABLE graph;
DROP TABLE thing;

COMMIT;
