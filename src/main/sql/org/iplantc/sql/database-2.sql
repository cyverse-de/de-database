-- guilty-party: hariolf, Hariolf Haefele <hariolf@iplantcollaborative.org>
-- guilty-party: evan, Evan Deaubl <evan@iplantcollaborative.org>
-- date: July 14, 2010, September 2, 2010

\set ON_ERROR_STOP ON

BEGIN;

-- Define table to support Taxonomic Name Resolution Service

CREATE TABLE name (
	nameID BIGINT,
	scientificName VARCHAR(200),
	scientificNameAuthorship VARCHAR(200),
	nameRank VARCHAR(50),
	namePublicationYear BIGINT,
	taxonomicStatus VARCHAR(50),
	taxonRemarks VARCHAR(200),
	namePublicationReferenceID BIGINT,
	temp_fk BIGINT,
	PRIMARY KEY(nameID)
);
CREATE SEQUENCE seq_name_nameid;

CREATE TABLE source(
	sourceID BIGINT,
	referenceID BIGINT,
	sourceName VARCHAR(200),
	sourceType VARCHAR(50),
	sourceUrl VARCHAR(200),
	sourceReferenceID BIGINT,
	PRIMARY KEY(sourceID)
);

CREATE TABLE nameSource (
	nameSourceID BIGINT,
	nameID BIGINT REFERENCES name(nameID),
	sourceID BIGINT REFERENCES source(sourceID),
	nameSourceUrl VARCHAR(200),
	nameSourceOriginalID BIGINT,
	dateAccessed TIMESTAMP,
	dateCreated TIMESTAMP,
	PRIMARY KEY(nameSourceID)
);
CREATE SEQUENCE seq_nameSource_nameId;

CREATE TABLE classification (
	classificationID BIGINT,
	sourceID BIGINT,
	nameID BIGINT,
	parentNameID BIGINT,
	leftIndex BIGINT,
	rightIndex BIGINT,
	PRIMARY KEY(classificationID)
);
CREATE SEQUENCE seq_classificationId_classification;

CREATE TABLE nameParsed(
	nameID BIGINT REFERENCES name(nameID),
	scientificNameWithAuthor VARCHAR(200),
	genusHybridX VARCHAR(200),
	genus VARCHAR(200),
	speciesHybridX VARCHAR(200),
	specificEpithet VARCHAR(200),
	rankIndicator VARCHAR(12),
	infraspecificHybridX VARCHAR(200),
	infraspecificEpithet VARCHAR(200),
	infraspecificHybridX2 VARCHAR(200),
	infraspecificRank2 VARCHAR(200),
	infraspecificEpithet2 VARCHAR(200),
	otherEpithet VARCHAR(100),
	isHybrid BOOLEAN,
	isNamedHybrid BOOLEAN,
	isHybridFormula BOOLEAN,
	PRIMARY KEY(nameID)
);

CREATE TABLE defaultClassification(
	nameID BIGINT REFERENCES name(nameID),
	subclassTropicos VARCHAR(200),
	familyTropicos VARCHAR(200),
	orderApg3 VARCHAR(200),
	familyApg3 VARCHAR(200)
);

CREATE TABLE tropicosRawData1 (
	id BIGINT,
	TropicosNameID BIGINT,
	ParentTropicosNameID BIGINT,
	NameWithoutAuthors VARCHAR(250),
	Authors VARCHAR(100),
	Rank VARCHAR(50),
	Source VARCHAR(250),
	IsHybrid BOOLEAN,
	Genus VARCHAR(100),
	SpecificEpithet VARCHAR(100),
	OtherEpithet VARCHAR(100),
        PRIMARY KEY("id")
);

CREATE TABLE tropicosRawData2 (
	id BIGINT,
	TropicosNameID BIGINT,
	ParentTropicosNameID BIGINT,
	NameWithoutAuthors VARCHAR(250),
	Authors VARCHAR(100),
	Rank VARCHAR(50),
	Source VARCHAR(250),
	IsHybrid BOOLEAN,
	Genus VARCHAR(100),
	SpecificEpithet VARCHAR(100),
	OtherEpithet VARCHAR(100),
	Subclass VARCHAR(100),
	family VARCHAR(100),
	rankIndicator VARCHAR(12),
	infraEpithet VARCHAR(100),
	fk_nameId BIGINT,
	fk_parentNameId BIGINT,
	leftIndex BIGINT,
	rightIndex BIGINT,
	nullParentFlag BOOLEAN,
        PRIMARY KEY("id")
);

-- add data migration or additions to the end of the file, before COMMIT

CREATE TABLE "recordtable" ("id" BIGINT,
       "file" BIGINT REFERENCES "file"("id"),
       PRIMARY KEY("id")
);

CREATE TABLE "recordtablefield" ("id" BIGINT,
       "name" VARCHAR(512),
       "recordtable_id" BIGINT REFERENCES "recordtable"("id"),
       "index" INTEGER,
       PRIMARY KEY("id")
);

CREATE TABLE "recordtablerecord" ("id" BIGINT,
       "recordtable_id" BIGINT REFERENCES "recordtable"("id"),
       "index" INTEGER,
       PRIMARY KEY("id")
);

CREATE TABLE "recordtablevalue" ("id" BIGINT,
       "recordtablerecord" BIGINT REFERENCES "recordtablerecord"("id"),
       "recordtablefield" BIGINT REFERENCES "recordtablefield"("id"),
       "value" VARCHAR(512),
       PRIMARY KEY("id")
);

INSERT INTO "file_type" ("id", "description") VALUES (15, 'CSV Name List');
INSERT INTO "file_type" ("id", "description") VALUES (16, 'Taxamatch Result');
INSERT INTO "file_type" ("id", "description") VALUES (17, 'Taxamatch Name List');

INSERT INTO "predicate_lookup" ("id", "description") values (19, 'has_Annotation');

-- update the version

COMMIT;
