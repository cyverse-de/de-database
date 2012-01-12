
-- guilty-party: lenards, Andrew Lenards <lenards@iplantcollaborative.org>
-- date: Sept. 30, 2009

-- Rollback the transaction on the first failure
\set ON_ERROR_STOP ON

BEGIN;

/**
 * create a version table w/ a single column named 'version' that has a single 
 * row that indicates the current version of the database schema
 */

CREATE TABLE "version" ("version" INTEGER);

/**
 * Physical data model for Iteration 0 
 */

CREATE TABLE "hibernate_sequence" ("next_val" BIGINT);

INSERT INTO "hibernate_sequence" ("next_val") values (256);

CREATE TABLE "jobs" ("id" BIGINT,
       "user_id" VARCHAR(256) NOT NULL,
       "name" VARCHAR(512),
       "description" VARCHAR(2048),
       "state" VARCHAR(50) NOT NULL,
       "submit_time" TIMESTAMP NOT NULL,
       "start_time" TIMESTAMP,
       "end_time" TIMESTAMP,
       PRIMARY KEY("id")
);

CREATE TABLE "provenance_action" ("id" BIGINT,
       "action_type" VARCHAR(50) NOT NULL,
       "description" VARCHAR(2048),
       PRIMARY KEY("id")
);

CREATE TABLE "provenance_device" ("id" BIGINT,
       "device_type" VARCHAR(2) NOT NULL,
       "name" VARCHAR(256) NOT NULL,
       "device_version" VARCHAR(256),
       PRIMARY KEY("id")
);

INSERT INTO "provenance_device" ("id", "device_type", "name", "device_version") VALUES (1, 'SW', 'Independent Contrast', '');

CREATE TABLE "provenance_job" ("id" BIGINT,
       "device_id" BIGINT NOT NULL REFERENCES "provenance_device"("id"),
       PRIMARY KEY("id")
);

CREATE TABLE "provenance_param" ("id" BIGINT,
       "name" VARCHAR(256) NOT NULL,
       "value" TEXT NOT NULL,
       "job_id" BIGINT REFERENCES "provenance_job"("id"),
       PRIMARY KEY("id")
);

CREATE TABLE "provenance_event" ("id" BIGINT,
       "start_time" TIMESTAMP NOT NULL,
       "end_time" TIMESTAMP,
       "event_type" VARCHAR(50) NOT NULL,
       "reason" VARCHAR(2048),
       "action_id" BIGINT NOT NULL REFERENCES "provenance_action"("id"),
       "job_id" BIGINT REFERENCES "provenance_job"("id"),
       PRIMARY KEY("id")
);

CREATE TABLE "provenance_agent_role" ("id" BIGINT,
       "event_id" BIGINT NOT NULL REFERENCES "provenance_event"("id"),
       "username" VARCHAR(256) NOT NULL,
       "role_type" VARCHAR(50),
       PRIMARY KEY("id")
);

CREATE TABLE "provenance_location" ("id" BIGINT,
       "event_id" BIGINT NOT NULL REFERENCES "provenance_event"("id"),
       "file_id" BIGINT NOT NULL,
       "file_version" BIGINT NOT NULL,
       "file_name" VARCHAR(512) NOT NULL,
       "location_type" VARCHAR(50) NOT NULL,
       "path_name" VARCHAR(2048) NOT NULL,
       "child_id" BIGINT,
       "child_type" VARCHAR(50),
       "child_name" VARCHAR(512),
       PRIMARY KEY("id")
);

CREATE TABLE "provenance" (
       "event_id" BIGINT NOT NULL REFERENCES "provenance_event"("id"),
       "index" INTEGER,
       "text" text, 
       PRIMARY KEY("event_id", "index")
);


CREATE TABLE "annotation" ("id" BIGINT, PRIMARY KEY("id"));

CREATE TABLE "thing_type_code" ("id" BIGINT,
       "description" VARCHAR(512) NOT NULL, PRIMARY KEY("id")
);

INSERT INTO "thing_type_code" ("id", "description") values (1, 'TU');
INSERT INTO "thing_type_code" ("id", "description") values (2, 'RootedTree');
INSERT INTO "thing_type_code" ("id", "description") values (3, 'Node');
INSERT INTO "thing_type_code" ("id", "description") values (4, 'Edge');
INSERT INTO "thing_type_code" ("id", "description") values (5, 'CharacterStateDataMatrix');
INSERT INTO "thing_type_code" ("id", "description") values (6, 'Character');
INSERT INTO "thing_type_code" ("id", "description") values (7, 'CharacterStateDatum');
INSERT INTO "thing_type_code" ("id", "description") values (8, 'List');
INSERT INTO "thing_type_code" ("id", "description") values (9, 'ListEntry');

CREATE TABLE "thing" ("id" BIGINT, 
       "name" VARCHAR(512),
       "type" BIGINT REFERENCES "thing_type_code"("id"),
       PRIMARY KEY("id")
);

