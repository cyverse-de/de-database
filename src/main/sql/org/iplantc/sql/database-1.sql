-- guilty-party: lenards, Andrew Lenards <lenards@iplantcollaborative.org>
-- date: April 28, 2010

\set ON_ERROR_STOP ON

BEGIN;

-- add data migration here
ALTER TABLE "workspace" DROP "upload_folder";

ALTER TABLE "file" ADD COLUMN "url" VARCHAR(512);

INSERT INTO "file_type" ("id", "description") VALUES (8, 'FASTA file');
INSERT INTO "file_type" ("id", "description") VALUES (9, 'FASTQ file');
INSERT INTO "file_type" ("id", "description") VALUES (10, 'SAM file');
INSERT INTO "file_type" ("id", "description") VALUES (11, 'BAM file');
INSERT INTO "file_type" ("id", "description") VALUES (12, 'Pileup file');
INSERT INTO "file_type" ("id", "description") VALUES (13, 'VCF 3.3 file');
INSERT INTO "file_type" ("id", "description") VALUES (14, 'Barcode file');

ALTER TABLE "file" ADD COLUMN "description" VARCHAR(512);

-- define new additions here 
CREATE TABLE "user_jobs" ("id" BIGINT,
       "workspace_id" BIGINT NOT NULL,
       "username" VARCHAR(1024) NOT NULL,
       "job_type" VARCHAR(512) NOT NULL,
       "job_name" VARCHAR(512),
       "description" TEXT,
       "status" VARCHAR(50) NOT NULL,
       "configuration" TEXT,
       "external_data" TEXT,
       "create_time" TIMESTAMP NOT NULL,
       "submit_time" TIMESTAMP,
       "start_time" TIMESTAMP,
       "end_time" TIMESTAMP,
       PRIMARY KEY("id")
);

ALTER TABLE "file" ADD COLUMN "preview" TEXT;

-- update the version 

COMMIT;