CREATE TABLE "predicate_lookup" ("id" BIGINT,
       "description" VARCHAR(512) NOT NULL, PRIMARY KEY("id")
);

INSERT INTO "predicate_lookup" ("id", "description") values (1, 'has_Parent');
INSERT INTO "predicate_lookup" ("id", "description") values (2, 'represents_TU');
INSERT INTO "predicate_lookup" ("id", "description") values (3, 'belongs_to_Edge_as_Parent');
INSERT INTO "predicate_lookup" ("id", "description") values (4, 'belongs_to_Edge_as_Child');
INSERT INTO "predicate_lookup" ("id", "description") values (5, 'EdgeLength');
INSERT INTO "predicate_lookup" ("id", "description") values (6, 'has_Continuous_Datum');
INSERT INTO "predicate_lookup" ("id", "description") values (7, 'has_Continuous_State');
INSERT INTO "predicate_lookup" ("id", "description") values (8, 'has_Root');
INSERT INTO "predicate_lookup" ("id", "description") values (9, 'has_Character');
INSERT INTO "predicate_lookup" ("id", "description") values (10, 'belongs_to_TU');
INSERT INTO "predicate_lookup" ("id", "description") values (11, 'has_TU');
INSERT INTO "predicate_lookup" ("id", "description") values (12, 'has_Row_List');
INSERT INTO "predicate_lookup" ("id", "description") values (13, 'has_Column_List');
INSERT INTO "predicate_lookup" ("id", "description") values (14, 'has_item');
INSERT INTO "predicate_lookup" ("id", "description") values (15, 'first_entry');
INSERT INTO "predicate_lookup" ("id", "description") values (16, 'last_entry');
INSERT INTO "predicate_lookup" ("id", "description") values (17, 'next_entry');
INSERT INTO "predicate_lookup" ("id", "description") values (18, 'sort_order');

CREATE TABLE "triple" ("id" BIGINT, 
       "subject" BIGINT REFERENCES "thing"("id"), 
       "predicate" BIGINT NOT NULL REFERENCES "predicate_lookup"("id"), 
       "object" BIGINT REFERENCES "thing"("id"),
       "double" FLOAT(53),
       "string" TEXT,
       PRIMARY KEY("id")
);

CREATE TABLE "graph" ("id" BIGINT,
       "discriminator" VARCHAR(10) NOT NULL,
       "label" VARCHAR(512),
       "root_thing_id" BIGINT REFERENCES "thing"("id"),
       PRIMARY KEY("id")
);

CREATE TABLE "graph_thing" ("graph_id" BIGINT REFERENCES "graph"("id"), 
       "thing_id" BIGINT REFERENCES "thing"("id")
);

CREATE TABLE "graph_triple" ("graph_id" BIGINT REFERENCES "graph"("id"), 
       "triple_id" BIGINT REFERENCES "triple"("id")
);


CREATE TABLE "file_type" ("id" BIGINT,
	"description" VARCHAR(512),
	PRIMARY KEY("id")
);

INSERT INTO "file_type" ("id", "description") VALUES (0, 'Unknown');
INSERT INTO "file_type" ("id", "description") VALUES (1, 'Newick');
INSERT INTO "file_type" ("id", "description") VALUES (2, 'NEXUS with unrecognized data');
INSERT INTO "file_type" ("id", "description") VALUES (3, 'NEXUS with tree data');
INSERT INTO "file_type" ("id", "description") VALUES (4, 'NEXUS with trait data');
INSERT INTO "file_type" ("id", "description") VALUES (5, 'NEXUS with tree and trait data');
INSERT INTO "file_type" ("id", "description") VALUES (6, 'CSV trait data');
INSERT INTO "file_type" ("id", "description") VALUES (7, 'Text file');

CREATE TABLE "file" ("id" BIGINT,
       "version_number" BIGINT NOT NULL,
       "name" VARCHAR(512),
       "type" BIGINT REFERENCES "file_type"("id"),
       "taxa_id" BIGINT REFERENCES "graph"("id"),
       "uploaded" TIMESTAMP,
       "status" VARCHAR(512),
       PRIMARY KEY("id")
);

CREATE TABLE "block_type" ("id" BIGINT,
       "description" VARCHAR(512) NOT NULL, PRIMARY KEY("id")
);

INSERT INTO "block_type" ("id", "description") VALUES (0, 'Unknown');
INSERT INTO "block_type" ("id", "description") VALUES (1, 'CHARACTERS');
INSERT INTO "block_type" ("id", "description") VALUES (2, 'TREES');
INSERT INTO "block_type" ("id", "description") VALUES (3, 'TAXA');
INSERT INTO "block_type" ("id", "description") VALUES (4, 'COMMENT');

CREATE TABLE "block" ("id" BIGINT,
       "type" BIGINT REFERENCES "block_type"("id"),
       "file" BIGINT REFERENCES "file"("id"),
       "parent_order" INTEGER,
       "unknown_type" VARCHAR(512),
       "content" TEXT,
       PRIMARY KEY("id")
);

CREATE TABLE "block_graph" ("block_id" BIGINT REFERENCES "block"("id"),
       "graph_id" BIGINT REFERENCES "graph"("id")
);

CREATE TABLE "statement_type" ("id" BIGINT,
       "description" VARCHAR(512) NOT NULL, PRIMARY KEY("id")
);

INSERT INTO "statement_type" ("id", "description") VALUES (0, 'Unknown');
INSERT INTO "statement_type" ("id", "description") VALUES (1, 'DIMENSIONS NCHAR');
INSERT INTO "statement_type" ("id", "description") VALUES (2, 'FORMAT');
INSERT INTO "statement_type" ("id", "description") VALUES (3, 'CHARSTATELABELS');
INSERT INTO "statement_type" ("id", "description") VALUES (4, 'MATRIX');
INSERT INTO "statement_type" ("id", "description") VALUES (5, 'TREE');
INSERT INTO "statement_type" ("id", "description") VALUES (6, 'DIMENSIONS NTAX');
INSERT INTO "statement_type" ("id", "description") VALUES (7, 'TAXLABELS');
INSERT INTO "statement_type" ("id", "description") VALUES (8, 'COMMENT');

CREATE TABLE "statement" ("id" BIGINT,
       "type" BIGINT REFERENCES "statement_type"("id"),
       "block" BIGINT REFERENCES "block"("id"),
       "parent_order" INTEGER,
       "content" TEXT,
       PRIMARY KEY("id")
);

CREATE TABLE "statement_graph" ("statement_id" BIGINT REFERENCES "statement"("id"),
       "graph_id" BIGINT REFERENCES "graph"("id")
);


CREATE TABLE "file_tree" ("file_id" BIGINT REFERENCES "file"("id"),
       "tree_id" BIGINT REFERENCES "graph"("id")
);

CREATE TABLE "file_matrix" ("file_id" BIGINT REFERENCES "file"("id"),
       "matrix_id" BIGINT REFERENCES "graph"("id")
);


ALTER TABLE "graph" ADD COLUMN "file_id" BIGINT REFERENCES "file"("id");


CREATE TABLE "folder" ("id" BIGINT,
	"label" VARCHAR(512),
	PRIMARY KEY("id")
);

CREATE TABLE "folder_folder" ("parent_folder_id" BIGINT REFERENCES "folder"("id"),
	"child_folder_id" BIGINT REFERENCES "folder"("id")
);

CREATE TABLE "folder_file" ("folder_id" BIGINT REFERENCES "folder"("id"),
	"file_id" BIGINT REFERENCES "file"("id")
);

CREATE TABLE "workspace" ("id" BIGINT,
	"user_id" VARCHAR(512) NOT NULL,
	"home_folder" BIGINT REFERENCES "folder"("id"),
	"upload_folder" BIGINT REFERENCES "folder"("id"),
	PRIMARY KEY("id")
);

/*
 * Until we have users, we need to have a dummy workspace that acts as the central
 * workspace for the app
 */
INSERT INTO "folder" ("id", "label") VALUES (2, 'ana');
INSERT INTO "folder" ("id", "label") VALUES (3, 'Data');
INSERT INTO "folder" ("id", "label") VALUES (4, 'TestData');
INSERT INTO "folder_folder" ("parent_folder_id", "child_folder_id") VALUES (2, 3);
INSERT INTO "folder_folder" ("parent_folder_id", "child_folder_id") VALUES (2, 4);
INSERT INTO "workspace" ("id", "user_id", "home_folder", "upload_folder") VALUES (1, 'ana', 2, 3);

INSERT INTO "folder" ("id", "label") VALUES (6, 'de_testdata@iplantcollaborative.org');
INSERT INTO "folder" ("id", "label") VALUES (7, 'Data');
INSERT INTO "folder" ("id", "label") VALUES (8, 'TestData');
INSERT INTO "folder_folder" ("parent_folder_id", "child_folder_id") VALUES (6, 7);
INSERT INTO "folder_folder" ("parent_folder_id", "child_folder_id") VALUES (6, 8);
INSERT INTO "workspace" ("id", "user_id", "home_folder", "upload_folder") VALUES (5, 'de_testdata@iplantcollaborative.org', 6, 7);

CREATE TABLE "contrast_job" ("id" BIGINT,
	"configuration" TEXT,
	"name" VARCHAR(512) NOT NULL,
	"username" VARCHAR(512) NOT NULL,
	"created" TIMESTAMP NOT NULL,
	"status" VARCHAR(50) NOT NULL,
	"workspace_id" BIGINT REFERENCES "workspace"("id"),
	PRIMARY KEY("id")
);

/**
 * after successful completion (at the end of the transaction), a script should
 * be expected to update 'version' (this script will set version = 0, 
 * database-1.sql will set version = 1, etc.)
 */
INSERT INTO "version" ("version")
VALUES (0);

COMMIT;
