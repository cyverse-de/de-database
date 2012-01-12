-- guilty-party: lenards, Andrew Lenards <lenards@iplantcollaborative.org>
-- date: August 15, 2011

--------------------------------------------------------------------------------
--
--
--------------------------------------------------------------------------------

--------------------------------------------------
-- SCRIPT OUTLINE --------------------------------
--------------------------------------------------
--
--
--
--
--
--------------------------------------------------


\set ON_ERROR_STOP ON

BEGIN;

--------------------------------------------------

--------------------------------------------------

---

 ALTER TABLE "public"."block" DROP CONSTRAINT "block_file_fkey";
 ALTER TABLE "public"."block" DROP CONSTRAINT "block_type_fkey";
 ALTER TABLE "public"."block_graph" DROP CONSTRAINT "block_graph_block_id_fkey";
 ALTER TABLE "public"."block_graph" DROP CONSTRAINT "block_graph_graph_id_fkey";
 ALTER TABLE "public"."contract_property" DROP CONSTRAINT "contract_property_contract_id_fkey";
 ALTER TABLE "public"."contract_property" DROP CONSTRAINT "contract_property_property_id_fkey";
 ALTER TABLE "public"."contrast_job" DROP CONSTRAINT "contrast_job_workspace_id_fkey";
 ALTER TABLE "public"."dataobjects" DROP CONSTRAINT "dataobjects_data_format_fkey";
 ALTER TABLE "public"."dataobjects" DROP CONSTRAINT "dataobjects_info_type_fkey";
 ALTER TABLE "public"."dataobjects" DROP CONSTRAINT "dataobjects_multiplicity_fkey";
 ALTER TABLE "public"."defaultclassification" DROP CONSTRAINT "defaultclassification_nameid_fkey";
 ALTER TABLE "public"."file" DROP CONSTRAINT "file_taxa_id_fkey";
 ALTER TABLE "public"."file" DROP CONSTRAINT "file_type_fkey";
 ALTER TABLE "public"."file_matrix" DROP CONSTRAINT "file_matrix_file_id_fkey";
 ALTER TABLE "public"."file_matrix" DROP CONSTRAINT "file_matrix_matrix_id_fkey";
 ALTER TABLE "public"."file_tree" DROP CONSTRAINT "file_tree_file_id_fkey";
 ALTER TABLE "public"."file_tree" DROP CONSTRAINT "file_tree_tree_id_fkey";
 ALTER TABLE "public"."folder_file" DROP CONSTRAINT "folder_file_file_id_fkey";
 ALTER TABLE "public"."folder_file" DROP CONSTRAINT "folder_file_folder_id_fkey";
 ALTER TABLE "public"."folder_folder" DROP CONSTRAINT "folder_folder_child_folder_id_fkey";
 ALTER TABLE "public"."folder_folder" DROP CONSTRAINT "folder_folder_parent_folder_id_fkey";
 ALTER TABLE "public"."graph" DROP CONSTRAINT "graph_file_id_fkey";
 ALTER TABLE "public"."graph" DROP CONSTRAINT "graph_root_thing_id_fkey";
 ALTER TABLE "public"."graph_thing" DROP CONSTRAINT "graph_thing_graph_id_fkey";
 ALTER TABLE "public"."graph_thing" DROP CONSTRAINT "graph_thing_thing_id_fkey";
 ALTER TABLE "public"."graph_triple" DROP CONSTRAINT "graph_triple_graph_id_fkey";
 ALTER TABLE "public"."graph_triple" DROP CONSTRAINT "graph_triple_triple_id_fkey";
 ALTER TABLE "public"."nameparsed" DROP CONSTRAINT "nameparsed_nameid_fkey";
 ALTER TABLE "public"."namesource" DROP CONSTRAINT "namesource_nameid_fkey";
 ALTER TABLE "public"."namesource" DROP CONSTRAINT "namesource_sourceid_fkey";
 ALTER TABLE "public"."notification_set_notification" DROP CONSTRAINT "notification_set_notification_notification_id_fkey";
 ALTER TABLE "public"."notification_set_notification" DROP CONSTRAINT "notification_set_notification_notification_set_id_fkey";
 ALTER TABLE "public"."notifications_receivers" DROP CONSTRAINT "notifications_receivers_notification_id_fkey";
 ALTER TABLE "public"."parent_template_child_template" DROP CONSTRAINT "parent_template_child_template_child_id_fkey";
 ALTER TABLE "public"."parent_template_child_template" DROP CONSTRAINT "parent_template_child_template_parent_id_fkey";
 ALTER TABLE "public"."property" DROP CONSTRAINT "property_property_type_fkey";
 ALTER TABLE "public"."property" DROP CONSTRAINT "property_validator_fkey";
 ALTER TABLE "public"."property_group_contract" DROP CONSTRAINT "property_group_contract_contract_id_fkey";
 ALTER TABLE "public"."property_group_contract" DROP CONSTRAINT "property_group_contract_property_group_id_fkey";
 ALTER TABLE "public"."property_group_property" DROP CONSTRAINT "property_group_property_property_group_id_fkey";
 ALTER TABLE "public"."property_group_property" DROP CONSTRAINT "property_group_property_property_id_fkey";
 ALTER TABLE "public"."provenance" DROP CONSTRAINT "provenance_event_id_fkey";
 ALTER TABLE "public"."provenance_agent_role" DROP CONSTRAINT "provenance_agent_role_event_id_fkey";
 ALTER TABLE "public"."provenance_event" DROP CONSTRAINT "provenance_event_action_id_fkey";
 ALTER TABLE "public"."provenance_event" DROP CONSTRAINT "provenance_event_job_id_fkey";
 ALTER TABLE "public"."provenance_job" DROP CONSTRAINT "provenance_job_device_id_fkey";
 ALTER TABLE "public"."provenance_location" DROP CONSTRAINT "provenance_location_event_id_fkey";
 ALTER TABLE "public"."provenance_param" DROP CONSTRAINT "provenance_param_job_id_fkey";
 ALTER TABLE "public"."recordtable" DROP CONSTRAINT "recordtable_file_fkey";
 ALTER TABLE "public"."recordtablefield" DROP CONSTRAINT "recordtablefield_recordtable_id_fkey";
 ALTER TABLE "public"."recordtablerecord" DROP CONSTRAINT "recordtablerecord_recordtable_id_fkey";
 ALTER TABLE "public"."recordtablevalue" DROP CONSTRAINT "recordtablevalue_recordtablefield_fkey";
 ALTER TABLE "public"."recordtablevalue" DROP CONSTRAINT "recordtablevalue_recordtablerecord_fkey";
 ALTER TABLE "public"."rule" DROP CONSTRAINT "rule_rule_type_fkey";
 ALTER TABLE "public"."rule_argument" DROP CONSTRAINT "rule_argument_rule_id_fkey";
 ALTER TABLE "public"."rule_type_value_type" DROP CONSTRAINT "rule_type_value_type_rule_type_id_fkey";
 ALTER TABLE "public"."rule_type_value_type" DROP CONSTRAINT "rule_type_value_type_value_type_id_fkey";
 ALTER TABLE "public"."statement" DROP CONSTRAINT "statement_block_fkey";
 ALTER TABLE "public"."statement" DROP CONSTRAINT "statement_type_fkey";
 ALTER TABLE "public"."statement_graph" DROP CONSTRAINT "statement_graph_graph_id_fkey";
 ALTER TABLE "public"."statement_graph" DROP CONSTRAINT "statement_graph_statement_id_fkey";
 ALTER TABLE "public"."step_precedence_constraints" DROP CONSTRAINT "step_precedence_constraints_precedence_constraint_id_fkey";
 ALTER TABLE "public"."step_precedence_constraints" DROP CONSTRAINT "step_precedence_constraints_step_precedence_id_fkey";
 ALTER TABLE "public"."step_precedence_inbound" DROP CONSTRAINT "step_precedence_inbound_step_precedence_id_fkey";
 ALTER TABLE "public"."step_precedence_inbound" DROP CONSTRAINT "step_precedence_inbound_transformation_step_id_fkey";
 ALTER TABLE "public"."step_precedence_outbound" DROP CONSTRAINT "step_precedence_outbound_step_precedence_id_fkey";
 ALTER TABLE "public"."step_precedence_outbound" DROP CONSTRAINT "step_precedence_outbound_transformation_step_id_fkey";
 ALTER TABLE "public"."template_group_group" DROP CONSTRAINT "template_group_group_parent_group_id_fkey";
 ALTER TABLE "public"."template_group_group" DROP CONSTRAINT "template_group_group_subgroup_id_fkey";
 ALTER TABLE "public"."template_group_template" DROP CONSTRAINT "template_group_template_template_group_id_fkey";
 ALTER TABLE "public"."template_group_template" DROP CONSTRAINT "template_group_template_template_id_fkey";
 ALTER TABLE "public"."template_input" DROP CONSTRAINT "template_input_input_id_fkey";
 ALTER TABLE "public"."template_input" DROP CONSTRAINT "template_input_template_id_fkey";
 ALTER TABLE "public"."template_output" DROP CONSTRAINT "template_output_output_id_fkey";
 ALTER TABLE "public"."template_output" DROP CONSTRAINT "template_output_template_id_fkey";
 ALTER TABLE "public"."template_property_group" DROP CONSTRAINT "template_property_group_property_group_id_fkey";
 ALTER TABLE "public"."template_property_group" DROP CONSTRAINT "template_property_group_template_id_fkey";
 ALTER TABLE "public"."thing" DROP CONSTRAINT "thing_type_fkey";
 ALTER TABLE "public"."transformation_activity_mappings" DROP CONSTRAINT "transformation_activity_mapping_transformation_activity_id_fkey";
 ALTER TABLE "public"."transformation_step" DROP CONSTRAINT "transformation_step_transformation_id_fkey";
 ALTER TABLE "public"."transformation_task_step_precedence" DROP CONSTRAINT "transformation_task_step_precedence_step_precedence_id_fkey";
 ALTER TABLE "public"."transformation_task_step_precedence" DROP CONSTRAINT "transformation_task_step_precedence_transformation_task_id_fkey";
 ALTER TABLE "public"."transformation_task_steps" DROP CONSTRAINT "transformation_task_steps_transformation_step_id_fkey";
 ALTER TABLE "public"."transformation_task_steps" DROP CONSTRAINT "transformation_task_steps_transformation_task_id_fkey";
 ALTER TABLE "public"."transformation_value" DROP CONSTRAINT "transformation_value_transformation_id_fkey";
 ALTER TABLE "public"."triple" DROP CONSTRAINT "triple_object_fkey";
 ALTER TABLE "public"."triple" DROP CONSTRAINT "triple_predicate_fkey";
 ALTER TABLE "public"."triple" DROP CONSTRAINT "triple_subject_fkey";
 ALTER TABLE "public"."validator_rule" DROP CONSTRAINT "validator_rule_rule_id_fkey";
 ALTER TABLE "public"."validator_rule" DROP CONSTRAINT "validator_rule_validator_id_fkey";
 ALTER TABLE "public"."workspace" DROP CONSTRAINT "workspace_home_folder_fkey";
 ALTER TABLE "public"."annotation" DROP CONSTRAINT "annotation_pkey";
 ALTER TABLE "public"."block" DROP CONSTRAINT "block_pkey";
 ALTER TABLE "public"."block_type" DROP CONSTRAINT "block_type_pkey";
 ALTER TABLE "public"."classification" DROP CONSTRAINT "classification_pkey";
 ALTER TABLE "public"."contract" DROP CONSTRAINT "contract_pkey";
 ALTER TABLE "public"."contract_property" DROP CONSTRAINT "contract_property_pkey";
 ALTER TABLE "public"."contrast_job" DROP CONSTRAINT "contrast_job_pkey";
 ALTER TABLE "public"."data_format" DROP CONSTRAINT "data_format_pkey";
 ALTER TABLE "public"."dataelementpreservation" DROP CONSTRAINT "dataelementpreservation_pkey";
 ALTER TABLE "public"."dataobject_mapping" DROP CONSTRAINT "dataobject_mapping_pkey";
 ALTER TABLE "public"."dataobjects" DROP CONSTRAINT "dataobjects_pkey";
 ALTER TABLE "public"."deployed_components" DROP CONSTRAINT "deployed_components_pkey";
 ALTER TABLE "public"."file" DROP CONSTRAINT "file_pkey";
 ALTER TABLE "public"."file_type" DROP CONSTRAINT "file_type_pkey";
 ALTER TABLE "public"."folder" DROP CONSTRAINT "folder_pkey";
 ALTER TABLE "public"."graph" DROP CONSTRAINT "graph_pkey";
 ALTER TABLE "public"."importedworkflow" DROP CONSTRAINT "importedworkflow_pkey";
 ALTER TABLE "public"."info_type" DROP CONSTRAINT "info_type_pkey";
 ALTER TABLE "public"."input_output_mapping" DROP CONSTRAINT "input_output_mapping_pkey" CASCADE;
 ALTER TABLE "public"."job_information_new" DROP CONSTRAINT "job_information_new_pkey";
 ALTER TABLE "public"."jobs" DROP CONSTRAINT "jobs_pkey";
 ALTER TABLE "public"."multiplicity" DROP CONSTRAINT "multiplicity_pkey";
 ALTER TABLE "public"."name" DROP CONSTRAINT "name_pkey";
 ALTER TABLE "public"."nameparsed" DROP CONSTRAINT "nameparsed_pkey";
 ALTER TABLE "public"."namesource" DROP CONSTRAINT "namesource_pkey";
 ALTER TABLE "public"."notification" DROP CONSTRAINT "notification_pkey";
 ALTER TABLE "public"."notification_set" DROP CONSTRAINT "notification_set_pkey";
 ALTER TABLE "public"."notification_set_notification" DROP CONSTRAINT "notification_set_notification_pkey";
 ALTER TABLE "public"."notifications_receivers" DROP CONSTRAINT "notifications_receivers_pkey";
 ALTER TABLE "public"."parent_template_child_template" DROP CONSTRAINT "parent_template_child_template_pkey";
 ALTER TABLE "public"."precedence_constraint" DROP CONSTRAINT "precedence_constraint_pkey";
 ALTER TABLE "public"."predicate_lookup" DROP CONSTRAINT "predicate_lookup_pkey";
 ALTER TABLE "public"."property" DROP CONSTRAINT "property_pkey";
 ALTER TABLE "public"."property_group" DROP CONSTRAINT "property_group_pkey";
 ALTER TABLE "public"."property_group_contract" DROP CONSTRAINT "property_group_contract_pkey";
 ALTER TABLE "public"."property_group_property" DROP CONSTRAINT "property_group_property_pkey";
 ALTER TABLE "public"."property_type" DROP CONSTRAINT "property_type_pkey";
 ALTER TABLE "public"."provenance" DROP CONSTRAINT "provenance_pkey";
 ALTER TABLE "public"."provenance_action" DROP CONSTRAINT "provenance_action_pkey";
 ALTER TABLE "public"."provenance_agent_role" DROP CONSTRAINT "provenance_agent_role_pkey";
 ALTER TABLE "public"."provenance_device" DROP CONSTRAINT "provenance_device_pkey";
 ALTER TABLE "public"."provenance_event" DROP CONSTRAINT "provenance_event_pkey";
 ALTER TABLE "public"."provenance_job" DROP CONSTRAINT "provenance_job_pkey";
 ALTER TABLE "public"."provenance_location" DROP CONSTRAINT "provenance_location_pkey";
 ALTER TABLE "public"."provenance_param" DROP CONSTRAINT "provenance_param_pkey";
 ALTER TABLE "public"."recordtable" DROP CONSTRAINT "recordtable_pkey";
 ALTER TABLE "public"."recordtablefield" DROP CONSTRAINT "recordtablefield_pkey";
 ALTER TABLE "public"."recordtablerecord" DROP CONSTRAINT "recordtablerecord_pkey";
 ALTER TABLE "public"."recordtablevalue" DROP CONSTRAINT "recordtablevalue_pkey";
 ALTER TABLE "public"."rule" DROP CONSTRAINT "rule_pkey";
 ALTER TABLE "public"."rule_argument" DROP CONSTRAINT "rule_argument_pkey";
 ALTER TABLE "public"."rule_subtype" DROP CONSTRAINT "rule_subtype_pkey";
 ALTER TABLE "public"."rule_type" DROP CONSTRAINT "rule_type_pkey";
 ALTER TABLE "public"."source" DROP CONSTRAINT "source_pkey";
 ALTER TABLE "public"."statement" DROP CONSTRAINT "statement_pkey";
 ALTER TABLE "public"."statement_type" DROP CONSTRAINT "statement_type_pkey";
 ALTER TABLE "public"."step_precedence" DROP CONSTRAINT "step_precedence_pkey";
 ALTER TABLE "public"."step_precedence_constraints" DROP CONSTRAINT "step_precedence_constraints_pkey";
 ALTER TABLE "public"."step_precedence_inbound" DROP CONSTRAINT "step_precedence_inbound_pkey";
 ALTER TABLE "public"."step_precedence_outbound" DROP CONSTRAINT "step_precedence_outbound_pkey";
 ALTER TABLE "public"."template" DROP CONSTRAINT "template_pkey";
 ALTER TABLE "public"."template_group" DROP CONSTRAINT "template_group_pkey";
 ALTER TABLE "public"."template_group_group" DROP CONSTRAINT "template_group_group_pkey";
 ALTER TABLE "public"."template_group_template" DROP CONSTRAINT "template_group_template_pkey";
 ALTER TABLE "public"."template_input" DROP CONSTRAINT "template_input_pkey";
 ALTER TABLE "public"."template_output" DROP CONSTRAINT "template_output_pkey";
 ALTER TABLE "public"."template_property_group" DROP CONSTRAINT "template_property_group_pkey";
 ALTER TABLE "public"."thing" DROP CONSTRAINT "thing_pkey";
 ALTER TABLE "public"."thing_type_code" DROP CONSTRAINT "thing_type_code_pkey";
 ALTER TABLE "public"."transformation" DROP CONSTRAINT "transformation_pkey";
 ALTER TABLE "public"."transformation_activity" DROP CONSTRAINT "transformation_activity_pkey";
 ALTER TABLE "public"."transformation_activity_mappings" DROP CONSTRAINT "transformation_activity_mappings_pkey";
 ALTER TABLE "public"."transformation_step" DROP CONSTRAINT "transformation_step_pkey" CASCADE;
 ALTER TABLE "public"."transformation_task_step_precedence" DROP CONSTRAINT "transformation_task_step_precedence_pkey";
 ALTER TABLE "public"."transformation_task_steps" DROP CONSTRAINT "transformation_task_steps_pkey";
 ALTER TABLE "public"."transformation_value" DROP CONSTRAINT "transformation_value_pkey";
 ALTER TABLE "public"."triple" DROP CONSTRAINT "triple_pkey";
 ALTER TABLE "public"."tropicosrawdata1" DROP CONSTRAINT "tropicosrawdata1_pkey";
 ALTER TABLE "public"."tropicosrawdata2" DROP CONSTRAINT "tropicosrawdata2_pkey";
 ALTER TABLE "public"."user_jobs" DROP CONSTRAINT "user_jobs_pkey";
 ALTER TABLE "public"."validator" DROP CONSTRAINT "validator_pkey";
 ALTER TABLE "public"."validator_rule" DROP CONSTRAINT "validator_rule_pkey";
 ALTER TABLE "public"."value_type" DROP CONSTRAINT "value_type_pkey";
 ALTER TABLE "public"."workspace" DROP CONSTRAINT "workspace_pkey";

--------------------------------------------------
-- NOW LET'S DROP SOME RECORDS!!!!
--------------------------------------------------
-- metadata-2-0.sql 

DELETE FROM contract_property;
DELETE FROM contract;
DELETE FROM deployed_components;
DELETE FROM job_information_new;
DELETE FROM notification;
DELETE FROM notification_set;
DELETE FROM notification_set_notification;
DELETE FROM notifications_receivers;
DELETE FROM parent_template_child_template;
DELETE FROM precedence_constraint;
DELETE FROM value_type;
DELETE FROM property_group_contract;
DELETE FROM property_group_property;
DELETE FROM property_type;
DELETE FROM property;
DELETE FROM property_group;
DELETE FROM rule_type_value_type;
DELETE FROM rule_subtype;
DELETE FROM rule_argument;
DELETE FROM rule_type;
DELETE FROM rule;
DELETE FROM step_precedence_constraints;
DELETE FROM step_precedence_inbound;
DELETE FROM step_precedence_outbound;
DELETE FROM step_precedence;
DELETE FROM template_group_group;
DELETE FROM template_group_template;
DELETE FROM template_property_group;
DELETE FROM template;
DELETE FROM template_group;
DELETE FROM template_input;
DELETE FROM template_output;
DELETE FROM transformation_activity_mappings;
DELETE FROM transformation_task_step_precedence;
DELETE FROM transformation_task_steps;
DELETE FROM transformation_value;
DELETE FROM transformation_step;
DELETE FROM transformation;
DELETE FROM transformation_activity;
DELETE FROM validator;
DELETE FROM validator_rule;
DELETE FROM multiplicity;
DELETE FROM info_type;
DELETE FROM data_format;
DELETE FROM input_output_mapping;
DELETE FROM dataobject_mapping;
DELETE FROM dataobjects;

-- metadata-3-2

DELETE FROM DataElementPreservation;
DELETE FROM ImportedWorkflow;

-- metadata-4-0

--------------------------------------------------
--
--------------------------------------------------

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Data for Name: contract; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contract (hid, id, name, description, label) FROM stdin;
\.


--
-- Data for Name: contract_property; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contract_property (contract_id, property_id, id) FROM stdin;
\.


--
-- Data for Name: contrast_job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contrast_job (id, configuration, name, username, created, status, workspace_id) FROM stdin;
\.


--
-- Data for Name: data_format; Type: TABLE DATA; Schema: public; Owner: -
--

COPY data_format (hid, id, name, label, description, display_order) FROM stdin;
2	9E2F6F6B-8C7C-42A6-B6FF-2CCA8DFFF342	ASN-0	Genbank ASN1	\N	999
3	6C4D09B3-0108-4DD3-857A-8225E0645A0A	Barcode-0	FASTX toolkit barcode file	\N	999
4	AB391836-9A4D-4EE3-89BA-9DA9CDD28255	CSV-0	Comma-separated values	\N	999
5	EBF3B544-FC03-4FDF-8C02-49CEF60B0FD6	EMBL-0	EMBL multiple sequence alignment	\N	999
6	FA6554CF-38C0-4F6E-993C-1BB080C637FA	FAI-0	Samtools Fasta Index (FAI)	\N	999
7	18FDAE69-750C-421E-B43B-5724455DAC8B	FASTA-0	FASTA	\N	999
8	6FEDEA87-6E73-490A-A4E3-3A337085402C	FASTQ-0	FASTQ (Sanger)	\N	999
9	B0754D3F-417B-49B3-AE2B-75339C4C392A	FASTQ-Illumina-0	FASTQ (Illumina 1.3+)	\N	999
10	06DB90D6-422A-4DF3-8DA5-ADB75BC58B65	FASTQ-Int-0	FASTQ-Integer sequence file	\N	999
11	FADDC788-FB75-434D-9820-721292ADF3B6	FASTQ-Solexa-0	FASTQ (Solexa)	\N	999
12	6DDD55C6-21C7-4E0A-B0FF-2AC1E24E9762	Genbank-0	Genbank	\N	999
13	15F121D1-7885-46F4-B2A9-32AF7EF5DDAA	PDB-3.2	Protein Data Bank (PDB)	\N	999
14	A84DA1B1-D515-44B8-8B01-AFDD660E0B77	Pileup-0	Pileup	\N	999
15	F3A3E9EB-E46F-49CC-A61C-24DB6EE964C4	SAI-0.1.2	SAM index	\N	999
16	13CC9A49-E3E9-4B36-9436-782323F686E0	SAM-0.1.2	SAM	\N	999
17	8068B37A-0921-4F34-9272-E5FC93D8F64B	SBML-1.2	Systems Biology Markup Language (Level 1, Version 2)	\N	999
18	8BC057EA-C33D-476F-82F4-61C960BEE223	SBML-2.4.1	Systems Biology Markup Language (Level 2, Version 4, Release 1)	\N	999
19	E79FD13B-B82E-431D-83B6-95B3DC16DCBE	SBML-3.1	Systems Biology Markup Language (Level 3, Version 1 Core)	\N	999
20	1810A7AF-094F-4470-8677-42E217CCEF4E	TAB-0	Tab-delimited text	\N	999
21	158E6939-61E2-4297-8049-42AD77B32E51	Text-0	Plain text	\N	999
22	6F7EEEC5-CEE5-4562-8515-2795C2399328	VCF-3.3	Variant call format (VCF)	\N	999
23	70E56C3C-50EB-41A7-A98C-165A9CD55EE7	VCF-4.0	Variant call format (VCF)	\N	999
24	FA730BA6-F6FA-479E-ABF4-E56F4D37D4E7	WIG-0	UCSC Wiggle	\N	999
1	E806880B-383D-4AD6-A4AB-8CDD88810A33	Unspecified	Unspecified Data Format	\N	1
\.


--
-- Data for Name: dataelementpreservation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataelementpreservation (hid, templateuuid, infotypename, fileformatname, datecreated) FROM stdin;
1	t649789b6669d43d09afbc4ba3f789e5d	Input File	{"id":"F1B1FF5B-AB04-3458-B69D-79C22F4317A4","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 07:40:14
2	t649789b6669d43d09afbc4ba3f789e5d	Output File	{"id":"2320C117-30E4-6D35-07D9-98AC3D4D80EE","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 07:40:14
3	6C87D62D-236A-C9F7-1DF3-3B7E22926B1F	Input File	{"id":"F949FB43-6A12-EEAB-7D13-6FD48283A869","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 07:40:15
4	A491D1C1-CE61-56DA-8458-2C603F3B48EF	Input File	{"id":"B7D4002E-47C1-67F3-3649-1E7670279B77","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:39
5	A491D1C1-CE61-56DA-8458-2C603F3B48EF	Output File	{"id":"2B2CCB5A-8FD2-522D-A326-8EE9A7AFFB0E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:39
6	EF64AD00-9A14-EE88-1BD1-27E90ABDE244	Input File	{"id":"712EA26F-525C-E9A8-D29D-C8E60E90CEF7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:40
7	EF64AD00-9A14-EE88-1BD1-27E90ABDE244	Output File	{"id":"604ABD4F-5290-5120-D7A4-AE7A59F8670D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:40
8	E85D0F0E-1923-92A5-5D3C-7EDA880220DE	Input File	{"id":"3DE3FA93-0CED-52B0-B210-FC907C63D8AE","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:41
9	E85D0F0E-1923-92A5-5D3C-7EDA880220DE	Output File	{"id":"81D65962-2FC8-6D69-1232-AAFF385B2D59","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:41
10	37A7E123-A7FA-7B91-9C44-0D96289FB6AC	Input File	{"id":"09756F30-2F29-DA2C-0D65-C5754501DC28","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:40:59
11	E8C72058-3156-0690-F11B-237E91AA01C2	Input File	{"id":"4F44102C-3269-7CED-4AFB-AF08E79E8E62","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:41:13
12	4385F2B5-D091-E6BC-CB04-671CE13E2936	Input File	{"id":"11D65BF0-DFB2-84A1-15FC-7BDEAF0CC5EF","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:41:31
13	4385F2B5-D091-E6BC-CB04-671CE13E2936	Output File	{"id":"35CFEA78-9B98-E489-A075-95444310CD17","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:41:31
14	7203F97D-FD9A-BFE3-D9DE-9411524F70E3	Input File	{"id":"3770DB84-5002-FE05-BE5A-4C94B9D02D90","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:41:44
15	C43EB684-46C8-5A3B-137A-3B52F695958D	Input File	{"id":"C2CEF1A3-31E4-ECB4-0A70-64C64A19443E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:42:07
16	EDB07330-4871-FA7C-64A2-0F69ADC02CBD	Input File	{"id":"5DBD8A60-1D0E-B670-71EC-E7CC8C1A470A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:42:26
17	EDB07330-4871-FA7C-64A2-0F69ADC02CBD	Output File	{"id":"A2132840-CE6C-5DF5-D0AA-FB3A6E71CC9A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:42:26
18	068355FC-ACFA-99A3-58E3-9998608B4BC8	Input File	{"id":"1CEA5140-96F9-7E66-287A-BFAD2937F1A7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 07:42:59
19	0992A5E7-BF4E-C0FD-9054-F2A982F5D07B	Input File	{"id":"1377EDF5-AC6E-7034-F1BE-2E60FDACB05A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 08:21:34
20	A8C3E57A-B4E8-6F0B-2D6B-D681F63F4350	Input File	{"id":"1377EDF5-AC6E-7034-F1BE-2E60FDACB05A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 08:24:48
21	A8C3E57A-B4E8-6F0B-2D6B-D681F63F4350	Output File	{"id":"2F353B0C-F4E8-03EE-03C2-AD0215BEE7B6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 08:24:48
22	A8C3E57A-B4E8-6F0B-2D6B-D681F63F4350	Input File	{"id":"1377EDF5-AC6E-7034-F1BE-2E60FDACB05A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 09:06:34
23	A8C3E57A-B4E8-6F0B-2D6B-D681F63F4350	Output File	{"id":"2F353B0C-F4E8-03EE-03C2-AD0215BEE7B6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 09:06:34
24	724E8FBD-8AAE-576F-72F3-9DB91CCA9A81	Input File	{"id":"FCF47A79-C064-7ABB-6EB0-EDFD9C483CC0","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 09:07:36
25	724E8FBD-8AAE-576F-72F3-9DB91CCA9A81	Output File	{"id":"2F353B0C-F4E8-03EE-03C2-AD0215BEE7B6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 09:07:36
26	A3B3B14A-005A-9A59-41B2-5591936B1F6B	Input File	{"id":"4B0EFA36-9CF5-3FB6-4AA9-0C270A075D4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 09:27:44
27	A3B3B14A-005A-9A59-41B2-5591936B1F6B	Output File	{"id":"AF06D786-DDC0-1961-BAEF-0FC586A77C57","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 09:27:44
28	A3B3B14A-005A-9A59-41B2-5591936B1F6B	Input File	{"id":"4B0EFA36-9CF5-3FB6-4AA9-0C270A075D4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:24:05
29	A3B3B14A-005A-9A59-41B2-5591936B1F6B	Output File	{"id":"AF06D786-DDC0-1961-BAEF-0FC586A77C57","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:24:05
30	58D9AFDB-8704-7892-3D4D-C004B6D51F78	Input File	{"id":"4B0EFA36-9CF5-3FB6-4AA9-0C270A075D4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:24:11
31	58D9AFDB-8704-7892-3D4D-C004B6D51F78	Output File	{"id":"AF06D786-DDC0-1961-BAEF-0FC586A77C57","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:24:11
32	2A6B165E-416C-2EDD-1DF4-036EB7D0684F	Input File	{"id":"DE0004E4-606B-BA99-813A-DD2FB39AE4E1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:43:00
33	2DFD21FF-9DA8-6192-4B12-46A9D2944AD9	Input File	{"id":"DE0004E4-606B-BA99-813A-DD2FB39AE4E1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:43:15
34	58D9AFDB-8704-7892-3D4D-C004B6D51F78	Input File	{"id":"4B0EFA36-9CF5-3FB6-4AA9-0C270A075D4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:57:51
35	58D9AFDB-8704-7892-3D4D-C004B6D51F78	Output File	{"id":"AF06D786-DDC0-1961-BAEF-0FC586A77C57","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 10:57:51
36	2DFD21FF-9DA8-6192-4B12-46A9D2944AD9	Input File	{"id":"DE0004E4-606B-BA99-813A-DD2FB39AE4E1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 11:15:46
37	09768567-1ED0-1B6E-1826-07D99E273DD3	Input File	{"id":"18AFFC91-8940-DE49-ED59-12275BA2AE3F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-08 11:23:54
38	A6D171BB-94E6-8AA3-35AC-AD0DDEB7D0BB	Output File	{"id":"738EAA28-5F3F-EEB5-E869-A85D7C771031","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 13:20:52
39	BCED723B-327F-D529-76F7-E6F8F0111FA2	Output File	{"id":"738EAA28-5F3F-EEB5-E869-A85D7C771031","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 13:21:47
40	C14FB8BA-8ED6-B9DE-656C-F33C1105AFE6	Input File	{"id":"53BB7F74-1FC8-0481-2C58-7C62202FFEED","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 13:24:30
41	C14FB8BA-8ED6-B9DE-656C-F33C1105AFE6	Output File	{"id":"64B2261B-9424-45C3-5A47-3C52A897D0FE","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 13:24:30
42	AC65068A-A661-98E7-EE34-61AD25E1BA0C	Input File	{"id":"DA459BB0-58F3-3CC6-CE3C-FA1318467051","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-08 16:45:35
43	AC65068A-A661-98E7-EE34-61AD25E1BA0C	Input File	{"id":"DA459BB0-58F3-3CC6-CE3C-FA1318467051","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-09 08:28:19
44	9C96CB2C-88E8-DE76-80B2-691CFF1564AA	Input File	{"id":"469A943A-C5E8-B2B2-3360-19C01872577C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-10 12:41:45
45	F77BC895-8393-463C-CB3B-FB73748DE2B7	Input File	{"id":"469A943A-C5E8-B2B2-3360-19C01872577C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-10 13:00:44
46	7E05FD3D-F994-A6CD-D08A-027EE9BDECFA	Input File	{"id":"6BBCB6A1-9EAA-E78B-BCD4-840AC34FC8B7","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-13 15:12:40
47	7E05FD3D-F994-A6CD-D08A-027EE9BDECFA	Output File	{"id":"86CF3317-B9F8-6365-4781-092976C9F651","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-13 15:12:40
48	7E05FD3D-F994-A6CD-D08A-027EE9BDECFA	Input File	{"id":"6BBCB6A1-9EAA-E78B-BCD4-840AC34FC8B7","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-14 08:58:17
49	7E05FD3D-F994-A6CD-D08A-027EE9BDECFA	Output File	{"id":"86CF3317-B9F8-6365-4781-092976C9F651","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-14 08:58:17
50	5B0E9A59-14D8-10AC-6C67-21BD27D3D0F6	Input File	{"id":"95F1EA72-5C02-9321-BB61-4F805E2A8CBD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-14 10:32:16
51	DDBF4A0B-D335-0C0E-E49C-DDAD7F095A80	Input File	{"id":"222B691A-FFD0-4A93-12A1-1DECFC62E4A6","hid":0,"description":"no-desc","name":"[\\"TXT\\",\\"CSV\\"]","label":"no-label"}	2011-06-14 12:00:50
52	DDBF4A0B-D335-0C0E-E49C-DDAD7F095A80	Output File	{"id":"C2C94A39-081A-530D-E51B-112B2DEF5A64","hid":0,"description":"no-desc","name":"[\\"CSV\\",\\"TXT\\"]","label":"no-label"}	2011-06-14 12:00:50
53	5B0E9A59-14D8-10AC-6C67-21BD27D3D0F6	Input File	{"id":"95F1EA72-5C02-9321-BB61-4F805E2A8CBD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-15 09:49:01
54	051136E4-BD8F-9BC9-0CF6-F83DF1F7B66E	Input File	{"id":"715BC420-0363-3F3C-B13E-2B5F54B3D3AD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-15 10:22:09
55	051136E4-BD8F-9BC9-0CF6-F83DF1F7B66E	Output File	{"id":"8447851F-2347-1B35-1655-C4AA9F639918","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-15 10:22:09
56	C8F915A8-0A00-CFDB-23A1-569EA888386B	Input File	{"id":"9972F8FA-9B65-79DB-46FA-5057D754D8BE","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-15 11:00:59
57	C8F915A8-0A00-CFDB-23A1-569EA888386B	Output File	{"id":"4BBD8C53-EDFE-078C-54DD-CF61C8030A6F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-15 11:01:00
58	F0FA2431-0A88-AE19-0837-6F4B4685F7A5	Input File	{"id":"92F84B32-95F1-AED1-B7A2-46D7140B8AB7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-17 07:57:15
59	1F6C7150-DB15-8582-32FD-EE4F63C47A95	Input File	{"id":"CA04F3FE-9022-0676-075F-CACC6CBFDAAF","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-17 10:17:48
60	C39CBD8F-6A5A-627D-037B-D704254F0FC9	Input File	{"id":"2974C8F1-7DD1-CF25-1C99-ABE10190A678","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-17 11:03:27
61	CBBCD24B-27FD-8F97-B453-C2737318E465	Input File	{"id":"684FA2F6-2A15-F5F9-93DF-54A530A2C3B3","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-17 11:29:27
62	8250ED31-6142-9230-27F4-1CB094EE7C67	Input File	{"id":"2ADD89C8-83E6-4541-5288-2DBAD80F9292","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-23 00:08:29
63	B34B6EDB-F14F-1D28-98B8-D44236CC556B	Input File	{"id":"D92E2E8A-3043-8C81-BB03-DE07729D07BC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-23 20:29:02
64	6D386A88-C150-497E-CCA1-0CB4CB1373D5	Input File	{"id":"D92E2E8A-3043-8C81-BB03-DE07729D07BC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-23 20:35:59
65	A5E1D791-35CF-C0B2-F9FD-09C84AA2AE4E	Input File	{"id":"2EAF5CEC-9CFB-FC2F-C480-AF58A6659318","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-27 14:49:35
66	C212C1A4-88BF-AE00-C84D-B112C1277402	Input File	{"id":"DE79E631-A10A-9C36-8764-506E3B2D59BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-29 10:55:14
67	C212C1A4-88BF-AE00-C84D-B112C1277402	Output File	{"id":"19FB8232-FC45-27BE-52A4-F6597A053714","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-29 10:55:14
68	C720C42D-531A-164B-38CC-D2D6A337C5A5	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 13:34:12
69	40195321-17D2-B0A7-C647-CD7A5B060B64	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 13:36:32
70	40195321-17D2-B0A7-C647-CD7A5B060B64	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 14:38:24
71	40195321-17D2-B0A7-C647-CD7A5B060B64	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 14:59:39
72	40195321-17D2-B0A7-C647-CD7A5B060B64	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 15:48:32
73	F7A5664F-F353-1AEE-2656-CC4EBBF7326C	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 15:57:46
74	429C704E-6A2D-B706-6740-F23C4B3EAFA6	Input File	{"id":"4D45C32E-8AFF-3B70-0FF5-30F6945DC18B","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 16:12:58
75	3349B131-9D5E-B158-59D7-D257DC440E00	Input File	{"id":"4D45C32E-8AFF-3B70-0FF5-30F6945DC18B","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 16:22:14
77	F7A5664F-F353-1AEE-2656-CC4EBBF7326C	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 16:40:48
78	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 03:37:14
79	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 03:38:05
80	F7A5664F-F353-1AEE-2656-CC4EBBF7326C	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 03:43:06
81	89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55	Input File	{"id":"78CD047F-6D80-812A-A03C-3938717932B6","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 04:18:32
82	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 04:18:52
89	6E629326-4C46-C261-8D18-6F611F5019A9	Input File	{"id":"4BCC36DA-81C8-28DC-F9E4-D533F3C7F8CC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 11:56:40
90	6E629326-4C46-C261-8D18-6F611F5019A9	Output File	{"id":"DBCA3638-B9E3-9F73-F972-482CED8CF9EB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 11:56:40
91	4C6B098D-A243-1BBA-07AA-CBC99F7DC51E	Input File	{"id":"4654B648-676C-2B9E-A92B-6A9F22B64AE1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 12:06:36
92	4C6B098D-A243-1BBA-07AA-CBC99F7DC51E	Output File	{"id":"2CB380F6-61F1-901D-2873-12F695D96F27","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 12:06:36
93	C056F823-C43A-FB91-A810-945FED979435	Input File	{"id":"4654B648-676C-2B9E-A92B-6A9F22B64AE1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 12:09:18
94	C056F823-C43A-FB91-A810-945FED979435	Output File	{"id":"2CB380F6-61F1-901D-2873-12F695D96F27","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 12:09:18
95	6E629326-4C46-C261-8D18-6F611F5019A9	Input File	{"id":"4BCC36DA-81C8-28DC-F9E4-D533F3C7F8CC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 12:09:52
96	6E629326-4C46-C261-8D18-6F611F5019A9	Output File	{"id":"DBCA3638-B9E3-9F73-F972-482CED8CF9EB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 12:09:52
76	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-29 16:35:12
83	C4935B91-869E-A301-0EFE-6F891C62C771	Input File	{"id":"0DFFB68A-2390-FD80-A4EC-8ED435F2118F","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 04:35:50
84	3349B131-9D5E-B158-59D7-D257DC440E00	Input File	{"id":"4D45C32E-8AFF-3B70-0FF5-30F6945DC18B","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 04:36:04
85	0FC359D7-DBD1-1E93-6A6F-187E9D6709AF	Input File	{"id":"27D859D3-EC79-7EFB-3BF5-6A708F1DF34D","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 05:06:38
86	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 05:07:54
87	5D23F468-C979-4E3E-268C-691D2BD79510	Input File	{"id":"3FDEB5F4-39FE-4C5C-AF2A-A47A413EBEC0","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 05:19:57
88	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 05:20:42
97	A5E1D791-35CF-C0B2-F9FD-09C84AA2AE4E	Input File	{"id":"2EAF5CEC-9CFB-FC2F-C480-AF58A6659318","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 14:28:57
98	89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55	Input File	{"id":"78CD047F-6D80-812A-A03C-3938717932B6","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 14:31:25
99	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 14:44:15
100	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 14:49:31
101	5D23F468-C979-4E3E-268C-691D2BD79510	Input File	{"id":"3FDEB5F4-39FE-4C5C-AF2A-A47A413EBEC0","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 15:32:38
102	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 15:33:14
103	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 15:40:02
104	5D23F468-C979-4E3E-268C-691D2BD79510	Input File	{"id":"3FDEB5F4-39FE-4C5C-AF2A-A47A413EBEC0","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 15:40:49
105	0FC359D7-DBD1-1E93-6A6F-187E9D6709AF	Input File	{"id":"27D859D3-EC79-7EFB-3BF5-6A708F1DF34D","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 15:51:01
106	8E26FD19-F69D-DACC-A9B5-D6C05E51962B	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 16:17:29
107	44D7EECB-D99E-F9F3-ABD9-F33EF2EE7E60	Input File	{"id":"CA29B307-96A3-04BE-9B73-E2AD0A528205","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 16:26:13
108	119FD8A7-19FF-2267-554C-9E7FCF1965F9	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 18:56:31
109	119FD8A7-19FF-2267-554C-9E7FCF1965F9	Input File	{"id":"7E76E0D2-B804-65A8-0427-BA741F9065BB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 18:56:31
110	5C5810B2-08AE-ADAA-753D-6CA6422793DC	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 19:04:58
111	5C5810B2-08AE-ADAA-753D-6CA6422793DC	Input File	{"id":"7E76E0D2-B804-65A8-0427-BA741F9065BB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 19:04:58
112	3695B051-FC43-744D-A718-A140B0478378	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 19:05:05
113	3695B051-FC43-744D-A718-A140B0478378	Input File	{"id":"7E76E0D2-B804-65A8-0427-BA741F9065BB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 19:05:05
114	9D7B8A52-04C3-2715-2B61-D192A283E4FC	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 19:06:02
115	9D7B8A52-04C3-2715-2B61-D192A283E4FC	Input File	{"id":"7E76E0D2-B804-65A8-0427-BA741F9065BB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 19:06:02
116	5634C633-33BB-074B-A305-6B96981C307E	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[\\"TXT\\"]","label":"no-label"}	2011-06-30 19:06:53
117	5634C633-33BB-074B-A305-6B96981C307E	Input File	{"id":"7E76E0D2-B804-65A8-0427-BA741F9065BB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 19:06:53
118	F0279D84-2855-0B10-6C5A-BCFEA8F5AE29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 19:16:13
119	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-06-30 19:22:47
120	90E731C3-4395-DB74-FE23-8DF7AEAA8959	Input File	{"id":"7A79A2FE-F40B-D3F4-6986-FD2FBA97BDBB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-01 15:20:12
121	90E731C3-4395-DB74-FE23-8DF7AEAA8959	Output File	{"id":"6EE6D9BE-383C-213F-7848-9F85BE35210A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-01 15:20:12
122	3771F7F6-C8A5-75EA-1135-0C4F526A9E63	Input File	{"id":"58DCE2C7-49FD-89C3-7631-44D2BBA14B0A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-04 16:52:15
123	3771F7F6-C8A5-75EA-1135-0C4F526A9E63	Output File	{"id":"528451F2-5875-C7AF-1311-D3255E3F897A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-04 16:52:15
124	3771F7F6-C8A5-75EA-1135-0C4F526A9E63	Input File	{"id":"58DCE2C7-49FD-89C3-7631-44D2BBA14B0A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-04 16:59:27
125	3771F7F6-C8A5-75EA-1135-0C4F526A9E63	Output File	{"id":"528451F2-5875-C7AF-1311-D3255E3F897A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-04 16:59:27
126	592BC439-1515-A0B2-44F7-155529377743	Input File	{"id":"FBE7B318-6032-38B4-569E-713451142B78","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 07:17:42
127	592BC439-1515-A0B2-44F7-155529377743	Output File	{"id":"6223D23F-DDEA-531B-D458-30672E8745B2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 07:17:42
128	t916a6973a97f45c990ab4706fd8efa9f	Input File	{"id":"1D8BDCCD-8370-C3E8-B981-BDCD4844144E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 10:54:52
129	t60ef866264a840eb8d042d760578eb1d	Input File	{"id":"1D8BDCCD-8370-C3E8-B981-BDCD4844144E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 10:59:34
130	t112e446ac33044d39486a3a1606ae7aa	Input File	{"id":"1D8BDCCD-8370-C3E8-B981-BDCD4844144E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 11:04:29
131	tcfd6183a9ce047ab9eb367312afd6379	Input File	{"id":"1D8BDCCD-8370-C3E8-B981-BDCD4844144E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 11:44:10
132	6A5AB0D5-9300-DAE6-05FF-43F1A202CCA6	Input File	{"id":"CEAD5D9C-CB14-6024-AFE7-50B1442A47BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 11:45:03
133	A35C4F9D-A126-EA96-1765-E196F73247CF	Input File	{"id":"E22EE500-0820-CECC-C35E-6A64A71064D2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 13:59:56
134	A35C4F9D-A126-EA96-1765-E196F73247CF	Output File	{"id":"8A2CF347-72FB-C037-BAD1-64255CA7F508","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 13:59:56
135	A35C4F9D-A126-EA96-1765-E196F73247CF	Input File	{"id":"E22EE500-0820-CECC-C35E-6A64A71064D2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 14:04:14
136	A35C4F9D-A126-EA96-1765-E196F73247CF	Output File	{"id":"8A2CF347-72FB-C037-BAD1-64255CA7F508","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-05 14:04:14
137	868A33E5-216D-9DB2-8AEB-EB0A6E3621AD	Input File	{"id":"F8176C67-C26F-2E94-01F4-95F46C9E4A0F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 09:58:37
138	868A33E5-216D-9DB2-8AEB-EB0A6E3621AD	Output File	{"id":"E8304B53-53EF-D97A-DC73-C767841C89E0","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 09:58:37
139	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 17:46:18
140	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 17:57:14
141	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 18:15:46
142	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 18:18:59
143	89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55	Input File	{"id":"78CD047F-6D80-812A-A03C-3938717932B6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 18:42:06
144	89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55	Input File	{"id":"78CD047F-6D80-812A-A03C-3938717932B6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 19:07:25
145	F8EB9061-060A-08AB-A4E1-12D8EEDE97B0	Input File	{"id":"22EF486C-9B82-EED4-0509-371EC667E89C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 19:25:30
146	F8EB9061-060A-08AB-A4E1-12D8EEDE97B0	Output File	{"id":"6CAAC7B2-B311-2CA2-C91B-107FBDABE9DE","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 19:25:30
147	F8EB9061-060A-08AB-A4E1-12D8EEDE97B0	Input File	{"id":"22EF486C-9B82-EED4-0509-371EC667E89C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 19:28:21
148	F8EB9061-060A-08AB-A4E1-12D8EEDE97B0	Output File	{"id":"6CAAC7B2-B311-2CA2-C91B-107FBDABE9DE","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 19:28:21
149	3D8B6BB1-BC60-4853-C335-4816FCCCD1F7	Input File	{"id":"E790AB20-209D-44C7-3657-7C6C3EC4B50C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 20:12:07
150	E53F3939-5EEE-733A-A06B-8E3948C7BA43	Input File	{"id":"4E972A2F-1B72-30E5-602D-B7884905CAAD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 20:37:21
151	E53F3939-5EEE-733A-A06B-8E3948C7BA43	Input File	{"id":"4E972A2F-1B72-30E5-602D-B7884905CAAD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 21:13:48
152	D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F	Input File	{"id":"90AB77B4-3B18-B895-FB8A-2A8BD5B92198","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 23:01:52
153	D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F	Input File	{"id":"90AB77B4-3B18-B895-FB8A-2A8BD5B92198","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 23:11:57
154	D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F	Input File	{"id":"90AB77B4-3B18-B895-FB8A-2A8BD5B92198","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 23:13:19
155	76BB8EC5-B1A0-C988-7837-6E38081E2086	Input File	{"id":"069C43A5-DB21-7113-C813-A19AC0E156D1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-06 23:19:37
156	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 07:14:21
157	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 07:14:21
159	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 07:14:22
161	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 07:14:23
162	C212C1A4-88BF-AE00-C84D-B112C1277402	Input File	{"id":"DE79E631-A10A-9C36-8764-506E3B2D59BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 08:25:21
163	C212C1A4-88BF-AE00-C84D-B112C1277402	Output File	{"id":"19FB8232-FC45-27BE-52A4-F6597A053714","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 08:25:21
164	4C6B098D-A243-1BBA-07AA-CBC99F7DC51E	Input File	{"id":"4654B648-676C-2B9E-A92B-6A9F22B64AE1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 08:25:53
165	4C6B098D-A243-1BBA-07AA-CBC99F7DC51E	Output File	{"id":"2CB380F6-61F1-901D-2873-12F695D96F27","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 08:25:53
166	6E629326-4C46-C261-8D18-6F611F5019A9	Input File	{"id":"4BCC36DA-81C8-28DC-F9E4-D533F3C7F8CC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 08:26:32
167	6E629326-4C46-C261-8D18-6F611F5019A9	Output File	{"id":"DBCA3638-B9E3-9F73-F972-482CED8CF9EB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 08:26:32
168	C056F823-C43A-FB91-A810-945FED979435	Input File	{"id":"4654B648-676C-2B9E-A92B-6A9F22B64AE1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 09:46:59
169	C056F823-C43A-FB91-A810-945FED979435	Output File	{"id":"2CB380F6-61F1-901D-2873-12F695D96F27","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 09:46:59
170	C056F823-C43A-FB91-A810-945FED979435	Input File	{"id":"4654B648-676C-2B9E-A92B-6A9F22B64AE1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 09:48:12
171	C056F823-C43A-FB91-A810-945FED979435	Output File	{"id":"2CB380F6-61F1-901D-2873-12F695D96F27","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 09:48:12
172	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	Input File	{"id":"8C401FB5-1A24-2622-B1F4-D8B8473327C2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 09:55:55
173	F95C5B0F-5C2C-1EC4-6F30-B10E59D77436	Input File	{"id":"0559B8B1-82FA-FCA9-17A0-CCF6824A29EB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 10:36:21
174	30633EFA-2847-A261-930B-124E89EF49B3	Input File	{"id":"74E87D03-D65A-5927-6AF3-F9CFEBB08F37","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:02:25
175	57AC5561-52BA-4A98-EA3B-B22B64E44F2E	Input File	{"id":"23A1008B-C8B1-9F06-F222-73F38057B1BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:34:39
176	57AC5561-52BA-4A98-EA3B-B22B64E44F2E	Input File	{"id":"23A1008B-C8B1-9F06-F222-73F38057B1BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:34:56
177	12F489C2-1E93-F342-8457-7882D8690554	Input File	{"id":"984A19CE-552A-9AFC-C090-745099333625","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:38:44
178	E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB	Input File	{"id":"E6F3CCE1-754A-207C-28E3-32FCB4FDAF77","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:41:05
179	ECB16B06-656B-61C1-1DF6-C379877FA65B	Input File	{"id":"7A0C7EC5-B64B-17AD-34F0-75C7709A8E29","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:51:57
180	ECB16B06-656B-61C1-1DF6-C379877FA65B	Output File	{"id":"6B3EEFB1-5AFB-9221-659E-084ACE9F4B9A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 11:51:57
181	E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB	Input File	{"id":"E6F3CCE1-754A-207C-28E3-32FCB4FDAF77","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 12:27:45
182	E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB	Input File	{"id":"E6F3CCE1-754A-207C-28E3-32FCB4FDAF77","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 12:28:04
183	57AC5561-52BA-4A98-EA3B-B22B64E44F2E	Input File	{"id":"23A1008B-C8B1-9F06-F222-73F38057B1BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 12:30:08
184	3B35E87C-83FA-39BA-B746-F9BEC66F666B	Input File	{"id":"A2B80797-0C2E-7B0E-02F5-01F61D1B51D9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 12:32:30
185	DF367222-2ADF-B4FF-BB50-62077694E17F	Input File	{"id":"38FFF94F-DFE9-6258-3306-6348033025C7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 12:34:42
186	35F0EF83-AD2C-46CE-B812-3AE170C7D9A3	Input File	{"id":"92D8D0B7-B447-1BC9-3378-215625EBBFCD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 14:18:59
187	35F0EF83-AD2C-46CE-B812-3AE170C7D9A3	Output File	{"id":"FF91510A-A9EE-5317-4338-89B118D4552B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 14:18:59
188	F50FE07D-91AA-AA36-1D47-BB2E7FDC7BB4	Input File	{"id":"20E95D07-148A-C2C9-17CB-E75D1D9877B4","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 14:41:17
189	4F844168-9E2D-F4D1-0969-A4D20A99BC2A	Input File	{"id":"B9C0209C-B20D-7478-07FE-4049517B74C8","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 14:42:42
190	4F844168-9E2D-F4D1-0969-A4D20A99BC2A	Output File	{"id":"CF2D76C4-E554-CF42-4F58-3ADB4C6DCA2E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 14:42:42
191	20FCA18E-379C-ADDA-CD91-14D4ED780563	Input File	{"id":"C7A75658-D385-7632-1F82-23025BAD60AF","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:01:23
192	20FCA18E-379C-ADDA-CD91-14D4ED780563	Output File	{"id":"40E1306B-CB5D-500E-45ED-CD2662E5A86F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:01:23
193	00E7EE6B-F837-772C-5E7E-1A5E7FD6F4B9	Input File	{"id":"A8E3F0EF-06BF-DACD-FA35-2AC843EEB3D3","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:08:44
194	00E7EE6B-F837-772C-5E7E-1A5E7FD6F4B9	Output File	{"id":"B404C649-7AC6-A9F4-379B-7EE5CA03FC0B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:08:44
195	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	Input File	{"id":"8C401FB5-1A24-2622-B1F4-D8B8473327C2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:14:09
196	6D9741BF-E608-FCC8-02E9-7AB485B3475C	Input File	{"id":"B01CFA5D-6ECC-32BE-AD24-591C6A9ACF4A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:14:20
197	ECB16B06-656B-61C1-1DF6-C379877FA65B	Input File	{"id":"7A0C7EC5-B64B-17AD-34F0-75C7709A8E29","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:21:41
198	ECB16B06-656B-61C1-1DF6-C379877FA65B	Output File	{"id":"6B3EEFB1-5AFB-9221-659E-084ACE9F4B9A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:21:41
199	764E3C9C-33F4-1339-0FA4-148F34F4E66C	Input File	{"id":"624A61C8-264D-5FB1-0435-88F4DF569B56","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:26:04
200	764E3C9C-33F4-1339-0FA4-148F34F4E66C	Output File	{"id":"C4BCC389-896F-921D-F772-64D5093556AE","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:26:04
201	ECB16B06-656B-61C1-1DF6-C379877FA65B	Input File	{"id":"7A0C7EC5-B64B-17AD-34F0-75C7709A8E29","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:35:09
202	ECB16B06-656B-61C1-1DF6-C379877FA65B	Output File	{"id":"6B3EEFB1-5AFB-9221-659E-084ACE9F4B9A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 15:35:09
203	6211AFE4-2F7B-F850-127F-658521B30521	Input File	{"id":"790D5C03-DD37-62E8-56CB-A359C0809FCE","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 16:38:04
204	6211AFE4-2F7B-F850-127F-658521B30521	Output File	{"id":"9A04C9EA-84BD-7F0D-7E3E-839BCA617844","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 16:38:04
205	21F54682-5D2A-1B3C-BC5C-EDEA0CED1C1B	Input File	{"id":"99339510-DA0E-AA80-406B-C1D4C0D4A43C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-07 19:12:16
206	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	Input File	{"id":"8C401FB5-1A24-2622-B1F4-D8B8473327C2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 00:03:03
207	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	Input File	{"id":"8C401FB5-1A24-2622-B1F4-D8B8473327C2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 00:26:19
208	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 04:47:54
209	73DF09FE-002E-26D0-CFF1-2F7AD0A50F02	Input File	{"id":"3A110A46-23E3-756B-9F2C-DCA997421141","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 09:31:00
210	8B3F9722-332F-0940-4947-5EE312A891CD	Input File	{"id":"9F584396-C84B-C292-F319-968C23C46059","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 14:28:56
211	8B3F9722-332F-0940-4947-5EE312A891CD	Output File	{"id":"DDF56E0F-9E3B-9F0F-DFA6-441760BABC22","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 14:28:56
212	8B3F9722-332F-0940-4947-5EE312A891CD	Input File	{"id":"9F584396-C84B-C292-F319-968C23C46059","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 14:29:08
213	8B3F9722-332F-0940-4947-5EE312A891CD	Output File	{"id":"DDF56E0F-9E3B-9F0F-DFA6-441760BABC22","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 14:29:08
214	C4935B91-869E-A301-0EFE-6F891C62C771	Input File	{"id":"0DFFB68A-2390-FD80-A4EC-8ED435F2118F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-08 17:36:31
215	B3F69CE9-AC95-4D94-744B-406F153A167A	Input File	{"id":"1787BA7A-834B-9A41-5E74-5B57A9B05909","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-09 02:23:50
216	B3F69CE9-AC95-4D94-744B-406F153A167A	Input File	{"id":"1787BA7A-834B-9A41-5E74-5B57A9B05909","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-09 02:24:55
217	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	Input File	{"id":"A8367457-0735-9E6C-49D2-D0B4C3446E65","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-09 02:58:48
218	DC742ED5-A823-5EE0-35DC-2911A6485AA2	Input File	{"id":"C851957F-C237-639A-880B-1FE557600FD9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-09 08:46:58
219	DC742ED5-A823-5EE0-35DC-2911A6485AA2	Input File	{"id":"C851957F-C237-639A-880B-1FE557600FD9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-09 08:47:26
220	DC742ED5-A823-5EE0-35DC-2911A6485AA2	Input File	{"id":"C851957F-C237-639A-880B-1FE557600FD9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-09 08:51:12
221	F400AC2B-82B4-3146-1738-3554471E8124	Input File	{"id":"79FCD4D1-1F63-A079-1961-292FCE6D83E9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-10 13:18:01
222	F400AC2B-82B4-3146-1738-3554471E8124	Output File	{"id":"F49C6712-B765-0AF6-EDB7-34B0147E926E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-10 13:18:01
223	F400AC2B-82B4-3146-1738-3554471E8124	Input File	{"id":"79FCD4D1-1F63-A079-1961-292FCE6D83E9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-10 13:25:27
224	F400AC2B-82B4-3146-1738-3554471E8124	Output File	{"id":"BCFF802C-C7BE-6688-62AA-BCEBE5EDF66F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-10 13:25:27
225	35F0EF83-AD2C-46CE-B812-3AE170C7D9A3	Input File	{"id":"92D8D0B7-B447-1BC9-3378-215625EBBFCD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-11 11:23:23
226	35F0EF83-AD2C-46CE-B812-3AE170C7D9A3	Output File	{"id":"FF91510A-A9EE-5317-4338-89B118D4552B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-11 11:23:23
227	9F0481BA-165E-DF0A-7F3D-814DCE7B9A4E	Input File	{"id":"8919758F-3343-026B-20A3-A85918762A4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-16 10:09:57
228	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-16 10:55:57
229	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"31833E43-76CC-8460-A436-3CE98476AB20","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-16 10:55:57
230	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-16 11:15:09
231	EBABF83F-80D9-BA6D-2521-A2751F435906	Input File	{"id":"62673935-C701-FE3D-567B-653F4B2D2E31","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-18 13:41:50
232	EBABF83F-80D9-BA6D-2521-A2751F435906	Output File	{"id":"FF7EEF49-9337-5684-3CD3-1DEEBFBE1061","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-18 13:41:50
233	9F0481BA-165E-DF0A-7F3D-814DCE7B9A4E	Input File	{"id":"8919758F-3343-026B-20A3-A85918762A4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:14:06
234	9F0481BA-165E-DF0A-7F3D-814DCE7B9A4E	Input File	{"id":"8919758F-3343-026B-20A3-A85918762A4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:14:44
235	9F0481BA-165E-DF0A-7F3D-814DCE7B9A4E	Input File	{"id":"8919758F-3343-026B-20A3-A85918762A4B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:15:09
236	8684F0BB-D355-EDF2-F140-F00E7E9113EE	Input File	{"id":"C9F0CAB7-1F39-975C-D3CE-6D5A635B9BCD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:25:48
237	73DF09FE-002E-26D0-CFF1-2F7AD0A50F02	Input File	{"id":"3A110A46-23E3-756B-9F2C-DCA997421141","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:33:01
238	73DF09FE-002E-26D0-CFF1-2F7AD0A50F02	Input File	{"id":"3A110A46-23E3-756B-9F2C-DCA997421141","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:34:15
239	135F1992-A60E-92F2-57A9-BF74222FA5CC	Input File	{"id":"41EFEE41-BC70-F79A-62F4-63DF32EF6B20","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 08:36:50
240	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 09:10:05
241	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 09:10:05
242	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 10:44:06
243	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 10:44:06
244	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 10:48:56
245	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 10:48:56
246	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 11:07:14
247	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 11:07:14
248	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 11:21:41
249	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 11:21:41
250	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 11:49:23
251	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 11:49:23
252	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:19:21
253	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"88AB5D90-72EE-3C01-0258-439665D6B165","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:19:21
254	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:26:41
255	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:26:41
256	C0D2FC35-327C-3893-6F85-59563CB6DF14	Input File	{"id":"6469AD4A-3889-CC25-54FE-E2FCA9B6AEC7","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:41:34
257	C0D2FC35-327C-3893-6F85-59563CB6DF14	Output File	{"id":"B7E86A71-068F-B1BB-20EF-64AA9BD89B7D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:41:34
258	9C5F8373-0B21-21EF-0836-1AD566DA5937	Input File	{"id":"00E80ADA-5132-11D8-D046-CDF9A59F436A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:44:19
259	9C5F8373-0B21-21EF-0836-1AD566DA5937	Output File	{"id":"7D5AB8B2-BBB9-E665-67E6-4D0F6F7DE982","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:44:19
260	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:45:06
261	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"88AB5D90-72EE-3C01-0258-439665D6B165","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-19 12:45:06
262	57AC5561-52BA-4A98-EA3B-B22B64E44F2E	Input File	{"id":"23A1008B-C8B1-9F06-F222-73F38057B1BD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 09:57:45
263	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 10:51:20
264	9C5F8373-0B21-21EF-0836-1AD566DA5937	Input File	{"id":"00E80ADA-5132-11D8-D046-CDF9A59F436A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 10:53:08
265	9C5F8373-0B21-21EF-0836-1AD566DA5937	Output File	{"id":"7D5AB8B2-BBB9-E665-67E6-4D0F6F7DE982","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 10:53:08
266	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 10:53:37
267	9C5F8373-0B21-21EF-0836-1AD566DA5937	Input File	{"id":"00E80ADA-5132-11D8-D046-CDF9A59F436A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 10:55:31
268	9C5F8373-0B21-21EF-0836-1AD566DA5937	Output File	{"id":"7D5AB8B2-BBB9-E665-67E6-4D0F6F7DE982","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 10:55:31
269	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:00:20
270	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:00:20
271	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:06:12
272	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:06:12
273	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:06:36
274	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:06:36
275	E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB	Input File	{"id":"E6F3CCE1-754A-207C-28E3-32FCB4FDAF77","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-20 11:54:36
276	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"8D7D9374-DA0C-B9E9-3621-B67EAC333E5A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 10:49:27
277	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Output File	{"id":"3EAB331A-641A-C7A4-A571-CFD50E1284F8","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 10:49:27
278	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"E3CD6C44-0C7F-B145-502C-AFDC452A1250","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 10:56:22
279	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Output File	{"id":"3EAB331A-641A-C7A4-A571-CFD50E1284F8","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 10:56:22
280	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"E3CD6C44-0C7F-B145-502C-AFDC452A1250","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 10:57:04
281	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Output File	{"id":"3EAB331A-641A-C7A4-A571-CFD50E1284F8","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 10:57:04
282	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"E3CD6C44-0C7F-B145-502C-AFDC452A1250","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 11:02:01
283	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Output File	{"id":"3EAB331A-641A-C7A4-A571-CFD50E1284F8","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-23 11:02:01
284	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"380085BD-93BE-D251-8DA1-FC92586E5BEA","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-26 11:55:24
285	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"AA988181-2F3B-8D57-8929-79A9DB7D3C37","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-26 12:00:23
286	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-26 12:05:59
287	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"840AA479-A4A9-54E9-21C4-ACC5601CEF80","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-26 13:30:57
288	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"840AA479-A4A9-54E9-21C4-ACC5601CEF80","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-26 13:31:00
289	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Input File	{"id":"E3CD6C44-0C7F-B145-502C-AFDC452A1250","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-27 11:38:53
290	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	Output File	{"id":"EE483191-4D37-7B43-1945-C5351C13E73A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-27 11:38:53
291	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-27 14:21:11
292	8C5AFCC1-BC0F-1E24-38D4-B44D979F3FB6	Input File	{"id":"79A53621-6A86-2A1E-AC2A-233EF6EEB117","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-28 11:12:08
293	AC9C1523-DFBE-94A0-D638-D9D455A674C0	Input File	{"id":"C5DC95DA-3B66-6DA6-F21B-6E60CF5BE451","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-28 17:18:03
294	AC9C1523-DFBE-94A0-D638-D9D455A674C0	Output File	{"id":"F675F55D-224E-4D17-E3F6-20E19AF0488E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-28 17:18:03
295	AC9C1523-DFBE-94A0-D638-D9D455A674C0	Input File	{"id":"C5DC95DA-3B66-6DA6-F21B-6E60CF5BE451","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-28 17:19:16
296	AC9C1523-DFBE-94A0-D638-D9D455A674C0	Output File	{"id":"F675F55D-224E-4D17-E3F6-20E19AF0488E","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-28 17:19:16
297	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 06:38:08
298	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 06:48:37
299	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 07:35:34
300	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 07:47:45
301	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 08:02:41
302	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 08:07:51
303	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 08:20:26
304	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	Input File	{"id":"E8ED93E1-123D-E431-77CC-A5CEEEACE32D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-29 09:03:29
305	8C5AFCC1-BC0F-1E24-38D4-B44D979F3FB6	Input File	{"id":"EA18E14A-DC7F-1273-0DF8-46BD341C621A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-07-31 06:24:59
306	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	Input File	{"id":"A8BFB2B0-9FFE-1645-7A33-7ABA3C1BC4A6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:21:05
307	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	Input File	{"id":"A8BFB2B0-9FFE-1645-7A33-7ABA3C1BC4A6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:22:51
308	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	Input File	{"id":"A8BFB2B0-9FFE-1645-7A33-7ABA3C1BC4A6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:24:01
309	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	Input File	{"id":"A5EE3A74-6337-D275-C36B-F5E162C23A42","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:27:34
310	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	Input File	{"id":"A5EE3A74-6337-D275-C36B-F5E162C23A42","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:32:46
311	D1C1258F-47B8-6149-EEDC-817F6F9CEDA1	Input File	{"id":"22DDD29C-233E-4807-3690-D2114FF72D55","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:53:54
312	D1C1258F-47B8-6149-EEDC-817F6F9CEDA1	Output File	{"id":"03729608-6288-A451-B86B-DDCA043278D6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 10:53:54
313	D1C1258F-47B8-6149-EEDC-817F6F9CEDA1	Input File	{"id":"22DDD29C-233E-4807-3690-D2114FF72D55","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:05:18
314	D1C1258F-47B8-6149-EEDC-817F6F9CEDA1	Output File	{"id":"03729608-6288-A451-B86B-DDCA043278D6","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:05:18
315	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:08:54
316	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:08:54
317	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:09:36
318	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:09:36
319	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:09:44
320	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:09:44
321	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	Input File	{"id":"F34F6D0F-CEE5-0589-66FC-C1C8062AE9AB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:10:43
322	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	Output File	{"id":"47D9273C-D6A5-4138-7965-8E755D3D1098","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:10:43
323	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	Input File	{"id":"F34F6D0F-CEE5-0589-66FC-C1C8062AE9AB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:22:04
324	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	Output File	{"id":"47D9273C-D6A5-4138-7965-8E755D3D1098","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:22:04
325	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:24:41
326	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:24:41
327	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:27:34
328	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:27:34
329	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:29:24
330	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:29:24
331	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	Input File	{"id":"F34F6D0F-CEE5-0589-66FC-C1C8062AE9AB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:29:53
332	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	Output File	{"id":"47D9273C-D6A5-4138-7965-8E755D3D1098","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:29:53
333	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Input File	{"id":"F258F6B1-DDF3-7901-2125-B91B6D488B7C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:31:11
334	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	Output File	{"id":"6FFDD24F-0407-B8ED-282C-FED89C0DCC8A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:31:11
335	9C5F8373-0B21-21EF-0836-1AD566DA5937	Input File	{"id":"00E80ADA-5132-11D8-D046-CDF9A59F436A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:36:01
336	9C5F8373-0B21-21EF-0836-1AD566DA5937	Output File	{"id":"7D5AB8B2-BBB9-E665-67E6-4D0F6F7DE982","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:36:01
337	9C5F8373-0B21-21EF-0836-1AD566DA5937	Input File	{"id":"00E80ADA-5132-11D8-D046-CDF9A59F436A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:45:48
338	9C5F8373-0B21-21EF-0836-1AD566DA5937	Output File	{"id":"7D5AB8B2-BBB9-E665-67E6-4D0F6F7DE982","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 12:45:48
339	5D98975B-85BD-E0AF-F861-56655E32A563	Input File	{"id":"D79FAD56-39BA-B36F-0221-E5F9DEC2DD20","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 18:31:19
340	5D98975B-85BD-E0AF-F861-56655E32A563	Output File	{"id":"54CBEC4B-9FC9-A28C-CF3A-52F26CC767F1","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-01 18:31:19
341	DC742ED5-A823-5EE0-35DC-2911A6485AA2	Input File	{"id":"173E3DDD-BC80-279F-080D-A3B88FD43A02","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 07:23:45
342	DC742ED5-A823-5EE0-35DC-2911A6485AA2	Input File	{"id":"C851957F-C237-639A-880B-1FE557600FD9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 07:26:25
343	8471B72E-A57D-D8DC-4E23-372FF5203B5B	Input File	{"id":"BBC53F47-8730-4685-6C72-72CC0F471AB8","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 14:21:05
344	A5E1D791-35CF-C0B2-F9FD-09C84AA2AE4E	Input File	{"id":"2EAF5CEC-9CFB-FC2F-C480-AF58A6659318","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 16:28:28
345	A5E1D791-35CF-C0B2-F9FD-09C84AA2AE4E	Input File	{"id":"2EAF5CEC-9CFB-FC2F-C480-AF58A6659318","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 16:28:42
346	287629A8-79BD-B14A-44D7-9C254EBE2832	Input File	{"id":"6E84840C-07A8-DD09-29B6-AF24061C8CBB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 18:41:19
347	287629A8-79BD-B14A-44D7-9C254EBE2832	Output File	{"id":"F14FC414-4B9A-F4AC-3832-6FC3F52CE390","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-02 18:41:19
348	C8FEA992-336B-2149-FEAA-AB211262B1C5	Input File	{"id":"CFA7EE4C-28E3-7F49-4AD7-7DA558BAED62","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 07:51:53
349	C8FEA992-336B-2149-FEAA-AB211262B1C5	Input File	{"id":"CFA7EE4C-28E3-7F49-4AD7-7DA558BAED62","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 08:21:21
350	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	Input File	{"id":"B5BEF382-96DA-0F81-20DE-10DC96FF6B7B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 10:55:20
355	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	Input File	{"id":"8C401FB5-1A24-2622-B1F4-D8B8473327C2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 11:01:33
356	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	Input File	{"id":"B5BEF382-96DA-0F81-20DE-10DC96FF6B7B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 11:11:06
357	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	Input File	{"id":"B5BEF382-96DA-0F81-20DE-10DC96FF6B7B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 11:17:15
358	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	Input File	{"id":"8C401FB5-1A24-2622-B1F4-D8B8473327C2","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 11:18:23
359	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	Input File	{"id":"B5BEF382-96DA-0F81-20DE-10DC96FF6B7B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 11:24:25
360	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	Input File	{"id":"B5BEF382-96DA-0F81-20DE-10DC96FF6B7B","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 11:45:07
361	95ED93CD-20D2-313A-43E4-1C70F8733AEB	Input File	{"id":"99FABA7A-8544-A4E5-56FB-594730CC35CD","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 17:07:15
362	95ED93CD-20D2-313A-43E4-1C70F8733AEB	Output File	{"id":"ACE1AEBE-B1EE-7499-2FFA-E2C5458461BA","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-03 17:07:15
363	tcfd2eccda56f4039a7da61b5fddabbc9	Input File	{"id":"9AAC817E-F909-66E1-9CD6-1CC49971C502","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-04 10:25:36
364	t30a4373655ea4d25988df49fa8388cf7	Input File	{"id":"fragmentBiasCorrect","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-04 15:54:40
365	623023BC-2771-6000-B6A9-60A5B7EAFD81	Input File	{"id":"F5B95E08-FBEE-F945-B2FF-0353BCC9518D","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-04 15:59:48
366	te37efff824e74cf8b0303f53c2554854	Input File	{"id":"fragmentBiasCorrect","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-04 16:30:30
367	t6940def07193459a86648530979bbf34	Input File	{"id":"fragmentBiasCorrect","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-04 17:09:27
368	C8FEA992-336B-2149-FEAA-AB211262B1C5	Input File	{"id":"CFA7EE4C-28E3-7F49-4AD7-7DA558BAED62","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-05 07:40:53
369	ADEE47E5-F60A-01D6-E012-AC54BEE21128	Input File	{"id":"4CB6FB31-D1EE-0A49-D489-92DD9E07DE88","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-05 07:56:23
370	8C5AFCC1-BC0F-1E24-38D4-B44D979F3FB6	Input File	{"id":"EA18E14A-DC7F-1273-0DF8-46BD341C621A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-05 12:17:08
371	C8FEA992-336B-2149-FEAA-AB211262B1C5	Input File	{"id":"CFA7EE4C-28E3-7F49-4AD7-7DA558BAED62","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-06 05:49:40
372	ADEE47E5-F60A-01D6-E012-AC54BEE21128	Input File	{"id":"4CB6FB31-D1EE-0A49-D489-92DD9E07DE88","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-07 08:10:22
373	3D8B6BB1-BC60-4853-C335-4816FCCCD1F7	Input File	{"id":"E790AB20-209D-44C7-3657-7C6C3EC4B50C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-07 12:34:11
374	3D8B6BB1-BC60-4853-C335-4816FCCCD1F7	Input File	{"id":"E790AB20-209D-44C7-3657-7C6C3EC4B50C","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-07 12:36:07
375	0440F1FE-9AF5-E498-4A27-BD82A4F4B0D8	Input File	{"id":"6337C76C-AF4A-DF9D-F7B2-13FC8D72043A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-07 14:14:52
376	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	Input File	{"id":"287AD7FC-8B55-F3FC-859E-1A50DAF56AFB","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 08:14:04
377	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	Input File	{"id":"4D3504D2-0A64-3613-AFD8-DA52178E2F53","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 08:48:15
378	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	Input File	{"id":"D244E17C-0E4B-6A3D-8BF4-F172B9030E5F","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 08:58:48
379	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	Input File	{"id":"57EE1D3C-79DA-9655-3072-0B2709B2FADC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 09:29:48
380	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	Input File	{"id":"57EE1D3C-79DA-9655-3072-0B2709B2FADC","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 09:42:52
381	BC2BA17D-6CB0-4665-2955-8D96D30679F7	Input File	{"id":"F4B1B5E4-7D00-DBC3-D2EE-72C762582CA9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 17:20:32
382	BC2BA17D-6CB0-4665-2955-8D96D30679F7	Input File	{"id":"F4B1B5E4-7D00-DBC3-D2EE-72C762582CA9","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-09 17:33:27
383	5C0E79B5-D59D-E4D2-E443-66B1BB23AE4D	Input File	{"id":"E9AC325D-ADB7-5D60-4797-9C619A4FFD1A","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 14:41:08
384	5C0E79B5-D59D-E4D2-E443-66B1BB23AE4D	Output File	{"id":"C1F31B05-569E-DD8B-1F25-E04931B28BCA","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 14:41:08
385	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 19:15:13
386	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 19:24:54
387	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"5EFC7C92-0224-BDC7-66DE-CC24A7F84B01","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 19:34:11
388	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 19:43:25
389	1696856E-7DD6-3403-1898-3CEE5E979D29	Input File	{"id":"19D23296-EA74-E315-00D3-77BBA6540367","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-10 19:52:40
390	53E12CC1-77A3-10DB-5F6C-F2139C48746A	Input File	{"id":"6F02DE6B-B4BD-D9F4-EA48-B8A55D9CCEEF","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-11 15:14:01
392	53E12CC1-77A3-10DB-5F6C-F2139C48746A	Input File	{"id":"6F02DE6B-B4BD-D9F4-EA48-B8A55D9CCEEF","hid":0,"description":"no-desc","name":"[]","label":"no-label"}	2011-08-11 15:14:22
\.


--
-- Data for Name: dataobject_mapping; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataobject_mapping (mapping_id, input, output) FROM stdin;
1	samin	samall
2	alignment	outputbam
3	pileup_file	pileup
4	pileup	pileup
5	reference	in#refgen
6	reads	fastqall
\.


--
-- Data for Name: dataobjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dataobjects (hid, id, name, label, orderd, switch, info_type, data_format, description, required, multiplicity) FROM stdin;
872	D79FAD56-39BA-B36F-0221-E5F9DEC2DD20	SNP	\N	1		3	1		t	1
873	54CBEC4B-9FC9-A28C-CF3A-52F26CC767F1	output.csv	\N	2		3	1		f	1
918	B6423FD7-C511-C50F-0EE6-7EE516B881E5	Tree file:	\N	3		18	1		t	1
919	8C401FB5-1A24-2622-B1F4-D8B8473327C2	Trait file:	\N	2		17	1		t	1
924	0832A404-9B15-8620-472C-FF2A520378A4	Paired-end Sequence Library #1	\N	5	--lib1=	15	1		t	1
925	3231E4FC-1FAF-D84F-6F7A-795BD5932A0F	Paired-end Sequence Library #2 (optional)	\N	6	--lib2=	15	1		f	1
926	6B274154-80AF-DC92-F790-A5477C64D798	Paired-end Sequence Library #3 (optional)	\N	7	--lib3=	15	1		f	1
927	B5BEF382-96DA-0F81-20DE-10DC96FF6B7B	Single-end Sequence Library (optional)	\N	8	--se=	15	1		f	1
932	geneList	File containing a gene list	\N	0	--genelist 	3	1		t	1
933	GeneManiaOutput	*results.report*	\N	4	 	3	1		t	0
934	GTFList	Select one or more Cufflinks GTF files	\N	0	 	3	1		t	0
935	C851957F-C237-639A-880B-1FE557600FD9	Select reference genome annotation -or-	\N	-1	--cannedReference=	8	1		f	1
936	9AAC817E-F909-66E1-9CD6-1CC49971C502	Select a user-defined GTF annotation	\N	-1	--userReference=	13	1		f	1
964	4CB6FB31-D1EE-0A49-D489-92DD9E07DE88	Select a results file from BLASTX Contig Annotation	\N	5	--input=	22	1		t	1
966	E790AB20-209D-44C7-3657-7C6C3EC4B50C	List of GIs or accessions 	\N	2	-i 	24	1		t	1
8	samFile	*bam	\N	-3		3	1	\N	t	1
978	4D3504D2-0A64-3613-AFD8-DA52178E2F53	Rscript	\N	1		24	1		t	1
979	57EE1D3C-79DA-9655-3072-0B2709B2FADC	Input tree	\N	2	-p 	18	1		t	1
983	90BE123D-2DB9-2C94-B7EC-4E080DC3CA95	Rscript	\N	1		24	1		t	1
984	530EEB98-5DA4-2421-4D56-ADDF4A18C022	Input tree	\N	3	-p 	18	1		t	1
985	F4B1B5E4-7D00-DBC3-D2EE-72C762582CA9	Input data	\N	4	-c 	17	1		t	1
1004	5EFC7C92-0224-BDC7-66DE-CC24A7F84B01	picante.R	\N	1		3	1		t	1
1005	7E76E0D2-B804-65A8-0427-BA741F9065BB	Tree	\N	2	-f 	3	1		t	1
1006	80F63A3B-D13A-3891-FB2C-C6D3409BC576	Sample	\N	3	-s 	3	1		t	1
1007	19D23296-EA74-E315-00D3-77BBA6540367	Trait	\N	4	-t 	3	1		t	1
1014	DB1BB95F-6195-BA4F-1F1F-0A28ED6FAD26	dnadist	\N	1	-d	3	1		f	1
1015	4AA2B4DC-DD1C-DE2D-BB97-AC0F19D05D27	dnadist1	\N	-1	-d1	3	1		f	1
1016	6F02DE6B-B4BD-D9F4-EA48-B8A55D9CCEEF	dnadist2	\N	-1	-d2	3	1		f	1
895	input	Input Files	\N	0		3	1	Select files in the order you wish them to be added to the bundle.	t	0
928	FastaSizeFilterInput	Input File	\N	0	-i 	3	1		t	1
929	FastaSizeFilterOutput	fasta_filter_by_length_out.fa	\N	3	-o 	3	1		t	1
954	BAMList	Select one or more Tophat SAM/BAM files	\N	0	 	3	1		t	0
955	cannedGTF	Select reference genome annotation:	\N	-1	--cannedReference=	8	1		t	1
956	fragmentBiasCorrect	Select reference genome to correct for fragment bias (optional):	\N	-1	--frag-bias-correct=	7	1		f	1
957	maskFile	Specify a mask file (optional)	\N	-1	--mask-file=	3	1		f	1
963	CFA7EE4C-28E3-7F49-4AD7-7DA558BAED62	Choose a FASTA file containing transcripts:	\N	5	--queryFile=	15	1		t	1
967	DAF3ED52-9A10-54EB-BC5A-F31B34F0F49D	Select input FASTQ file	\N	9	-i 	15	1		t	1
968	50A39C25-D1E2-2255-0CE0-56617902867A	Select Reference Genome	\N	1	-g 	7	1		t	1
969	6337C76C-AF4A-DF9D-F7B2-13FC8D72043A	Select Reference Annotation	\N	2	-a 	8	1		t	1
225	CatInput	Input Files	\N	0	 	3	1	Select files in the order you wish them to be joined, head-to-tail.	t	0
467	OutputFilePhylipInterlaced	alignment.phylipi	\N	3	 -phyiout 	3	1		t	1
468	OutputFileFasta	alignment.mfa	\N	3	 -fastaout 	3	1		t	1
582	BWAReferenceGenome	Select a reference genome from the list:	\N	1	--database 	7	1		f	1
583	BWAInputFile	Select Read 1 FASTQ file:	\N	2	--query1 	3	1		t	1
153	C2C94A39-081A-530D-E51B-112B2DEF5A64	genotype.	\N	-1	--outFile	3	1		t	0
16	samin	Select input SAM file(s):	\N	2	 	3	1	\N	t	0
47	pdfs	*_plot.pdf	\N	-1		3	1	\N	t	0
48	trees	*_tree.txt	\N	-1		3	1	\N	t	0
49	nodes	*_nodes.txt	\N	-1		3	1	\N	t	0
50	outs	*_out.txt	\N	-1		3	1	\N	t	0
54	pdfs	*_plot.pdf	\N	-1		3	1	\N	t	0
55	trees	*_tree.txt	\N	-1		3	1	\N	t	0
861	6FFDD24F-0407-B8ED-282C-FED89C0DCC8A	outdir	\N	3	-o 	3	1		f	0
871	7D5AB8B2-BBB9-E665-67E6-4D0F6F7DE982	output directory name	\N	5	-o 	3	1		f	0
833	5EF1FE77-76BD-1F1C-1332-19B52345C77F	PhenotypeFile	\N	8		3	1		t	1
834	E3BBC9DC-E82F-2A45-E76D-EFDD569BA27E	GenotypeFile	\N	9		3	1		t	1
835	0C5C3148-9ECA-F822-0B78-85CF6DF59CF2	PopssmallFile	\N	10		3	1		t	1
836	A8BFB2B0-9FFE-1645-7A33-7ABA3C1BC4A6	SeedsmallOrderFile	\N	11		3	1		t	1
837	A5EE3A74-6337-D275-C36B-F5E162C23A42	SeedsmallMissFile	\N	14		3	1		t	1
840	22DDD29C-233E-4807-3690-D2114FF72D55	Iris Data File	\N	1	-f 	3	1		f	1
841	03729608-6288-A451-B86B-DDCA043278D6	run1	\N	7	-o 	3	1		f	1
701	23A1008B-C8B1-9F06-F222-73F38057B1BD	Map File	\N	-1	-i 	3	1		f	1
858	F34F6D0F-CEE5-0589-66FC-C1C8062AE9AB	GAW15 File	\N	1	-f 	3	1		t	1
859	47D9273C-D6A5-4138-7965-8E755D3D1098	run2	\N	9	-o 	3	1		f	1
860	F258F6B1-DDF3-7901-2125-B91B6D488B7C	gene expression dataset in text format	\N	1	-i 	24	1		t	1
720	9F1477D6-594E-82D9-06D0-630B388EE6DC	Trait Data	\N	-1	-i 	3	1		f	1
721	E6F3CCE1-754A-207C-28E3-32FCB4FDAF77	Map File	\N	-1	-m 	3	1		f	1
56	nodes	*_nodes.txt	\N	-1		3	1	\N	t	0
57	outs	*_out.txt	\N	-1		3	1	\N	t	0
60	barcodeFiles	*Barcode*	\N	-1	 	3	1	\N	t	0
61	*unmatched	*unmatched	\N	-1	 	3	1	\N	t	0
70	readFile	Select read file(s):	\N	2		3	1	\N	t	0
72	samfiles	Select SAM File(s):	\N	3		3	1	\N	t	0
148	6BBCB6A1-9EAA-E78B-BCD4-840AC34FC8B7	Specify Fasta Sequence Files to Align	\N	1		3	1		t	0
458	58DCE2C7-49FD-89C3-7631-44D2BBA14B0A	Select reads	\N	3	-i 	15	1		t	0
460	FBE7B318-6032-38B4-569E-713451142B78	Select reads	\N	3	-i 	15	1		f	0
74	F1B1FF5B-AB04-3458-B69D-79C22F4317A4	Select Sequence File	\N	-1	-in 	3	1		t	1
75	0C34827D-53E3-371B-4050-02223B9C956C	muscle.alignment.interleaved.phylip	\N	-1	-phyiout 	3	1		t	1
76	0B312A6A-1642-53B0-6022-1FD857FD0CC4	muscle.alignment.fasta	\N	-1	-fastaout 	3	1		t	1
77	2320C117-30E4-6D35-07D9-98AC3D4D80EE	muscle.alignment.clustalw	\N	-1	-clwout 	3	1		t	1
78	F949FB43-6A12-EEAB-7D13-6FD48283A869	Alignment file in phylip format	\N	-1	-i	3	1		t	1
79	B7D4002E-47C1-67F3-3649-1E7670279B77	input the qstats file from fastx_quality_stats	\N	-1	-i	3	1		t	1
80	2B2CCB5A-8FD2-522D-A326-8EE9A7AFFB0E	ntDistribution	\N	-1	-o 	3	1		t	1
81	712EA26F-525C-E9A8-D29D-C8E60E90CEF7	qstats file from fastx_quality_stats	\N	-1	-i	3	1		t	1
82	604ABD4F-5290-5120-D7A4-AE7A59F8670D	qchart	\N	-1	-o 	3	1		t	1
83	3DE3FA93-0CED-52B0-B210-FC907C63D8AE	fastq or fasta	\N	-1	-i	3	1		t	1
84	81D65962-2FC8-6D69-1232-AAFF385B2D59	qstats	\N	-1	-o 	3	1		t	1
85	2040C021-B6FE-D933-5C77-8B19535BE7A0	Choose R script	\N	-1	 	3	1		t	1
86	09756F30-2F29-DA2C-0D65-C5754501DC28	Choose phlyogeny	\N	-1	-p	3	1		t	1
87	4F44102C-3269-7CED-4AFB-AF08E79E8E62	Input CSV	\N	1		3	1		t	1
88	08015F21-5041-0BA4-0E6F-33E72547B368	input_file1	\N	1		3	1		t	1
89	11D65BF0-DFB2-84A1-15FC-7BDEAF0CC5EF	unput_file2	\N	1		3	1		t	1
90	35CFEA78-9B98-E489-A075-95444310CD17	output_cuffcompare	\N	-1	-o 	3	1		t	1
94	8B986A49-CF3E-DFFF-7D36-E5FDCE84117C	ouch	\N	1		3	1		t	1
95	5DBC9320-3381-C262-27BA-7C531F11D206	test.tre	\N	2		3	1		t	1
96	C2CEF1A3-31E4-ECB4-0A70-64C64A19443E	test.data	\N	3		3	1		t	1
97	5DBD8A60-1D0E-B670-71EC-E7CC8C1A470A	input vcf file	\N	-1	-i 	3	1		t	1
98	A2132840-CE6C-5DF5-D0AA-FB3A6E71CC9A	output.gff	\N	-1	-o 	3	1		t	1
99	2934FF9C-DC6F-7410-EBBA-8699475D0F71	script	\N	-1	 	3	1		t	1
100	F2EFE844-81CC-E5DE-E357-DF3139F31A17	obo	\N	-1	-g	3	1		t	1
101	165DB1E1-7CC5-B556-A180-1CFF07E24DED	asso	\N	-1	-a	3	1		t	1
102	D13D90E0-1AC3-ACB1-044F-730AA949150C	population	\N	-1	-p	3	1		t	1
103	1CEA5140-96F9-7E66-287A-BFAD2937F1A7	diff	\N	-1	-s	3	1		t	1
113	FCF47A79-C064-7ABB-6EB0-EDFD9C483CC0	Sequence	\N	-1	-s	3	1		t	1
114	2F353B0C-F4E8-03EE-03C2-AD0215BEE7B6	RAxMLRun	\N	-1	-n	3	1		t	1
136	738EAA28-5F3F-EEB5-E869-A85D7C771031	Input file	\N	-1	-f	3	1		t	1
137	738EAA28-5F3F-EEB5-E869-A85D7C771031	Input file	\N	-1	-f	3	1		t	1
138	53BB7F74-1FC8-0481-2C58-7C62202FFEED	Select file:	\N	-1	-i	3	1		t	1
139	64B2261B-9424-45C3-5A47-3C52A897D0FE	meh.txt	\N	-1	-o	3	1		t	1
149	86CF3317-B9F8-6365-4781-092976C9F651	mauve.alignment	\N	-1	--output=	3	1		t	1
152	222B691A-FFD0-4A93-12A1-1DECFC62E4A6	Input file-a-roo	\N	-1	-infile 	3	1		t	1
154	C9420B15-84A8-581F-C287-7842733190E2	Trait Data	\N	-1	-i	3	1		t	1
155	95F1EA72-5C02-9321-BB61-4F805E2A8CBD	Map Data	\N	-1	-m	3	1		t	1
156	715BC420-0363-3F3C-B13E-2B5F54B3D3AD	Select File	\N	-1	-f	3	1		t	1
157	8447851F-2347-1B35-1655-C4AA9F639918	output.txt	\N	-1	-o	3	1		t	1
158	9972F8FA-9B65-79DB-46FA-5057D754D8BE	Select File	\N	-1	-n	3	1		t	1
159	4BBD8C53-EDFE-078C-54DD-CF61C8030A6F	output	\N	-1	-o	3	1		t	1
160	025BEAD7-947F-B564-E14A-39E2E05F12D8	Trait Data	\N	-1	-i	3	1		t	1
161	A91D6526-3A5A-706F-E435-F75F46FBA218	Map Data	\N	-1	-m	3	1		t	1
1	readFile	Select read file:	\N	1	 --run1 	3	1	\N	t	1
2	mateFile	Select mate file:	\N	2	 --run2 	3	1	\N	t	1
3	outreadFile	s_5_1_sequence.f.txt	\N	1	 --out1 	3	1	\N	t	1
4	outmateFile	s_5_2_sequence.f.txt	\N	2	 --run2 	3	1	\N	t	1
5	readFile	Select read file:	\N	3		3	1	\N	t	1
6	mateFile	Select mate file:	\N	4		3	1	\N	t	1
7	referenceGenome	Select reference genome:	\N	2	 --GTF 	6	1	\N	t	1
9	bedFile	*bed	\N	-3		3	1	\N	t	1
10	readFile	Select read file:	\N	3		3	1	\N	t	1
11	referenceGenome	Select reference genome:	\N	2	 --GTF 	6	1	\N	t	1
12	samFile	*bam	\N	-3		3	1	\N	t	1
13	bedFile	*bed	\N	-3		3	1	\N	t	1
14	samin	Select input SAM file:	\N	2	 	3	1	\N	t	1
15	outputbam	aln.bam	\N	-1	  	3	1	\N	t	1
17	outputbam	accepted_hits.sam	\N	-1	  	3	1	\N	t	1
18	pileup_file	Select the pileup file	\N	29		3	1	\N	t	1
19	pileup	final.pileup	\N	-1	 	3	1	\N	t	1
20	pileup	Select pile up file:	\N	3	 	3	1	\N	t	1
21	reference	Select Reference Genome	\N	1	 --refseq 	7	1	\N	t	1
22	result	file.vcf	\N	-1	  	3	1	\N	t	1
23	alignment	Select input alignment	\N	8	 	3	1	\N	t	1
24	refgen	Select the reference genome	\N	7	 -vcf 	7	1	\N	t	1
25	pileup	temp.pileup	\N	-1	 	3	1	\N	t	1
26	reads	Select reads for alignment:	\N	11	 	3	1	\N	t	1
27	reference	Select reference genome:	\N	10	 	7	1	\N	t	1
28	samfile	aln.sam	\N	-50	 	3	1	\N	t	1
29	reads	Select reads:	\N	11	 	3	1	\N	t	1
30	matefile	Select mate file:	\N	11	 	3	1	\N	t	1
31	reference	Select reference genome:	\N	2	 	7	1	\N	t	1
32	samfile	aln.sam	\N	-50	 	3	1	\N	t	1
41	tree	Selected Trees	\N	2		2	1	\N	t	1
42	reconciletaxa	Select Trait Dataset	\N	1		4	1	\N	t	1
43	commandf	outfile	\N	-1	 	3	1	\N	t	1
44	commandf	outfile	\N	-1		3	1	\N	t	1
45	tree	Select input tree	\N	3	 	1	1	\N	t	1
46	reconciletaxa	Select Trait Dataset	\N	-1	 	4	1	\N	t	1
51	txt	dataout.csv	\N	-1		3	1	\N	t	1
52	tree	Select input tree	\N	2		1	1	\N	t	1
53	reconciletaxa		\N	2	 	4	1	\N	t	1
58	txt	dataout.csv	\N	-1		3	1	\N	t	1
59	sequencefile	Select file:	\N	1	 	3	1	\N	t	1
62	sequencefile	Select file:	\N	2	 	3	1	\N	t	1
63	fastqout	outputfastq.fastq	\N	4	 	3	1	\N	t	1
401	3FDEB5F4-39FE-4C5C-AF2A-A47A413EBEC0	DNA alignment in phylip format	\N	-1	-i 	3	1		t	1
71	fastqall	fastq_all.fastq	\N	-1		3	1	\N	t	1
262	FastQCInput	Input File	\N	0		3	1		t	1
263	FastQC_Output_Zip	fastqc_report.zip	\N	2		3	1		t	1
127	342FB441-523F-25B3-674D-3309FAFEA059	Script	\N	-1	 	3	1		t	1
128	4B0EFA36-9CF5-3FB6-4AA9-0C270A075D4B	List of sequence	\N	-1	-i	3	1		t	1
129	AF06D786-DDC0-1961-BAEF-0FC586A77C57	ncbi_seqs.fa	\N	-1	-o 	3	1		t	1
141	DA459BB0-58F3-3CC6-CE3C-FA1318467051	Multiple Sequence Alignment File in Phylip format	\N	-1	-i	3	1		t	1
144	52FD75C8-4ACC-659D-01CF-5E8DC99EB420	Trait data	\N	-1	-i	3	1		t	1
145	469A943A-C5E8-B2B2-3360-19C01872577C	Map dat	\N	-1	-m	3	1		t	1
162	092DB800-76FF-BC16-C09D-B60CA5C9716D	Linear Regression Results	\N	-1	-I	3	1		t	1
163	92F84B32-95F1-AED1-B7A2-46D7140B8AB7	Stepwise Regression Results	\N	-1	-S	3	1		t	1
164	D42DACF9-652E-F1E0-5BE8-9A82657C06AE	Trait dat	\N	-1	-i	3	1		t	1
165	72BED9B5-E1DC-014D-24CE-445A27D3F53E	Map Data	\N	-1	-m	3	1		t	1
166	6A7975ED-78D5-E32E-0A11-4EAE896536B0	Eqtl Results for Model 7 (qtlcart.eqt)	\N	-1	-E	3	1		t	1
167	CA04F3FE-9022-0676-075F-CACC6CBFDAAF	SRmapqtl Results for Model 6 (qtlcart.sr)	\N	-1	-S	3	1		t	1
168	3CCD365C-2377-3C85-55B1-F8DBF61CD7FD	Trait Data	\N	-1	-i	3	1		t	1
169	A74C5D9A-9AD2-1D73-19A1-D3FD5184D18E	Map Data	\N	-1	-m	3	1		t	1
170	2974C8F1-7DD1-CF25-1C99-ABE10190A678	Initial Model	\N	-1	-E	3	1		t	1
264	FastQC_Output_PNG	fastqc_report.png	\N	2		3	1		t	1
265	FastQC_Output_PDF	fastqc_report.pdf	\N	2		3	1		t	1
177	D3568E49-D5FE-F49D-BCC8-64970CCAF16F	Script (http://irodsweb.iplantcollaborative.org/quickshare/df169fa1710dd120/treeview.pl)	\N	1		3	1		t	1
178	D92E2E8A-3043-8C81-BB03-DE07729D07BC	Tree	\N	2		3	1		t	1
402	27D859D3-EC79-7EFB-3BF5-6A708F1DF34D	AA alignment in phylip format	\N	-1	-i 	3	1		t	1
421	SOAP2ReferenceGenome	Select a reference genome from the list.	\N	1	--database 	7	1		t	1
422	SOAP2InputFile	Select Read 1 FASTQ sequence:	\N	2	--query1 	3	1		t	1
423	SOAP2InputFile2	Select Read 1 FASTQ sequence:	\N	2	--query2 	3	1		t	1
425	CA29B307-96A3-04BE-9B73-E2AD0A528205	DNA alignment in phylip format	\N	-1	-i 	3	1		t	1
309	inputSAM	Select a SAM File	\N	0	 	3	1		t	1
310	treatment	Immunoprecipitated reads alignment file	\N	1	-d 	3	1		t	1
311	control	Control reads alignment file	\N	2	-c 	3	1		t	1
312	wiggleOut	PeakRanger_Analysis	\N	0	 -o 	3	1		t	1
344	TopHatReferenceGenome	Select a reference genome from the list.	\N	1	--database 	7	1		t	1
345	TopHatInputFile1	Select Read 1 FASTQ file to align:	\N	2	--query1 	3	1		t	1
346	TopHatInputFile2	Select Read 2 FASTQ file to align:	\N	2	--query1 	3	1		t	1
347	TopHatReferenceGenome	Select a reference genome from the list.	\N	1	--database 	7	1		t	1
348	TopHatInputFile1	Select FASTQ sequence to align	\N	2	--query1 	3	1		t	1
171	B6E30982-7D95-234E-5116-FBD79B539FCF	Zmapqtl Output	\N	-1	-z	3	1		t	1
172	684FA2F6-2A15-F5F9-93DF-54A530A2C3B3	Map Data	\N	-1	-m	3	1		t	1
360	4D45C32E-8AFF-3B70-0FF5-30F6945DC18B	Sequence alignment file in phylip format	\N	-1	-i 	3	1		t	1
396	SOAP2ReferenceGenome	Select a reference genome from the list.	\N	1	--database 	7	1		t	1
397	SOAP2InputFile	Select FASTQ sequence to align	\N	2	--query1 	3	1		t	1
226	CatOutput	concatenate_out.txt	\N	1	 > 	3	1		t	1
229	CutInput	Input File	\N	0	 	3	1		t	1
236	GrepInput	Input File	\N	0		3	1		t	1
237	GrepOutput	grep_tool_output.txt	\N	1		3	1		t	1
238	HeadInput	Input File	\N	0		3	1		t	1
239	HeadOutput	head_output.txt	\N	2		3	1		t	1
243	JoinInput1	Input File 1	\N	6		3	1		t	1
244	JoinInput2	Input File 2	\N	8		3	1		t	1
245	JoinOutput	join_tool_output.txt	\N	10		3	1		t	1
252	TailInput	Input File	\N	0		3	1		t	1
253	TailOutput	tail_output.txt	\N	2		3	1		t	1
254	UniqInput	Input File	\N	2	 	3	1		t	1
255	UniqOutput	uniq_out.txt	\N	2	 > 	3	1		t	1
256	wcInput	Input File	\N	0		3	1	Select file to analyze.	t	1
257	wcOutput	wc_out.txt	\N	1		3	1		t	1
454	7A79A2FE-F40B-D3F4-6986-FD2FBA97BDBB	select file	\N	1	-f 	3	1		t	1
455	6EE6D9BE-383C-213F-7848-9F85BE35210A	output	\N	3	-o 	3	1		f	1
459	528451F2-5875-C7AF-1311-D3255E3F897A	trimmed_output	\N	4	-o 	15	1		f	1
461	6223D23F-DDEA-531B-D458-30672E8745B2	filtered_output	\N	4	-o 	15	1		f	1
462	MuscleIn	Alignment file in Fasta format	\N	1	 -in 	3	1		t	1
463	OutputFilePhylipInterlaced	alignment.phylipi	\N	3	 -phyiout 	3	1		t	1
464	OutputFileFasta	alignment.mfa	\N	3	 -fastaout 	3	1		t	1
465	OutputFileMSF	alignment.msf	\N	3	 -msfout 	3	1		t	1
466	MuscleIn	Alignment file in Fasta format	\N	1	 -in 	3	1		t	1
469	OutputFileMSF	alignment.msf	\N	3	 -msfout 	3	1		t	1
473	1D8BDCCD-8370-C3E8-B981-BDCD4844144E	Tree file: 	\N	2		18	1		t	1
474	CEAD5D9C-CB14-6024-AFE7-50B1442A47BD	Multiple sequence alignmnet file:	\N	1	-s	10	1		t	1
477	E22EE500-0820-CECC-C35E-6A64A71064D2	Select input file	\N	1	-i 	3	1		t	1
478	8A2CF347-72FB-C037-BAD1-64255CA7F508	Output	\N	4	-o 	3	1		f	1
479	F8176C67-C26F-2E94-01F4-95F46C9E4A0F	perl_file	\N	1		3	1		t	1
480	E8304B53-53EF-D97A-DC73-C767841C89E0	output.txt	\N	2	> 	3	1		f	1
73	samall	samall.sam	\N	-1	 	3	1	\N	t	1
486	78CD047F-6D80-812A-A03C-3938717932B6	Amino Acid Alignment in phylip format	\N	1	-i 	10	1		t	1
489	22EF486C-9B82-EED4-0509-371EC667E89C	Select input file:	\N	1	-i 	3	1		t	1
490	6CAAC7B2-B311-2CA2-C91B-107FBDABE9DE	kathleenfile	\N	2	-o 	3	1		f	1
493	4E972A2F-1B72-30E5-602D-B7884905CAAD	Input file	\N	3		3	1		t	1
496	90AB77B4-3B18-B895-FB8A-2A8BD5B92198	Multiple sequence alignment:	\N	2	-s	10	1		f	1
497	069C43A5-DB21-7113-C813-A19AC0E156D1	Multiple sequence alignment:	\N	1	-s	10	1		t	1
530	4654B648-676C-2B9E-A92B-6A9F22B64AE1	Select FASTQ file:	\N	-1	-i 	3	1		t	1
531	2CB380F6-61F1-901D-2873-12F695D96F27	fastq_quality_filter_out.fastq	\N	-1	-o 	3	1		t	1
534	98B4D133-906E-A0B0-40D0-EB8A15E14D41	File 1:	\N	7		3	1		t	1
535	0559B8B1-82FA-FCA9-17A0-CCF6824A29EB	File 2:	\N	8		3	1		f	1
522	DE79E631-A10A-9C36-8764-506E3B2D59BD	Select FASTQ file:	\N	-1	-i 	3	1		t	1
523	19FB8232-FC45-27BE-52A4-F6597A053714	out.fastq	\N	-1	-o 	3	1		t	1
526	4BCC36DA-81C8-28DC-F9E4-D533F3C7F8CC	Select FASTQ file:	\N	-1	-i 	3	1		t	1
527	DBCA3638-B9E3-9F73-F972-482CED8CF9EB	fastx_clipper_out.fastq	\N	-1	-o 	3	1		t	1
536	SRAFile	Choose an SRA file:	\N	2		3	1		t	1
537	6AD1F1DE-3028-37C3-495C-861BF797D80E	Map File	\N	-1	-m 	3	1		f	1
538	74E87D03-D65A-5927-6AF3-F9CFEBB08F37	Model File	\N	-1	-q 	3	1		f	1
541	984A19CE-552A-9AFC-C090-745099333625	Map File	\N	-1	-m 	3	1		f	1
551	A2B80797-0C2E-7B0E-02F5-01F61D1B51D9	Map File	\N	-1	-i 	3	1		f	1
552	71A04BFD-19D6-D2D8-1D12-C6AA62E15B3C	Trait File	\N	-1	-i 	3	1		f	1
553	38FFF94F-DFE9-6258-3306-6348033025C7	Map File	\N	-1	-m 	3	1		f	1
555	ChangeCaseInput	Input File	\N	0	 	3	1		t	1
556	ChangeCaseOutput	change_case_out.txt	\N	3		3	1		t	1
557	AwkInput	Input File	\N	1		3	1	Select an input file.	t	1
558	AwkOutput	awk_out.txt	\N	2		3	1		t	1
561	20E95D07-148A-C2C9-17CB-E75D1D9877B4	Select Sequence File	\N	2		15	1		t	1
564	C7A75658-D385-7632-1F82-23025BAD60AF	Input Fasta File	\N	-1	-in	3	1		t	1
565	89FB8D7D-3F17-2F1A-D516-8B1A28DF68B9	muscle.alignment.fasta	\N	-1	-fastaout	3	1		f	1
566	8091B945-E2F1-0CE2-6E11-F8DF2C89EA51	muscle.alignment.interleaved.phylip	\N	-1	-phyiout	3	1		f	1
567	40E1306B-CB5D-500E-45ED-CD2662E5A86F	muscle.alignment.clustalw	\N	-1	-clwout	3	1		f	1
568	A8E3F0EF-06BF-DACD-FA35-2AC843EEB3D3	Input	\N	1	-i 	3	1		f	1
569	B404C649-7AC6-A9F4-379B-7EE5CA03FC0B	output	\N	4	-o 	3	1		f	1
572	0AC73DC6-205C-1D91-34C2-5A4C674CDF88	Tree file:	\N	2		18	1		t	1
573	B01CFA5D-6ECC-32BE-AD24-591C6A9ACF4A	Trait file:	\N	3		17	1		t	1
576	624A61C8-264D-5FB1-0435-88F4DF569B56	Perl Program	\N	1		3	1		f	1
577	C4BCC389-896F-921D-F772-64D5093556AE	output.txt	\N	2	> 	3	1		f	1
584	BWAInputFilePair	Select Read 2 FASTQ file:	\N	3	--query2 	3	1		f	1
585	790D5C03-DD37-62E8-56CB-A359C0809FCE	Perl Program	\N	1		3	1		f	1
586	9A04C9EA-84BD-7F0D-7E3E-839BCA617844	out.txt	\N	2	-outfile	3	1		f	1
587	6318F619-EECA-514E-F2B0-0173D1EAB01D	Tree file in Phylip (Newick) format	\N	2	-t 	18	1		t	1
588	99339510-DA0E-AA80-406B-C1D4C0D4A43C	Continuous character data in Phylip format	\N	1	-i 	17	1		t	1
595	BWAReferenceGenome	Select a reference genome from the list.	\N	1	--database 	7	1		f	1
596	BWAInputFile	Select FASTQ sequence to align	\N	2	--query1 	3	1		t	1
601	0DFFB68A-2390-FD80-A4EC-8ED435F2118F	Amino acid sequence alignment in phylip format	\N	1	-i 	9	1		t	1
608	A8367457-0735-9E6C-49D2-D0B4C3446E65	sequence alignment in interleaved phylip format 	\N	1	-i 	10	1		t	1
618	79FCD4D1-1F63-A079-1961-292FCE6D83E9	Input Fasta File	\N	1	-in 	3	1		t	1
619	F49C6712-B765-0AF6-EDB7-34B0147E926E	muscle.fasta.mfa	\N	3	-fastaout 	3	1		f	1
620	BCFF802C-C7BE-6688-62AA-BCEBE5EDF66F	muscle.phyip.inter.aln	\N	-1	-phyiout 	3	1		f	1
621	92D8D0B7-B447-1BC9-3378-215625EBBFCD	File select	\N	1	-i 	3	1		f	1
622	FF91510A-A9EE-5317-4338-89B118D4552B	meh	\N	4	-o 	3	1		f	1
771	190CF30A-8A97-29FB-1A88-50F80B00B9A5	Data File	\N	2	-d 	3	1		t	1
772	69BDB4E2-F21F-1D7A-EEA6-C01A1B0C0248	Marker File	\N	4	-m 	3	1		t	1
773	50508627-024F-557A-AE34-EDA8845D9698	Parameter File	\N	1	-p 	3	1		t	1
774	14BB1A95-57E1-7655-289F-A812B4254426	Pedigree File	\N	3	-g 	3	1		t	1
775	C6B39E70-261A-8336-890B-365C05187B2E	User Defined Inverse	\N	5	-i 	3	1		t	1
776	E3CD6C44-0C7F-B145-502C-AFDC452A1250	User Defined Direct	\N	6	-t 	3	1		t	1
777	EE483191-4D37-7B43-1945-C5351C13E73A	OutputFile.out	\N	7	-o 	3	1		f	1
640	C9F0CAB7-1F39-975C-D3CE-6D5A635B9BCD	Canberra Input	\N	1		3	1		t	1
642	3A110A46-23E3-756B-9F2C-DCA997421141	Input File	\N	1		3	1		t	1
786	Input	Select a contig file to analyze:	\N	0	 	3	1		t	1
787	Input1	Select Read 1 (Left) FASTQ file:	\N	0	 	3	1		t	1
788	Input2	Select Read 2 (Right) FASTQ file:	\N	1	 	3	1		t	1
789	Interlaced	Interlaced.fq	\N	2	 	3	1		t	1
808	AA988181-2F3B-8D57-8929-79A9DB7D3C37	R code	\N	-1	--vanilla 	3	1		f	1
809	E8ED93E1-123D-E431-77CC-A5CEEEACE32D	Input File	\N	-1	-i	3	1		f	1
867	6008CCA0-A301-8475-47D6-7A94AB06AC8A	gene association file	\N	2	-a 	3	1		t	1
868	35C6D8EE-F70A-417B-D86B-A9183834E6DF	GO obo file	\N	1	-g 	3	1		t	1
869	E0CDF48D-CF9A-236E-5844-607F2F3817F3	gene population file	\N	3	-p 	3	1		t	1
870	00E80ADA-5132-11D8-D046-CDF9A59F436A	genes of interest, the study set	\N	4	-s 	3	1		t	1
\.


--
-- Data for Name: deployed_components; Type: TABLE DATA; Schema: public; Owner: -
--

COPY deployed_components (hid, id, name, location, type, description, version, attribution) FROM stdin;
284	cb3e6856e42114ae9abebcb8f86f9a133	PlantQxpak.py	/usr/local2/qxpak5	executable	\N	\N	\N
285	c220e2e6557bd48619d01117f8e7f4aea	seq_stats2.pl	/usr/local3/bin/seq_stats-1.00	executable	Sequence Statistics	1.00	Compute common statistics for a file of nucleotide contigs. iPlant DE version developed by Josh Stein (steinj@cshl.edu) and Matt Vaughn (vaughn at iplantcollaborative dot org).
286	ccf050cbbecab4fbfb4f1697b73518be9	rjungle-1.2.365-i686-pc-linux-gnu	/usr/local2/rjungle	executable	\N	\N	\N
287	c6d4809204c654bd7a7b6923d7ab6d05d	rjunglesparse-1.2.365-i686-pc-linux-gnu	/usr/local2/rjungle	executable	\N	\N	\N
288	c3c2d856a73ea4d38984de9077f2fb207	run_vbay.sh	/usr/local2/VBay	executable	\N	\N	\N
289	caa8b6cd6a3e544adbf2018ccaf11fe1f	shuffleSequences_fastq.pl	/usr/local3/bin/interlace_pairs-1.00	executable	Interlace Paired FASTQ files	1.00	Interlace paired-end sequences into a single file. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
296	c22cc44a316fe4b098aec542f7b5e416a	cuffcompare.pl	/usr/local3/bin/cuffcompare-1.00/	executable	Cuffcompare	1.00	Cuffcompare <http://cufflinks.cbcb.umd.edu/manual.html#cuffcompare>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
299	c5eea5de6c18447ddb87a833eb66166da	cuffdiff.pl	/usr/local3/bin/cuffdiff-1.00/	executable	CuffDiff	1.00	CuffDiff <http://cufflinks.cbcb.umd.edu/manual.html#cuffcompare>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
9	c4b3ebdf32237419b820bfdddbd781412e	samtools	/usr/local2/bin	executable	 	 	 
290	c0d7c27ee23784641a568dc9cbdc4e11d	foundational_api_adapter.pl	/usr/bin	fAPI	generic script for submitting jobs to the Foundational API	0.0.1	
188	c1d89270ff2374de3b1e9f249c86faa8c	consensus_to_seq	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
291	c79039863d5a64cd985d2493b3ff62347	app_wc-0.10	/usr/local2/bin	fAPI	count items in a file	0.10	
1	c12bd559051333352e31302e3231d750adbbbb3b582a	Rscript	/usr/bin	executable	R Statistical Package		R project
2	c000cbd03bb54493fa75e4fdc23d7c7ad	fastx_clipper	/usr/local2/bin	executable	FastX clipper	 	Hannon Lab
3	cd49d4e63362c4312ae235b94a4bc46a4	fastx_trimmer	/usr/local2/bin	executable	Fastx Trimmer	 	Hannon Lab
4	c25d1206fbd2543fd90f8ce76d363087b	perl	/usr/bin	executable	Perl interpreter	 	gnu
5	c35c0e84eda2646aaa6c5cc8cb690da70	fastq_quality_filter	/usr/local2/bin	executable	 		
70	c99ffaf7a86674e86b0327f0606dc3855	tailWrapper.pl	/usr/local3/bin/tail-1.00/	executable	Tail	1.00	Wrapper for GNU tail. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
71	c4e6f548cc0ee431da7f2ddfdf3ace761	uniq	/usr/bin/	executable	Scan for unique values	1.00	Original code © 2009 - by A. Gordon ( gordon at cshl dot edu ). iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
127	c226b4e9660b340d1aface5a571155948	fastq_quality_boxplot_graph.sh	/usr/local2/bin	executable	\N	\N	\N
135	cfbf20b6ab14d47bb888735770c2a4553	dnaml	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
6	c7a8f169cca4b4ee5ad93b6a46de498c3	bowtie	/usr/local2/bin	executable	Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small: typically about 2.2 GB for the human genome (2.9 GB for paired-end).	0.12.7	Langmead B, Trapnell C, Pop M, Salzberg SL. Ultrafast and memory-efficient alignment of short DNA sequences to the human genome. Genome Biol 10:R25
10	c4b3ebdd32237419b820bf3ddbd7d141d	bwa	/usr/local2/bin/	executable			
11	c4b3ebdd32137419b820ba3ddbd7d141e	bash	/bin	executable	 	 	 
13	c8d39411067a74090ac1ab0264f3d745b	fastq-dump	/usr/local3/bin/sratoolkit.2.0.1-centos_linux64	executable	Convert SRA format data into FASTQ	2.01	NCBI SRA Toolkit 2.01 <http://www.ncbi.nlm.nih.gov/books/NBK47540/>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
14	c4f98cb7cdbdc482c8e8d0c921c36a061	run-genemania-query.pl	/usr/local3/bin/genemania-query-runner-1.00/	executable	GeneMania Query Runner	1.00	GeneMania Query Runner <http://www.genemania.org/plugin/tools.html>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
15	cb8d55bbfe0cf4b2399d6c4d563f67e16	aspera_shell.pl	/usr/local3/bin/aspera-1.00/	executable	NCBI SRA Import via ASCP	1.00	iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
16	ce838ca518df645b984f549f0473712ed	ranger	/usr/local3/bin/ranger-1.02/	executable	PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com).	1.02	\N
233	c7123617c86734ac184a5eb732f125024	iPlantCanberraAlternate.py	/usr/local2/iPlantCanberra	executable	\N	\N	\N
234	c09a77414269342e18d9d9a191eb63d6c	bam2fastx	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
235	c52fd2d816ce94c53bfcd96726a259704	bed_to_juncs	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
236	cf8189dfd0a9745b0b08dda224f67b019	closure_juncs	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
237	cc294d6f984364b04975c016a592a0dbb	contig_to_chr_coords	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
238	cd56d5774c4674b2ca5766ec7f0d727bb	extract_reads	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
239	c6ae7503f9f264a449d71a61a10ddaef9	fix_map_ordering	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
240	c375525017bfa45528532c7909f21bc60	gtf_juncs	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
241	c33ff49dd6aa5421c8f39009aecbe4116	juncs_db	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
242	c38a3fd09f75145daa48df7182a963b87	library_stats	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
243	ca015ff2ac78a4f9db90c31fbe024020c	long_spanning_reads	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
244	cebac986373774294878eb1ca48b8de3b	mask_sam	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
245	c111a772a202d47b78276edbdce927c8f	prep_reads	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
246	c4dca43f284c441b2afbce81e808604b5	sam_juncs	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
247	ce72b6370b55b46dd82f8dc4d63bb31b2	segment_juncs	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
248	c86aa43a3806a43dc8d4e9aacc6b39db9	sra_to_solid	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
12	c7a8f169cca4b4ee52237416c5cc8cbaa	tophat	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
249	c99ce8baa78ac4f89a2220ff48f7038fd	tophat_reports	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
250	cee425c06d14a4a8fa77d476042ebe14a	wiggles	/usr/local2/tophat-1.3.0.Linux_x86_64	executable	\N	\N	\N
184	c2bfb48795daa4c418c4de99646128949	vcf_to_gff.pl	/usr/local2/bin	executable	\N	\N	\N
58	c699464200dfc4e2eb17b5e5e63b405e6	awk_wrapper.sh	/usr/local3/bin/awk_tool-1.00/	executable	Awk	1.00	Wrapper for GNU awk based on the Galaxy tool. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
59	c72c314d1eace461290b9b568d9feb86a	cat	/usr/bin/	executable	Concatenate	1.00	Wrapper for GNU cat. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
60	cd29032a8b6a64eceae4f5e668287cf81	changeCase.pl	/usr/local3/bin/change_case-1.00/	executable	Change case of columns.	1.00	Port of Galaxy Change Case Tool: iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
61	cf3fcec559489442a9fce1dcc38e376f5	cutWrapper.pl	/usr/local3/bin/cut_columns-1.00/	executable			
62	cf0585981f149442f9c8d2e51b27e3ccb	fasta_compute_length.py	/usr/local3/bin/fasta_compute_length-1.00/	executable	FASTA Compute Sequence Lengths	1.00	Ported from Galaxy fasta_tools. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
63	c9701388b06e14b4e9256a19b2695ad8a	fasta_filter_by_length.py	/usr/local3/bin/fasta_filter_by_length-1.00/	executable	FASTA Filter By Length	1.00	Ported from Galaxy fasta_tools. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
64	cd0612b2fafd94c49ab15babbfeeaec1c	fasta_to_tabular.py	/usr/local3/bin/fasta_to_tabular-1.00/	executable	FASTA to Tabular Data	1.00	Ported from Galaxy fasta_tools. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
65	c657e23b50ac54173b2e10ef4a5cfb112	find_and_replace.pl	/usr/local3/bin/find_and_replace-1.00/	executable	Find and Replace	1.00	Original code © 2009 - by A. Gordon ( gordon at cshl dot edu ). iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
7	c0ad5fa97187948f79b1b82cb2abcf623	cufflinks	/usr/local2/bin	executable	\N	\N	\N
66	c58d961d2d2434e2c824401e121c6f90c	grep_wrapper.sh	/usr/local3/bin/grep_tool-1.00/	executable	Grep	1.00	Wrapper for GNU grep. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
67	c5d00a4904570495b85729ddef7ad4a68	headWrapper.pl	/usr/local3/bin/head-1.00/	executable	Head	1.00	Wrapper for GNU head. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
68	cb2c72b7b200e4946ae7d6377861cc556	remove_ending.sh	/usr/local3/bin/remove_ending-1.00/	executable	Remove ending from file	1.00	Original code © 2009 - by A. Gordon ( gordon at cshl dot edu ). iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
69	c5747434170c04ef6b3a41d2026dd21d3	tabular_to_fasta.py	/usr/local3/bin/tabular_to_fasta-1.00/	executable	Tabular Data to FASTA	1.00	Ported from Galaxy fasta_tools. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
185	cb994e57e55444d9c8b40cee5bed46d17	choose_seqs_via_psiblastseedmedian	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
186	c607f60a569be4fda9841f184dd6e4853	Classify_SNPs_Indels.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
187	c8e979c30cfee4ca6a201562aa26086a7	clump_output_alignedseq	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
189	c0104f450f79d4eada6bb8e815168de1e	detect_indel.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
190	cc3912f4b5b824409a450c1a390d26a69	bin/detect_repeat.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
191	cf24a0b8b1958474695538314ae61d291	DNA_PROT_SUBROUTINES.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
192	c19e119cea8f849f986bc5b59d14a639a	fastaseqs	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
193	c6ea7f83db1b64ae6aca55548e9244c41	get_sequences.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
194	c8173c5dac5804587a4fa05b845f973ef	indelfile_to_gff.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
195	c380678b6332f46e3aedf0bc39653511b	info_on_seqs	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
196	ccbc100a07b70402396563fd4eeb05e51	IntersectLocations.sh	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
197	c2b28a26fec014706a9f6f839860020ae	map_coords_to_bin_indels.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
198	c6dc910de267d4152b9ac8816c6149e76	map_coords_to_bin.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
199	c894ac3a1532a4a6bb1f2332c29715f79	model_transcript.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
200	c69896ea740fe4a98a7267509a1d0d1d0	psiblast_res_to_fasta_dbpairwise	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
201	c7cb995057da84b45ae737e4ff3e67967	reformat_chrfile.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
202	c448cbf63dca440cb9afe922019fdd318	seqs_chosen_via_median_info.csh	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
203	c7d986c482d704e909e5a0cdd51eda69b	seqs_from_psiblast_res	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
204	c1457f94ea9844b5e99e6083d44c5ef73	SIFT_exome_indels.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
205	c3e534d6566d2461d994b83bbde35adb7	SIFT_exome_nssnvs.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
206	c2d018195fde844a79f76ca99504dd646	sift_feed_to_chr_coords_batch.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
207	cbe3e221400284a1589c6a967ce20098e	SIFT_for_submitting_fasta_seq.csh	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
208	cc67114f9e20e4daf92f5389e6e63e4eb	SIFT_for_submitting_NCBI_gi_id.csh	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
209	c3914b55a92054aabb65593cd0149c51c	SIFT_intersect_cds.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
210	c907765b7a8ba4209a2362259741fda40	SIFT_subroutines.pm	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
211	cf9e23f4dc07d4175a539736e99f9ca86	snv_db_engine.pl	/usr/local2/sift4.0.3/bin	executable	\N	\N	\N
212	c8461dbecba4044dc9b9f8b2e2fbe50af	Bmapqtl	/usr/local2/QTLC	executable	\N	\N	\N
213	c26324dfbc2a14855ad36ac132d32ce69	BTmapqtl	/usr/local2/QTLC	executable	\N	\N	\N
214	c8f2b6fa838a5488c86447aa2600bccc6	Emap	/usr/local2/QTLC	executable	\N	\N	\N
215	caad0982088a54ca289cb4d68aee0e31f	Eqtl	/usr/local2/QTLC	executable	\N	\N	\N
216	c2cf5cb4fee404f8d9feb298a3e364331	JZmapqtl	/usr/local2/QTLC	executable	\N	\N	\N
217	cce6c1e61dfbb41c6a2871387b77a9cb1	LocalVert.pl	/usr/local2/QTLC	executable	\N	\N	\N
218	c1e918c9ee57e4697b6bd923d85731561	LRmapqtl	/usr/local2/QTLC	executable	\N	\N	\N
219	c8899e21f586a4a9a8709b8735ac6d363	MemMatch.pl	/usr/local2/QTLC	executable	\N	\N	\N
220	c9c510f8df88648c08e0975f6b7459e9c	MImapqtl	/usr/local2/QTLC	executable	\N	\N	\N
221	cc5ee65a9f66242de89912792a876d264	MultiRegress	/usr/local2/QTLC	executable	\N	\N	\N
222	cf3bc2153803044c68306dd74f9e59be7	Preplot	/usr/local2/QTLC	executable	\N	\N	\N
223	c98a53487a5c14f00858c8125b4f896a2	Prune	/usr/local2/QTLC	executable	\N	\N	\N
224	ca130f21db28249e58ea19a6bb45ffdde	Qstats	/usr/local2/QTLC	executable	\N	\N	\N
225	c3965bc6723e142a19935c94ce1ff03c9	Rcross	/usr/local2/QTLC	executable	\N	\N	\N
226	c0f0f8f27fcd34fd9911dd09e32478a7b	Rmap	/usr/local2/QTLC	executable	\N	\N	\N
227	c960921911bcd496fbe18622c7f882f85	Rqtl	/usr/local2/QTLC	executable	\N	\N	\N
228	cddc9db8f68084974b386562f30aa9c30	SRmapqtl	/usr/local2/QTLC	executable	\N	\N	\N
229	c0475ad6aa7cc4005ace2a3e4ae39a31e	Zmapqtl	/usr/local2/QTLC	executable	\N	\N	\N
251	c156679abb02947378b9b2c215103a96e	cuffcompare	/usr/local2/cufflinks-1.0.3.Linux_x86_64	executable	\N	\N	\N
231	c0e25fea105d842c8bec17f24637f15d8	Ontologizer.sh	/usr/local2/Ontologizer	executable	\N	\N	\N
118	c73ef66158ef94f1bb90689ff813629f5	muscle	/usr/local2/muscle3.8.31	executable	\N	\N	\N
120	c972a44a0f7ce497c94b63c92a15d685e	iPlantBorda.py	/usr/local2/iPlantBorda	executable	\N	\N	\N
121	cf230c583d71d4a38b1a913dc72bfe5a5	iPlantCanberra.py	/usr/local2/iPlantCanberra	executable	\N	\N	\N
122	c7783308e9ac849b4a3e83ccfb216378f	hiload	/usr/local2/MECPM	executable	\N	\N	\N
123	cd73ea8f3d4a84b149204dcac292e71f1	mecpm_ce	/usr/local2/MECPM	executable	\N	\N	\N
124	ccd5ee28621414dcb915d1c1fa6916a87	mecpm_co	/usr/local2/MECPM	executable	\N	\N	\N
126	cf7445ca29d734e32a05eacd5ba6b4b8c	fastx_quality_stats	/usr/local2/bin	executable	\N	\N	\N
128	c886d74d9b353404f9e254b7bfbc5ceaa	fastx_nucleotide_distribution_graph.sh	/usr/local2/bin	executable	\N	\N	\N
129	c6a2a6ea1be504a36bbb3748e1d406b97	contrast	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
130	c72d4c930ed2d42f4a78d2c34ddbc11bd	neighbor	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
131	c6df41ad321a64622b4e9fa80392f3d6c	dnadist	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
132	c7e0ab0b6c07e4d70803e9b46238ef644	protdist	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
133	c5fcd60da705e47c3905ab7db378e5f6a	seqboot	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
134	cdfce2b79d9da478dbacd4a66096c645c	consense	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
136	c969e71cb985443aa9ec13ccaf6b13c6b	pars	/usr/local2/phylip-3.69/exe	executable	\N	\N	\N
252	c8c4d9001cf2444f0bce7497109b65710	vbay	/usr/local2/VBay	executable	\N	\N	\N
253	cf6f49f99ed0048f48f02f8b0372a314a	cuffdiff	/usr/local2/cufflinks-1.0.3.Linux_x86_64	executable	\N	\N	\N
254	c0acf58b524404903b174e254eca6cf27	gffread	/usr/local2/cufflinks-1.0.3.Linux_x86_64	executable	\N	\N	\N
255	ca8e2ec281d584b34b2ec53c3eacf0a18	gtf_to_sam	/usr/local2/cufflinks-1.0.3.Linux_x86_64	executable	\N	\N	\N
256	cc318dd7ef7e84b41b14212a27b572c4a	cuffmerge	/usr/local2/cufflinks-1.0.3.Linux_x86_64	executable	\N	\N	\N
119	c2d79e93d83044a659b907764275248ef	phyml	/usr/local2/phyml-20110304	executable	\N	\N	\N
257	c34a9cffb616d4088941cc68853ef230a	raxmlHPC-SSE3	/usr/local2/RAxML-7.2.8-ALPHA	executable	\N	\N	\N
258	c75b1634302014a2b9b104875525b9bbf	dnaml.pl	/usr/local2/sheldon	executable	\N	\N	\N
259	cd1e24d5a81964d16acf39bc615a2323d	progressiveMauve_2.3.1	/usr/local2/progressiveMauve	executable	\N	\N	\N
260	cd450141756bf4f188c45e98bcda54ac5	run_seedSize_headless.sh	/usr/local2/nmiller	executable	\N	\N	\N
261	cd17a993ebec14679a5484892b55421a8	iseedSize_headless	/usr/local2/nmiller	executable	\N	\N	\N
183	c0140ec3e7ece46c5a2555497790cf663	run_bwa.sh	/usr/local2/core-software/	executable	BWA Aligner	1.01	iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
264	c01101d34b35f4b14ad23757c3118d55d	run_tophat.pl	/usr/local3/bin/	executable	TopHat Alignment Tool	1.01	iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
265	ce999c4026f0d44a7a155b7e02bb2c9a7	join_wrapper.sh	/usr/local3/bin/join_tool-1.00/	executable	Join	1.00	Wrapper for GNU join, based on wrapper from Galaxy. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
266	caa493da65197451ebbeea2497d353868	wc_wrapper.sh	/usr/local3/bin/wc_tool-1.00	executable	Word Count	1.00	Wrapper for GNU wc. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
56	c31104ecabf734d6cbdd18f37351c8370	fastqc_wrapper.sh	/usr/local3/bin/fastqc-1.00/	executable	FastQC	0.9.2	FastQC <http://www.bioinformatics.bbsrc.ac.uk/projects/fastqc/> was written by Simon Andrews of the Babraham Institute (simon.andrews@bbsrc.ac.uk). Reports are collated into PDF and PNG files using wkhtmltopdf <http://code.google.com/p/wkhtmltopdf/>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
267	cbe3e4fd020a04a15a7233b8d4b800c98	samtools_sam_to_sorted_bam.sh	/usr/local3/bin/	executable	Create sorted, indexed BAM from SAM	1.00	SAMtools view, sort, index <http://samtools.sourceforge.net/>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
268	c0917869c601946ceb45319271cc7ffe2	dnanj.pl	/usr/local2/sheldon	executable	\N	\N	\N
269	c398c185fa49c4110a935add7ac1b1c21	dnapars.pl	/usr/local2/sheldon	executable	\N	\N	\N
270	c83b53a474f07457b9fa4f8134924afad	fasttree.pl	/usr/local2/sheldon	executable	\N	\N	\N
271	cc5ece07eef66444bb26cca6632f20cf6	proml.pl	/usr/local2/sheldon	executable	\N	\N	\N
272	c39e5aca7c5874a0a861d8795aeccd0eb	protnj.pl	/usr/local2/sheldon	executable	\N	\N	\N
273	c684805629750462fab1d40abe1ad3c21	protpars.pl	/usr/local2/sheldon	executable	\N	\N	\N
263	c170e6959760a40c7bc72d74d0e9ad05a	run_bwa.pl	/usr/local3/bin/	executable	BWA Aligner for Single-End Illumina Reads	1.01	iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
274	c7a1566211b8c4bfdb1fb861c4a7691ae	run_soap2.pl	/usr/local3/bin/	executable	SOAP2 Aligner for Paired-End Illumina Reads	1.00	SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
275	c67a0e12f8b3b48a49bdd1ffb905ddef6	muscle-qa	/usr/local2/bin/	executable			
276	c1cbeda6245de460c8bd49a639b9666a6	muscle-blah	/usr/local2/bin/	executable			
277	ca81686005b614e45beed6ed74d680117	clustalw.pl	/usr/local2/sheldon	executable	\N	\N	\N
278	c0da16dd996b14323b315b118ad3d1c74	contrast.pl	/usr/local2/sheldon	executable	\N	\N	\N
279	c630cf0551d6242bfbe52fba34924c02f	pars.pl	/usr/local2/sheldon	executable	\N	\N	\N
281	cef2c93c0b1ab4777aa8a6693ffa7f6be	ontologizer.sh	/usr/local3/bin/ontologizer-1.00	executable	ontologizer		M. Vaughn
282	c238dfeaccde44771a3f1db6595553604	BBC	/usr/local2/BBC_Bicluster	executable	BBC Bicluster		M. Vaughn
283	c2e3f248ba7164db8aac9882ff9de7c2b	RNAseq_Wrapper.sh	/usr/local3/bin/BTI_iPlant_RNAseq/scripts	executable	Brutnell RNAseq Pipeline		M. Vaughn
292	cb9beb6738db94de0b9e732d667c10920	structure	/usr/local2/structure_linux_console2.3.3/console	executable	\N	\N	\N
293	cc1bd9f968f654cc2a81c16c7c203b04d	spagedi	/usr/local2/SPAGeDi-1.3a-Linux-i686/bin	executable	\N	\N	\N
294	c471a5b009a1b47ab9d8b73a193b2ea69	fasta_filter_length.pl	/usr/local3/bin/fasta_filter_by_length-1.00/	executable	FASTA Filter By Length	1.00	iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
295	cedbad85b02af4c0c923cb30fa45d8296	bundle.sh	/usr/local3/bin/bundle_sequences_abyss-1.00	executable	ABySS-Bundle Sequences	1.00	Bundle related sequences into a library for Abyss assembler. Developed by Matt Vaughn (vaughn at iplantcollaborative dot org).
\.


--
-- Data for Name: importedworkflow; Type: TABLE DATA; Schema: public; Owner: -
--

COPY importedworkflow (hid, importjson, analysisuuid, datecreated) FROM stdin;
1	{ "components": [{"location": "/usr/local2/sheldon", "name": "dnaml.pl", "type": "executable"}]}		2011-06-08 15:43:08
2	{ "components": [{"location": "/usr/local2/progressiveMauve", "name": "progressiveMauve_2.3.1", "type": "executable"}]}		2011-06-08 16:51:20
3	{ "components": [{"location": "/usr/local2/nmiller", "name": "run_seedSize_headless.sh", "type": "executable"}, {"location": "/usr/local2/nmiller", "name": "iseedSize_headless", "type": "executable"}]}		2011-06-16 09:36:21
4	{"components":[    {"name":"run_bwa.sh",     "location":"/usr/local2/core-software/",     "type":"executable",     "description":"BWA Aligner",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.sh",     "name":"BWA Aligner",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome:",      "type":"ReferenceSequence",      "order" : 1,      "multiplicity" : "single"},\t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description":"",      "type":"File",      "order" : 2,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Aligner",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner",         "config":            {}}]}]}	a749c822498a14da9aa871b99a941e58b|	2011-06-27 10:37:21
5	{"components":[    {"name":"run_bwa.sh",     "location":"/usr/local2/core-software/",     "type":"executable",     "description":"BWA Aligner",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.sh",     "name":"BWA Aligner",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome:",      "type":"ReferenceGenome",      "order" : 1,      "multiplicity" : "single"},\t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description":"",      "type":"File",      "order" : 2,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Aligner",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner",         "config":            {}}]}]}	a749c822498a14da9aa871b99a941e58b|	2011-06-27 11:04:51
6	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome:",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"},\t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description":"--query1 ",      "type":"File",      "order" : 2,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 12:31:47
7	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome:",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"},\t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query1 ",      "type":"File",      "order" : 2,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 12:34:32
8	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome:",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"},\t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query1 ",      "type":"File",      "order" : 2,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 12:38:50
49	{"components":[    {"name":"samtools_sam_to_sorted_bam.sh",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"Create sorted, indexed BAM from SAM",     "version":"1.00",     "attribution":"SAMtools view, sort, index <http://samtools.sourceforge.net/>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"samtools_sam_to_sorted_bam.sh",     "name":"BAM from SAM",     "type":"",     "description":"Create sorted, indexed BAM from SAM using SAMtools",     "input":[        {"id":"inputSAM",         "name":"Select a SAM File",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[],         "output":[]}], "analyses":[    {"analysis_name":"Create BAM from SAM file",     "description":"Create sorted, indexed BAM from SAM using SAMtools.",     "type":"Utility Tools",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BAM from SAM",         "config":            {}}]}]}	a7909c999d97347dca20d6aba44fe5294|	2011-06-29 14:22:58
9	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome from the list...",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"},    {"id":"BWAReferenceGenome",      "name":"..or choose a FASTA containing your custom genome build.",      "type":"File",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"}, \t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query1 ",      "type":"File",      "order" : 2,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 12:54:36
10	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome from the list...",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"},    {"id":"BWAReferenceGenomeUser",      "name":"..or choose a FASTA containing your custom genome build.",      "type":"File",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"}, \t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query1 ",      "type":"File",      "order" : 2,      "multiplicity" : "single"},    {"id":"BWAInputFilePair",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query2 ",      "type":"File",      "order" : 3,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 13:00:13
11	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome from the list...",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"},    {"id":"BWAReferenceGenomeUser",      "name":"..or choose a FASTA containing your custom genome build.",      "type":"File",      "switch":"--database ",      "order" : 1,      "multiplicity" : "single"}, \t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query1 ",      "type":"File",      "order" : 2,      "required": true,      "multiplicity" : "single"},    {"id":"BWAInputFilePair",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query2 ",      "type":"File",      "order" : 3,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 13:10:16
12	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[     {"id":"BWAReferenceGenome",      "name":"Select a reference genome from the list...",      "type":"ReferenceSequence",      "switch":"--database ",      "order" : 1,      "required": false,      "multiplicity" : "single"},    {"id":"BWAReferenceGenomeUser",      "name":"..or choose a FASTA containing your custom genome build.",      "type":"File",      "switch":"--database ",      "order" : 1,      "required": false,      "multiplicity" : "single"}, \t {"id":"BWAInputFile",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query1 ",      "type":"File",      "order" : 2,      "required": true,      "multiplicity" : "single"},    {"id":"BWAInputFilePair",      "name":"Select FASTQ sequence to align",      "description": "",      "switch":"--query2 ",      "type":"File",      "order" : 3,      "required": false,      "multiplicity" : "single"}      ],     "groups":[],     "output":[]      }    ], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 13:10:55
13	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"BWAInputFilePair",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":3,         "required":false,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"1D63CDFF-B731-156F-CF84-24C115CDA270",             "name":"-l ",             "label":"Number of first subsequences to take as seed",             "desc":"Enter -1 for infinity",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"22ED9925-8AC9-C933-0921-D4B7CCDC6BCB",             "name":"-N ",             "label":"Disable iterative search",             "desc":"All hits with no more than maxDiff differences will be found. This mode is much slower than the default.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 13:44:06
14	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"BWAInputFilePair",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":3,         "required":false,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"1D63CDFF-B731-156F-CF84-24C115CDA270",             "name":"-l ",             "label":"Number of first subsequences to take as seed",             "desc":"Enter -1 for infinity",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 13:51:46
15	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"BWAInputFilePair",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":3,         "required":false,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-27 14:20:11
16	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                             {                                                      "id": "E9DF0C56-7E7C-6F31-1A59-A0C69981FC89",                                                      "name": "--library-type",                                                      "label": "Library Type",                                                      "desc": "",                                                      "type": "Selection",                                                      "isVisible": true,                                                      "value": "fr-unstranded",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "MustContain": [                                                                                          "fr-unstranded",                                                                                          "fr-firststrand",                                                                                          "fr-secondstrand"                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-27 15:31:39
17	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                             {                                                      "id": "E9DF0C56-7E7C-6F31-1A59-A0C69981FC89",                                                      "name": "--library-type ",                                                      "label": "Library Type",                                                      "desc": "",                                                      "type": "Selection",                                                      "isVisible": true,                                                      "value": "fr-unstranded",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "MustContain": [                                                                                          "fr-unstranded",                                                                                          "fr-firststrand",                                                                                          "fr-secondstrand"                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-27 15:38:24
18	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                             {                                                      "id": "E9DF0C56-7E7C-6F31-1A59-A0C69981FC89",                                                      "name": "--library-type ",                                                      "label": "Library Type",                                                      "desc": "",                                                      "type": "Selection",                                                      "isVisible": true,                                                      "value": "fr-unstranded",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": true,                                                               "rules": [                                                                        {                                                                                 "MustContain": [                                                                                          "fr-unstranded",                                                                                          "fr-firststrand",                                                                                          "fr-secondstrand"                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-27 15:47:40
19	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                             {                                                      "id": "E9DF0C56-7E7C-6F31-1A59-A0C69981FC89",                                                      "name": "--library-type ",                                                      "label": "Library Type",                                                      "desc": "",                                                      "type": "Selection",                                                      "isVisible": true,                                                      "value": "fr-unstranded",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": true,                                                               "rules": [                                                                        {                                                                                 "MustContain": [                                                                                          "fr-unstranded",                                                                                          "fr-firststrand",                                                                                          "fr-secondstrand"                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-27 15:48:33
81	{ "components": [{"location": "/usr/local2/sheldon", "name": "clustalw.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "contrast.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "pars.pl", "type": "executable"}]}		2011-07-07 15:44:48
82	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Aligner for Single-End Illumina Reads",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":2,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Single-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	ab60ca93cec4f453287e86529c9f8adcd|	2011-07-07 16:21:48
20	{"components":[    {"name":"aspera_shell.pl",     "location":"/usr/local3/bin/aspera-1.00/",     "type":"executable",     "description":"NCBI SRA Import via ASCP",     "version":"1.00",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"aspera_shell.pl",     "name":"Import from NCBI SRA",     "type":"",     "description":"Use Aspera ascp to fetch sequence archive from NCBI SRA.",     "groups":[        {"id":"",         "name":"group1",         "label":"Import sequence archive",         "type":"step",         "properties":[            {"id":"sraFTPURL",             "name":"",             "label":"Enter full SRA FTP URL",             "description": "",             "type":"Text",             "value":"ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/litesra/SRX/SRX000/SRX000348",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":0},             {"id":"DirectoryName",             "name":"",             "label":"Directory Name",             "description": "",             "type":"Text",             "value":"SRA-Import",             "visible":false,             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1}             ]             }             ]        }    ], "analyses":[    {"analysis_name":"NCBI SRA Import",     "description":"Use Aspera ascp to fetch sequence archive from NCBI SRA.",     "type":"Data Sources",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Import from NCBI SRA",         "config":            {}}]}]}	acba707c42ff54809896a3fafb827fe2b|	2011-06-28 10:20:35
21	{"components":[    {"name":"awk_wrapper.sh",     "location":"/usr/local3/bin/awk_tool-1.00/",     "type":"executable",     "description":"Awk",     "version":"1.00",     "attribution":"Wrapper for GNU awk based on the Galaxy tool. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"awk_wrapper.sh",     "name":"Awk",     "type":"",     "description":"Run the UNIX awk command on the selected file.",     "input":[        {"id":"AwkInput",         "name":"Input File",         "description":"Select an input file.",         "switch":"",         "order":1,         "multiplicity":"single",         "type":"File"}],     "groups":[     {"id":"",         "name":"group1",         "label":"Parameters",         "type":"step",         "properties":[            {"id":"AwkProgram",             "name":"",             "label":"Enter an Awk Program",             "description": "",             "type":"QuotedText",             "value":"",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":3},           {"id":"InputSeparator",             "name":"",             "label":"Input Field Delimiter",             "description": "",             "type":"ValueSelection",             "value":"tab",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["tab",",",".",":","|","-","_"]}]},             "order":4},           {"id":"OutputSeparator",             "name":"",             "label":"Input Field Delimiter",             "description": "",             "type":"ValueSelection",             "value":"tab",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["tab",",",".",":","|","-","_"]}]},             "order":5}               ]}     ],     "output":[        {"id":"AwkOutput",         "name":"awk_out.txt",         "switch":"",         "order":2,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"GNU awk",     "description":"Run the UNIX awk command on the selected file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Awk",         "config":            {}}]}]}	a14ca47a19372410992a83784e462dfe4|	2011-06-28 10:20:55
22	{"components":[    {"name":"cat",     "location":"/usr/bin/",     "type":"executable",     "description":"Concatenate",     "version":"1.00",     "attribution":"Wrapper for GNU cat. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"cat",     "name":"Concatenate",     "type":"",     "description":"Concatenate files head-to-tail.",     "input":[        {"id":"CatInput",         "name":"Input Files",         "description":"Select files in the order you wish them to be joined, head-to-tail.",         "switch":" ",         "order":0,         "multiplicity":"multiple",         "type":"File"}],     "groups":[],     "output":[        {"id":"CatOutput",         "name":"concatenate_out.txt",         "switch":" > ",         "order":1,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Concatenate Files",     "description":"Concatenate files head-to-tail.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Concatenate",         "config":            {}}]}]}	a95e4e92fdc8c4d0cb75881735c28299f|	2011-06-28 10:21:15
23	{"components":[    {"name":"changeCase.pl",     "location":"/usr/local3/bin/change_case-1.00/",     "type":"executable",     "description":"Change case of columns.",     "version":"1.00",     "attribution":"Port of Galaxy Change Case Tool: iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"changeCase.pl",     "name":"Change Case",     "type":"",     "description":"Change the case of specific columns in a delimited-text file.",     "input":[        {"id":"ChangeCaseInput",         "name":"Input File",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"Cols",             "name":"",             "label":"Specify columns to change:",             "description":"",             "type":"QuotedText",             "value":"c1,c2",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1},            {"id":"Casing",             "name":"",             "label":"Change case to:",             "description":"",             "type":"ValueSelection",             "value":"Uppercase",             "order":3,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["Uppercase","Lowercase"]}]}},            {"id":"Delimiter",             "name":" ",             "label":"Input file is delimited by:",             "type":"ValueSelection",             "value":"TAB",             "order":2,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["TAB","SPACE","COMMA","DOT","PIPE","DASH","UNDERSCORE"]}]}}]}],     "output":[        {"id":"ChangeCaseOutput",         "name":"change_case_out.txt",         "switch":"",         "order":3,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Change Case",     "description":"Change the case of specific columns in a delimited-text file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Change Case",         "config":            {}}]}]}            	aa33390c746b04ed6896936e990fbbb9d|	2011-06-28 10:21:44
24	{"components":[    {"name":"cutWrapper.pl",     "location":"/usr/local3/bin/cut_columns-1.00/",     "type":"executable",     "description":"",     "version":"",     "attribution":""}], "templates":[    {"component_ref":"cutWrapper.pl",     "name":"CutColumns",     "type":"",     "description":"Cut columns from a plain text data table",     "input":[        {"id":"CutInput",         "name":"Input File",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"Columns",             "name":"",             "label":"Enter Comma-separated List Columns to Extract ie. c1,c2,c3",             "description": "Columns are specified as c1, c2, and so on. Column count begins with 1. Columns can be specified in any order (e.g., c2,c1,c6). If you specify more columns than are actually present, empty spaces will be filled with dots.",             "type":"Text",             "value":"",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1},            {"id":"Delimiter",             "name":" ",             "label":"Column Delimiter",             "type":"ValueSelection",             "value":"Tab",             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["Tab","Comma","Dash","Underscore","Pipe","Dot","Whitespace"]}]},             "order":2}],         "output":[            {"id":"CutOutput",             "name":"cutWrapper_output.txt",             "switch":"",             "order":3,             "multiplicity":"single",             "type":"File"}]}]}], "analyses":[    {"analysis_name":"Cut Columns",     "description":"Extract data columns from a plain-text, delimited data table",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"CutColumns",         "config":            {}}]}]}	a6d3c47fef68b4f80b215ca0105d7a76c|	2011-06-28 10:22:19
25	{"components":[    {"name":"fastq-dump",     "location":"/usr/local3/bin/sratoolkit.2.0.1-centos_linux64",     "type":"executable",     "description":"Convert SRA format data into FASTQ",     "version":"2.01",     "attribution":"NCBI SRA Toolkit 2.01 <http://www.ncbi.nlm.nih.gov/books/NBK47540/>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"fastq-dump",     "name":"SRA to FASTQ",     "type":"",     "description":"Convert SRA format to FASTQ.",     "input":[        {"id":"SRAFile",         "name":"Choose an SRA file:",         "switch":"",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Parameters",         "type":"step",         "properties":[            {"id":"AccessionName",             "name":" -A ",             "label":"SRA Accession Name",             "description":"",             "type":"QuotedText",             "value":"SRR000000",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1}]}]}], "analyses":[    {"analysis_name":"NCBI SRA Toolkit fastq-dump",     "description":"Convert SRA format to FASTQ using fastq-dump.",     "type":"Data Conversion",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SRA to FASTQ",         "config":            {}}]}]}	af3108d64f08648418f9ff677c1516852|	2011-06-28 10:22:52
83	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list:",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select Read 1 FASTQ file:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"BWAInputFilePair",         "name":"Select Read 2 FASTQ file:",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":3,         "required":false,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":2,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Paired-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	a8540c5e9df044e789650d1f9d4d7c15f|	2011-07-07 16:21:52
84	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Aligner for Single-End Illumina Reads",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Single-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	ab60ca93cec4f453287e86529c9f8adcd|	2011-07-08 09:44:47
27	{"components":[    {"name":"run-genemania-query.pl",     "location":"/usr/local3/bin/genemania-query-runner-1.00/",     "type":"executable",     "description":"GeneMania Query Runner",     "version":"1.00",     "attribution":"GeneMania Query Runner <http://www.genemania.org/plugin/tools.html>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run-genemania-query.pl",     "name":"GeneMania Query Runner",     "type":"",     "description":"Run a gene network prediction and write the results to a file.",     "input":[],     "groups":[        {"id":" ",         "name":"group1",         "label":"Specify Gene List",         "type":"step",         "properties":[            {"id":"GeneList",             "name":" --genelist ",             "label":"Enter a comma- or space-separated list of genes:",             "description": "",             "type":"QuotedText",             "value":"FWA, FLC, TFL1, FT, SOC1",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1}             ]        },        {"id":"",         "name":"group2",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"Species",         \t "order":2,         \t "label":"Select target species:",         \t "description": "",         \t "name": " --species ",         \t "value": "Arabidopsis thaliana",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["Arabidopsis thaliana"]}]},         \t "type": "ValueSelection"         \t},         \t{"id":"RelatedGeneLimit",         \t "order":2,         \t "label":"Related gene limit:",         \t "description": "",         \t "name": "--related_gene_limit ",         \t "value": 15,         \t "type": "Number"         \t },         \t{"id":"CombiningMethod",         \t "order":2,         \t "label":"Weighting Method:",         \t "description": "",         \t "name": "--combining_method ",         \t "value": "automatic",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["automatic","average", "average_category", "bp", "mf", "cc"]}]},         \t "type": "ValueSelection"         \t }         ]        },        {"id":" ",         "name":"group3",         "label":"Networks",         "type":"step",         "properties":[            {"id":"Coexp",             "name":" --coexp ",             "label":"Co-expression",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},\t\t\t{"id":"Coloc",             "name":" --coloc ",             "label":"Empirical colocation",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Gi",             "name":" --gi ",             "label":"Genetic interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},            {"id":"Path",             "name":" --path ",             "label":"Pathway interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Pi",             "name":" --pi ",             "label":"Physical interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":true},            {"id":"Predict",             "name":" --predict ",             "label":"Predicted interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Spd",             "name":" --spd ",             "label":"Shared protein domains",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Other",             "name":" --other ",             "label":"Other networks",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false} ]        }         \t        ],         "output":[            {"id":"GeneManiaOutput",             "name":"*results.report*",             "switch":" ",             "order":4,             "multiplicity":"many",             "type":"File"}]}], "analyses":[    {"analysis_name":"GeneMania Query Runner",     "description":"Run a gene network prediction and write the results to a file.",     "type":"Gene Annotation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"GeneMania Query Runner",         "config":            {}}]}]}	ac12eb6c54cd74ecaacaac8ee0174f44d|	2011-06-28 10:25:17
28	{"components":[    {"name":"grep_wrapper.sh",     "location":"/usr/local3/bin/grep_tool-1.00/",     "type":"executable",     "description":"Grep",     "version":"1.00",     "attribution":"Wrapper for GNU grep. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"grep_wrapper.sh",     "name":"Grep",     "type":"",     "description":"Find lines in a text file using a regular expression (regex).",     "input":[        {"id":"GrepInput",         "name":"Input File",         "switch":"",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Regular Expression",         "type":"step",         "properties":[            {"id":"FindPattern",             "name":"",             "label":"Find Pattern",             "description": "",             "type":"Text",             "value":"",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":2},            {"id":"Color",             "name":"",             "label":"",             "type":"Text",             "value":"NOCOLOR",             "visible":false,             "order":3}             ]        },        {"id":"",         "name":"group2",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"CaseInsensitive",         \t "order":4,         \t "label":"Case insenstive search",         \t "description": "Ignore case when searching.",         \t "name": "-i ",         \t "value": "false",         \t "type": "Flag"         \t },         \t{"id":"LinesAfter",         \t "order":5,         \t "label":"Lines after match",         \t "description": "Return N lines after match.",         \t "name": "-A ",         \t "value": 0,         \t "type": "Number"         \t },         \t{"id":"LinesBefore",         \t "order":5,         \t "label":"Lines before match",         \t "description": "Return N lines before match.",         \t "name": "-B ",         \t "value": 0,         \t "type": "Number"         \t },         \t{"id":"InvertMatch",         \t "order":4,         \t "label":"Invert match",         \t "description": "Return lines that DON'T match the pattern.",         \t "name": "-v ",         \t "value": "false",         \t "type": "Flag"         \t }         ]        }         \t        ],                 "output":[            {"id":"GrepOutput",             "name":"grep_tool_output.txt",             "switch":"",             "order":1,             "multiplicity":"single",             "type":"File"}]}], "analyses":[    {"analysis_name":"Find Lines Matching An Expression",     "description":"Use GNU 'grep' to find lines in a plain text document matching a regular expression.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Grep",         "config":            {}}]}]}	a3f98560d70404175b64b930ba6d2935a|	2011-06-28 10:25:37
29	{"components":[    {"name":"headWrapper.pl",     "location":"/usr/local3/bin/head-1.00/",     "type":"executable",     "description":"Head",     "version":"1.00",     "attribution":"Wrapper for GNU head. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}],      "templates":[     {"component_ref":"headWrapper.pl",     "name":"Head",     "type":"",     "description":"Select first N lines",     "input":[        {"id":"HeadInput",         "name":"Input File",         "switch":"",         "order":0,         "multiplicity":"single",         "type":"File"}],              "groups":[             {"id":"",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"LastLines",         \t "order":1,         \t "label":"Extract first N lines",         \t "description": "Extract first N lines from the input file.",         \t "name": "",         \t "value": "1",         \t "type": "Number",\t\t\t "validator":                {"name":"",                 "required":true,                 "rules":[                 \t{"IntAbove":[0]}                 ]}         \t }         ]        }        ],                 "output":[            {"id":"HeadOutput",             "name":"head_output.txt",             "switch":"",             "order":2,             "multiplicity":"single",             "type":"File"}]}],              "analyses":[    {"analysis_name":"Extract First Lines From a File",     "description":"Use GNU 'head' to extract the beginning a plain text file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Head",         "config":            {}}]}]}	aa54b4fd9b56545db978fff4398c5ce81|	2011-06-28 10:26:17
30	{"components":[    {"name":"join_wrapper.sh",     "location":"/usr/local3/bin/join_tool-1.00/",     "type":"executable",     "description":"Join",     "version":"1.00",     "attribution":"Wrapper for GNU join, based on wrapper from Galaxy. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"join_wrapper.sh",     "name":"Join",     "type":"",     "description":"Join two tabular data files using a key column.",     "input":[        {"id":"JoinInput1",         "name":"Input File 1",         "switch":"",         "order":6,         "multiplicity":"single",         "type":"File"},        {"id":"JoinInput2",         "name":"Input File 2",         "switch":"",         "order":8,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"File1Column",         \t "name":"",         \t "description":"",         \t "order":7,         \t "type":"Number",         \t "value":1,         \t "validator":{"name":"","required":true,"rules":[]}},\t\t\t{"id":"File2Column",         \t "name":"",         \t "order":1,         \t "description":"",         \t "type":"Number",         \t "value":9,         \t "validator":{"name":"","required":true,"rules":[]}},\t         \t             {"id":"JoinType",             "name":"",             "label":"Type of Join:",             "description": "",             "type":"ValueSelection",             "value":"",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["Both","First_Not_Second","Second_Not_First","Both_Plus_Unpaired_From_First","Both_Plus_Unpaired_From_Second","All"]}]},             "order":1},            {"id":"Delimiter",             "name":"",             "label":"Delimiter character:",             "description": "",             "type":"Text",             "value":"tab",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["tab",",",".",":","|","-","_"]}]},             "order":4},            {"id":"Case Insensitive",             "name":" -i ",             "label":"",             "type":"Flag",             "value":false,             "visible":true,             "order":5},\t\t\t{"id":"Empty String Filler",             "name":"",             "label":"",             "type":"Text",             "value":false,             "visible":false,             "order":3}, \t\t\t{"id":"Output Format",             "name":"",             "label":"",             "type":"Text",             "value":false,             "visible":false,             "order":2}             ]        }         \t        ],                 "output":[            {"id":"JoinOutput",             "name":"join_tool_output.txt",             "switch":"",             "order":10,             "multiplicity":"single",             "type":"File"}]}], "analyses":[    {"analysis_name":"Merge Two Files By Key Columns",     "description":"On simple tabular data, this can perform a SQL-like JOIN.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Join",         "config":            {}}]}]}	ac22d6523ef6446a39910016f90dfa5ea|	2011-06-28 10:28:13
31	{"components":[    {"name":"join_wrapper.sh",     "location":"/usr/local3/bin/join_tool-1.00/",     "type":"executable",     "description":"Join",     "version":"1.00",     "attribution":"Wrapper for GNU join, based on wrapper from Galaxy. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"join_wrapper.sh",     "name":"Join",     "type":"",     "description":"Join two tabular data files using a key column.",     "input":[        {"id":"JoinInput1",         "name":"Input File 1",         "switch":"",         "order":6,         "multiplicity":"single",         "type":"File"},        {"id":"JoinInput2",         "name":"Input File 2",         "switch":"",         "order":8,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"File1Column",         \t "name":"",         \t "description":"",         \t "order":7,         \t "type":"Number",         \t "value":1,         \t "validator":{"name":"","required":true,"rules":[]}},\t\t\t{"id":"File2Column",         \t "name":"",         \t "order":1,         \t "description":"",         \t "type":"Number",         \t "value":9,         \t "validator":{"name":"","required":true,"rules":[]}},\t         \t             {"id":"JoinType",             "name":"",             "label":"Type of Join:",             "description": "",             "type":"ValueSelection",             "value":"",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["Both","First_Not_Second","Second_Not_First","Both_Plus_Unpaired_From_First","Both_Plus_Unpaired_From_Second","All"]}]},             "order":1},            {"id":"Delimiter",             "name":"",             "label":"Delimiter character:",             "description": "",             "type":"Text",             "value":"tab",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["tab",",",".",":","|","-","_"]}]},             "order":4},            {"id":"Case Insensitive",             "name":" -i ",             "label":"",             "type":"Flag",             "value":false,             "visible":true,             "order":5},\t\t\t{"id":"Empty String Filler",             "name":"",             "label":"",             "type":"Text",             "value":false,             "visible":false,             "order":3}, \t\t\t{"id":"Output Format",             "name":"",             "label":"",             "type":"Text",             "value":false,             "visible":false,             "order":2}             ]        }         \t        ],                 "output":[            {"id":"JoinOutput",             "name":"join_tool_output.txt",             "switch":"",             "order":10,             "multiplicity":"single",             "type":"File"}]}], "analyses":[    {"analysis_name":"Merge Two Files By Key Columns",     "description":"On simple tabular data, this can perform a SQL-like JOIN.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Join",         "config":            {}}]}]}	ac22d6523ef6446a39910016f90dfa5ea|	2011-06-28 11:45:15
32	{"components":[    {"name":"ranger",     "location":"/usr/local3/bin/ranger-1.02/",     "type":"executable",     "version":"1.02",     "description":"PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com)."}], "templates":[    {"component_ref":"ranger",     "name":"ranger_template",     "type":"",     "description":"ChIP-Seq peak calling",     "input":[        {"id":"treatment",         "name":"Treatment aligned reads file",         "switch":" -d ",         "order":1,         "multiplicity":"single",         "type":"File"},        {"id":"control",         "name":"Control aligned reads file",         "switch":" -c ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"quality",         "label":"Options",         "type":"step",         "properties":[            {"id":"_pval",             "order":3,             "label":"p value cut-off",             "description":"P-value cutoff",             "name":"",             "switch":" -p ",             "value":"0.00001",             "type":"Number"},            {"id":"_delta",             "order":4,             "label":"delta",             "description":"Delta value",             "name":"",             "switch":" -r ",             "value":"0.8",             "type":"Number"},            {"id":"_bw",             "order":5,             "label":"Smoothing bandwidth",             "description":"Smoothing bandwidth",             "name":"",             "switch":" -b ",             "value":"99",             "type":"Number"},            {"id":"_pad",             "order":6,             "label":"Pad reads coverage profiles",             "description":"Pad reads coverage profiles",             "name":"",             "switch":" --pad ",             "value":false,             "type":"Flag"}]},        {"id":" ",         "name":"running_mode",         "label":"Running modes",         "type":"step",         "properties":[            {"id":"nThread",             "order":7,             "label":"Number of threads",             "description":"",             "name":"",             "switch":" -t ",             "visible":false,             "value":4,             "type":"Number"},            {"id":"runningMode",             "name":" --mode ",             "label":"Specify the running mode",             "type":"ValueSelection",             "value":"region",             "order":8,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["region","resolution"]}]}},            {"id":"format",             "name":" --format ",             "label":"Specify the format of the input files",             "type":"ValueSelection",             "value":"sam",             "switch":" --format ",             "order":9,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["sam", "bowtie","eland","bam","bed"]}]}}]}],     "output":[        {"id":"wiggleOut",         "name":"treatment.wig",         "switch":" -o ",         "multiplicity":"single",         "type":"File"},        {"id":"control wiggle",         "name":"control.wig",         "switch":"",         "multiplicity":"single",         "type":"File"},        {"id":"summits",         "name":"summits.bed",         "switch":"",         "multiplicity":"single",         "type":"File"},        {"id":"region",         "name":"regions.bed",         "switch":"",         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"PeakRanger",     "description":"ChIP-Seq peak caller",     "type":"ChIPseq Analysis",     "steps":[        {"name":"step_1",         "description":"Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.",         "template_ref":"ranger_template",         "config":            {}}]}]}	ae6618c03199f434d94aaceb9313d1e66|	2011-06-28 11:45:48
33	{"components":[    {"name":"tailWrapper.pl",     "location":"/usr/local3/bin/tail-1.00/",     "type":"executable",     "description":"Tail",     "version":"1.00",     "attribution":"Wrapper for GNU tail. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}],      "templates":[     {"component_ref":"tailWrapper.pl",     "name":"Tail",     "type":"",     "description":"Select last N lines",     "input":[        {"id":"TailInput",         "name":"Input File",         "switch":"",         "order":0,         "multiplicity":"single",         "type":"File"}],              "groups":[             {"id":"",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"LastLines",         \t "order":1,         \t "label":"Extract last N lines",         \t "description": "Extract last N lines from the input file.",         \t "name": "",         \t "value": "1",         \t "type": "Number",\t\t\t "validator":                {"name":"",                 "required":true,                 "rules":[                 \t{"IntAbove":[0]}                 ]}         \t }         ]        }        ],                 "output":[            {"id":"TailOutput",             "name":"tail_output.txt",             "switch":"",             "order":2,             "multiplicity":"single",             "type":"File"}]}],              "analyses":[    {"analysis_name":"Extract Last Lines From a File",     "description":"Use GNU 'tail' to extract the end of a plain text file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Tail",         "config":            {}}]}]}	ae633f2b23f904b5994d49539f7d1a673|	2011-06-28 11:47:03
34	{"components":[    {"name":"uniq",     "location":"/usr/bin/",     "type":"executable",     "description":"Scan for unique values",     "version":"1.00",     "attribution":"Original code © 2009 - by A. Gordon ( gordon at cshl dot edu ). iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"uniq",     "name":"Find Unique Values",     "type":"",     "description":"Scan a file for unique values.",     "input":[        {"id":"UniqInput",         "name":"Input File",         "switch":" ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"PrefixLinesByCount",             "name":" -c ",             "label":"Prefix lines by number of occurrences",             "description":"",             "type":"Flag",             "value":false,             "validator":                {"name":"",                 "required":false,                 "rules":[]},             "order":1},            {"id":"OnlyPrintDuplicateLines",             "name":" -d ",             "label":"Only report duplicate lines",             "description":"",             "type":"Flag",             "value":false,             "validator":                {"name":"",                 "required":false,                 "rules":[]},             "order":1},            {"id":"IgnoreCase",             "name":" -i ",             "label":"Ignore differences in case",             "description":"",             "type":"Flag",             "value":true,             "validator":                {"name":"",                 "required":false,                 "rules":[]},             "order":1},            {"id":"UniqueOnly",             "name":" -u ",             "label":"Only report unique lines",             "description":"",             "type":"Flag",             "value":false,             "validator":                {"name":"",                 "required":false,                 "rules":[]},             "order":1},            {"id":"SkipFields",             "name":" -f ",             "label":"Avoid comparing the first N fields",             "description":"",             "type":"Number",             "value":0,             "validator":                {"name":"",                 "required":false,                 "rules":[]},             "order":0}]}],     "output":[        {"id":"UniqOutput",         "name":"uniq_out.txt",         "switch":" > ",         "order":2,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Find Unique Values",     "description":"Find and report unique values in a text file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Find Unique Values",         "config":            {}}]}]}	acd2f67d73edd41249b3d8a4c40e582a3|	2011-06-28 11:47:27
35	{"components":[    {"name":"wc_wrapper.sh",     "location":"/usr/local3/bin/wc_tool-1.00",     "type":"executable",     "description":"Word Count",     "version":"1.00",     "attribution":"Wrapper for GNU wc. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"wc_wrapper.sh",     "name":"Word Count",     "type":"",     "description":"Generate wc report for a file.",     "input":[        {"id":"wcInput",         "name":"Input File",         "description":"Select file to analyze.",         "switch":"",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[],     "output":[        {"id":"wcOutput",         "name":"wc_out.txt",         "switch":"",         "order":1,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Word Count",     "description":"Count words, lines, and characters in a file",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Word Count",         "config":            {}}]}]}	ac37ced41d82346f68d1b27b56830526c|	2011-06-28 12:08:12
37	{"components":[    {"name":"fastqc_wrapper.sh",     "location":"/usr/local3/bin/fastqc-1.00/",     "type":"executable",     "description":"FastQC",     "version":"0.9.2",     "attribution":"FastQC <http://www.bioinformatics.bbsrc.ac.uk/projects/fastqc/> was written by Simon Andrews of the Babraham Institute (simon.andrews@bbsrc.ac.uk). Reports are collated into PDF and PNG files using wkhtmltopdf <http://code.google.com/p/wkhtmltopdf/>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}],      "templates":[     {"component_ref":"fastqc_wrapper.sh",     "name":"FastQC",     "type":"",     "description":"Generate a QC report for next-gen sequence.",     "input":[        {"id":"FastQCInput",         "name":"Input File",         "switch":"",         "order":0,         "multiplicity":"single",         "type":"File"}],              "groups":[             {"id":"",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"NoGroup",         \t "order":1,         \t "label":"Turn off the dynamic grouping of bases",         \t "description": "Turn off the dynamic grouping of bases in the various per-base plots.  This would allow you to see a result for each base of a 100bp run for example.",         \t "name": "--nogroup ",         \t "value": "1",         \t "type": "Flag"         \t }         ]        }        ],                 "output":[            {"id":"FastQC_Output_Zip",             "name":"fastqc_report.zip",             "switch":"",             "order":2,             "multiplicity":"single",             "type":"File"},             {"id":"FastQC_Output_PNG",             "name":"fastqc_report.png",             "switch":"",             "order":2,             "multiplicity":"single",             "type":"File"},             {"id":"FastQC_Output_PDF",             "name":"fastqc_report.pdf",             "switch":"",             "order":2,             "multiplicity":"single",             "type":"File"}]}],              "analyses":[    {"analysis_name":"FastQC",     "description":"FastQC is an application which takes a FastQ file and runs a series of tests on it to generate a comprehensive QC report.",     "type":"Quality Control and Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"FastQC",         "config":            {}}]}]}	acaf66b31a7d940779d5d3da88c740320|	2011-06-29 10:16:39
38	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Single-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	ab60ca93cec4f453287e86529c9f8adcd|	2011-06-29 11:14:26
39	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"BWAInputFilePair",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":3,         "required":false,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Alignment Tool",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	a4efe7d00987944aa9a341a499d64a13a|	2011-06-29 11:20:28
40	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Alignment Tool",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Single-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Alignment Tool",         "config":            {}}]}]}	ab60ca93cec4f453287e86529c9f8adcd|	2011-06-29 11:22:13
41	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                             {                                                      "id": "E9DF0C56-7E7C-6F31-1A59-A0C69981FC89",                                                      "name": "--library-type ",                                                      "label": "Library Type",                                                      "desc": "",                                                      "type": "Selection",                                                      "isVisible": true,                                                      "value": "fr-unstranded",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": true,                                                               "rules": [                                                                        {                                                                                 "MustContain": [                                                                                          "fr-unstranded",                                                                                          "fr-firststrand",                                                                                          "fr-secondstrand"                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-29 11:49:21
42	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-29 11:49:46
43	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-29 11:52:37
44	{"components":[    {"name":"ranger",     "location":"/usr/local3/bin/ranger-1.02/",     "type":"executable",     "version":"1.02",     "description":"PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com)."}], "templates":[    {"component_ref":"ranger",     "name":"ranger_template",     "type":"",     "description":"ChIP-Seq peak calling",     "input":[        {"id":"treatment",         "name":"Treatment aligned reads file",         "switch":" -d ",         "order":1,         "multiplicity":"single",         "type":"File"},        {"id":"control",         "name":"Control aligned reads file",         "switch":" -c ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"quality",         "label":"Options",         "type":"step",         "properties":[            {"id":"_pval",             "order":3,             "label":"FDR cut off",             "description":"False Discovery Rate cut-off (-p)",             "name":"-p ",             "value":0.00001,             "type":"Number"},            {"id":"_delta",             "order":4,             "label":"Delta (See PeakRanger paper)",             "description":"Delta value (-r)",             "name":"-r ",             "value":0.8,             "type":"Number"},            {"id":"_bw",             "order":5,             "label":"Smoothing bandwidth",             "description":"Smoothing bandwidth (-b)",             "name":"",             "switch":"-b ",             "value":99,             "type":"Number"},            {"id":"_ex",             "order":5,             "label":"Read extension length",             "description":"Read extension length (-l)",             "name":"",             "switch":"-l ",             "value":200,             "type":"Number"},            {"id":"_pad",             "order":6,             "label":"Pad read coverage profiles",             "description":"Pad read coverage to avoid false positive summits",             "name":"--pad ",             "value":false,             "type":"Flag"}]},        {"id":" ",         "name":"running_mode",         "label":"Running modes",         "type":"step",         "properties":[            {"id":"nThread",             "order":7,             "label":"Number of threads",             "description":"",             "name":"-t ",             "visible":false,             "value":4,             "type":"Number"},            {"id":"runningMode",             "name":"--mode ",             "label":"Specify the running mode",             "type":"ValueSelection",             "value":"region",             "order":8,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["region","resolution"]}]}},            {"id":"format",             "name":" --format ",             "label":"Specify the format of the input files",             "type":"ValueSelection",             "value":"sam",             "switch":"--format ",             "order":9,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["sam", "bowtie","eland","bam","bed"]}]}}]}],     "output":[        {"id":"wiggleOut",         "name":"analysis.wig",         "switch":" -o ",         "multiplicity":"single",         "type":"File"}]      }], "analyses":[    {"analysis_name":"PeakRanger",     "description":"ChIP-Seq peak caller",     "type":"ChIPseq Analysis",     "steps":[        {"name":"step_1",         "description":"Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.",         "template_ref":"ranger_template",         "config":            {}}]}]}	ae6618c03199f434d94aaceb9313d1e66|	2011-06-29 12:03:01
45	{"components":[    {"name":"ranger",     "location":"/usr/local3/bin/ranger-1.02/",     "type":"executable",     "version":"1.02",     "description":"PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com)."}], "templates":[    {"component_ref":"ranger",     "name":"ranger_template",     "type":"",     "description":"ChIP-Seq peak calling",     "input":[        {"id":"treatment",         "name":"Treatment aligned reads file",         "switch":" -d ",         "order":1,         "multiplicity":"single",         "type":"File"},        {"id":"control",         "name":"Control aligned reads file",         "switch":" -c ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"quality",         "label":"Options",         "type":"step",         "properties":[            {"id":"_pval",             "order":3,             "label":"FDR cut off",             "description":"False Discovery Rate cut-off (-p)",             "name":"-p ",             "value":"0.0001",             "type":"Text"},            {"id":"_delta",             "order":4,             "label":"Delta (See PeakRanger paper)",             "description":"Delta value (-r)",             "name":"-r ",             "value":0.8,             "type":"Number"},            {"id":"_bw",             "order":5,             "label":"Smoothing bandwidth",             "description":"Smoothing bandwidth (-b)",             "name":"",             "switch":"-b ",             "value":99,             "type":"Number"},            {"id":"_ex",             "order":5,             "label":"Read extension length",             "description":"Read extension length (-l)",             "name":"",             "switch":"-l ",             "value":200,             "type":"Number"},            {"id":"_pad",             "order":6,             "label":"Pad read coverage profiles",             "description":"Pad read coverage to avoid false positive summits",             "name":"--pad ",             "value":false,             "type":"Flag"}]},        {"id":" ",         "name":"running_mode",         "label":"Running modes",         "type":"step",         "properties":[            {"id":"nThread",             "order":7,             "label":"Number of threads",             "description":"",             "name":"-t ",             "visible":false,             "value":4,             "type":"Number"},            {"id":"runningMode",             "name":"--mode ",             "label":"Specify the running mode",             "type":"ValueSelection",             "value":"region",             "order":8,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["region","resolution"]}]}},            {"id":"format",             "name":" --format ",             "label":"Specify the format of the input files",             "type":"ValueSelection",             "value":"sam",             "switch":"--format ",             "order":9,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["sam", "bowtie","eland","bam","bed"]}]}}]}],     "output":[        {"id":"wiggleOut",         "name":"analysis.wig",         "switch":" -o ",         "multiplicity":"single",         "type":"File"}]      }], "analyses":[    {"analysis_name":"PeakRanger",     "description":"ChIP-Seq peak caller",     "type":"ChIPseq Analysis",     "steps":[        {"name":"step_1",         "description":"Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.",         "template_ref":"ranger_template",         "config":            {}}]}]}	ae6618c03199f434d94aaceb9313d1e66|	2011-06-29 12:04:17
46	{"components":[    {"name":"ranger",     "location":"/usr/local3/bin/ranger-1.02/",     "type":"executable",     "version":"1.02",     "description":"PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com)."}], "templates":[    {"component_ref":"ranger",     "name":"ranger_template",     "type":"",     "description":"ChIP-Seq peak calling",     "input":[        {"id":"treatment",         "name":"IP aligned reads file",         "switch":"-d ",         "order":1,         "multiplicity":"single",         "type":"File"},        {"id":"control",         "name":"Control aligned reads file",         "switch":"-c ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"quality",         "label":"Options",         "type":"step",         "properties":[            {"id":"_pval",             "order":3,             "label":"FDR cut off",             "description":"False Discovery Rate cut-off (-p)",             "name":"-p ",             "value":"0.0001",             "type":"Text"},            {"id":"_delta",             "order":4,             "label":"Delta (See PeakRanger paper)",             "description":"Delta value (-r)",             "name":"-r ",             "value":0.8,             "type":"Number"},            {"id":"_bw",             "order":5,             "label":"Smoothing bandwidth",             "description":"Smoothing bandwidth (-b)",             "name":"",             "switch":"-b ",             "value":99,             "type":"Number"},            {"id":"_ex",             "order":5,             "label":"Read extension length",             "description":"Read extension length (-l)",             "name":"",             "switch":"-l ",             "value":200,             "type":"Number"},            {"id":"_pad",             "order":6,             "label":"Pad read coverage profiles",             "description":"Pad read coverage to avoid false positive summits",             "name":"--pad ",             "value":false,             "type":"Flag"}]},        {"id":" ",         "name":"running_mode",         "label":"Running modes",         "type":"step",         "properties":[            {"id":"nThread",             "order":7,             "label":"Number of threads",             "description":"",             "name":"-t ",             "visible":false,             "value":4,             "type":"Number"},            {"id":"runningMode",             "name":"--mode ",             "label":"Specify the running mode",             "type":"ValueSelection",             "value":"region",             "order":8,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["region","resolution"]}]}},            {"id":"format",             "name":" --format ",             "label":"Specify the format of the input files",             "type":"ValueSelection",             "value":"sam",             "switch":"--format ",             "order":9,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["sam", "bowtie","eland","bam","bed"]}]}}]}],     "output":[        {"id":"wiggleOut",         "name":"analysis.wig",         "switch":" -o ",         "multiplicity":"single",         "type":"File"}]      }], "analyses":[    {"analysis_name":"PeakRanger",     "description":"ChIP-Seq peak caller",     "type":"ChIPseq Analysis",     "steps":[        {"name":"step_1",         "description":"Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.",         "template_ref":"ranger_template",         "config":            {}}]}]}	ae6618c03199f434d94aaceb9313d1e66|	2011-06-29 12:05:30
47	{"components":[    {"name":"ranger",     "location":"/usr/local3/bin/ranger-1.02/",     "type":"executable",     "version":"1.02",     "description":"PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com)."}], "templates":[    {"component_ref":"ranger",     "name":"ranger_template",     "type":"",     "description":"ChIP-Seq peak calling",     "input":[        {"id":"treatment",         "name":"Immunoprecipitated reads alignment file",         "switch":"-d ",         "order":1,         "multiplicity":"single",         "type":"File"},        {"id":"control",         "name":"Control reads alignment file",         "switch":"-c ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"quality",         "label":"Options",         "type":"step",         "properties":[            {"id":"_pval",             "order":3,             "label":"FDR cut off",             "description":"False Discovery Rate cut-off (-p)",             "name":"-p ",             "value":"0.0001",             "type":"Text"},            {"id":"_delta",             "order":4,             "label":"Delta (See PeakRanger paper)",             "description":"Delta value (-r)",             "name":"-r ",             "value":0.8,             "type":"Number"},            {"id":"_bw",             "order":5,             "label":"Smoothing bandwidth",             "description":"Smoothing bandwidth (-b)",             "name":"",             "switch":"-b ",             "value":99,             "type":"Number"},            {"id":"_ex",             "order":5,             "label":"Read extension length",             "description":"Read extension length (-l)",             "name":"",             "switch":"-l ",             "value":200,             "type":"Number"},            {"id":"_pad",             "order":6,             "label":"Pad read coverage profiles",             "description":"Pad read coverage to avoid false positive summits",             "name":"--pad ",             "value":false,             "type":"Flag"}]},        {"id":" ",         "name":"running_mode",         "label":"Running modes",         "type":"step",         "properties":[            {"id":"nThread",             "order":7,             "label":"Number of threads",             "description":"",             "name":"-t ",             "visible":false,             "value":4,             "type":"Number"},            {"id":"runningMode",             "name":"--mode ",             "label":"Specify the running mode",             "type":"ValueSelection",             "value":"region",             "order":8,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["region","resolution"]}]}},            {"id":"format",             "name":" --format ",             "label":"Specify the format of the input files",             "type":"ValueSelection",             "value":"sam",             "switch":"--format ",             "order":9,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["sam", "bowtie","eland","bam","bed"]}]}}]}],     "output":[        {"id":"wiggleOut",         "name":"analysis.wig",         "switch":" -o ",         "multiplicity":"single",         "type":"File"}]      }], "analyses":[    {"analysis_name":"PeakRanger",     "description":"ChIP-Seq peak caller",     "type":"ChIPseq Analysis",     "steps":[        {"name":"step_1",         "description":"Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.",         "template_ref":"ranger_template",         "config":            {}}]}]}	ae6618c03199f434d94aaceb9313d1e66|	2011-06-29 12:10:04
48	{"components":[    {"name":"samtools_sam_to_sorted_bam.sh",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"Create sorted, indexed BAM from SAM",     "version":"1.00",     "attribution":"SAMtools view, sort, index <http://samtools.sourceforge.net/>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"samtools_sam_to_sorted_bam.sh",     "name":"BAM from SAM",     "type":"",     "description":"Create sorted, indexed BAM from SAM using SAMtools",     "input":[        {"id":"inputSAM",         "name":"Input SAM File",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[],         "output":[]}], "analyses":[    {"analysis_name":"Create BAM from SAM file",     "description":"Create sorted, indexed BAM from SAM using SAMtools.",     "type":"Utility Tools",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BAM from SAM",         "config":            {}}]}]}	a7909c999d97347dca20d6aba44fe5294|	2011-06-29 13:47:01
50	{"components":[    {"name":"ranger",     "location":"/usr/local3/bin/ranger-1.02/",     "type":"executable",     "version":"1.02",     "description":"PeakRanger:an ultra-fast ChIP-Seq peak caller. Feng X, Grossman R, Stein L: PeakRanger: A cloud-enabled peak caller for ChIP-seq data. BMC Bioinformatics 2011, 12(1):139. http://ranger.sourceforge.net Developed by Xin Feng (peak.ranger@gmail.com)."}], "templates":[    {"component_ref":"ranger",     "name":"ranger_template",     "type":"",     "description":"ChIP-Seq peak calling",     "input":[        {"id":"treatment",         "name":"Immunoprecipitated reads alignment file",         "switch":"-d ",         "order":1,         "multiplicity":"single",         "type":"File"},        {"id":"control",         "name":"Control reads alignment file",         "switch":"-c ",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"quality",         "label":"Options",         "type":"step",         "properties":[            {"id":"_pval",             "order":3,             "label":"FDR cut off",             "description":"False Discovery Rate cut-off (-p)",             "name":"-p ",             "value":"0.0001",             "type":"Text"},            {"id":"_delta",             "order":4,             "label":"Delta (See PeakRanger paper)",             "description":"Delta value (-r)",             "name":"-r ",             "value":0.8,             "type":"Number"},            {"id":"_bw",             "order":5,             "label":"Smoothing bandwidth",             "description":"Smoothing bandwidth (-b)",             "name":"",             "switch":"-b ",             "value":99,             "type":"Number"},            {"id":"_ex",             "order":5,             "label":"Read extension length",             "description":"Read extension length (-l)",             "name":"",             "switch":"-l ",             "value":200,             "type":"Number"},            {"id":"_pad",             "order":6,             "label":"Pad read coverage profiles",             "description":"Pad read coverage to avoid false positive summits",             "name":"--pad ",             "value":false,             "type":"Flag"}]},        {"id":" ",         "name":"running_mode",         "label":"Running modes",         "type":"step",         "properties":[            {"id":"nThread",             "order":7,             "label":"Number of threads",             "description":"",             "name":"-t ",             "visible":false,             "value":4,             "type":"Number"},            {"id":"runningMode",             "name":"--mode ",             "label":"Specify the running mode",             "type":"ValueSelection",             "value":"region",             "order":8,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["region","resolution"]}]}},            {"id":"format",             "name":" --format ",             "label":"Specify the format of the input files",             "type":"ValueSelection",             "value":"sam",             "switch":"--format ",             "order":9,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["sam", "bowtie","eland","bam","bed"]}]}}]}],     "output":[        {"id":"wiggleOut",         "name":"PeakRanger_Analysis",         "switch":" -o ",         "multiplicity":"single",         "type":"File"}]      }], "analyses":[    {"analysis_name":"PeakRanger",     "description":"ChIP-Seq peak caller",     "type":"ChIPseq Analysis",     "steps":[        {"name":"step_1",         "description":"Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.",         "template_ref":"ranger_template",         "config":            {}}]}]}	ae6618c03199f434d94aaceb9313d1e66|	2011-06-29 14:26:44
51	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-29 14:30:56
52	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Alignment Tool",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Alignment Tool",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Alignment Tool",         "config":            {}}]}]}	a0eb6b282f4c64e25b7288c7d4168fa8d|	2011-06-29 14:31:20
53	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Paired-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	a034c7638dc8445e5af6ad580c3cb0f3f|	2011-06-29 14:32:25
54	{ "components": [{"location": "/usr/local2/sheldon", "name": "dnaml.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "dnanj.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "dnapars.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "fasttree.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "proml.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "protnj.pl", "type": "executable"}, {"location": "/usr/local2/sheldon", "name": "protpars.pl", "type": "executable"}]}		2011-06-29 14:34:15
55	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select Read 1 FASTQ file to align:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},       {"id":"TopHatInputFile2",         "name":"Select Read 2 FASTQ file to align:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Paired-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	a034c7638dc8445e5af6ad580c3cb0f3f|	2011-06-29 14:34:37
56	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Single-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	a765f327258fb445a88bfc24c26788e33|	2011-06-29 14:36:13
57	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Aligner for Single-End Illumina Reads",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Single-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	ab60ca93cec4f453287e86529c9f8adcd|	2011-06-29 14:39:40
58	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list:",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select Read 1 FASTQ file:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"BWAInputFilePair",         "name":"Select Read 2 FASTQ file:",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":3,         "required":false,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Paired-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	a8540c5e9df044e789650d1f9d4d7c15f|	2011-06-29 14:40:22
59	{"components":[    {"name":"run_bwa.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"BWA Aligner for Single-End Illumina Reads",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_bwa.pl",     "name":"BWA Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using BWA.",     "input":[        {"id":"BWAReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"BWAInputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"1D957FC1-65D5-E033-9D79-BEB15200E6E1",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"95AD8D8A-54BC-32C5-3433-F17A48330F66",             "name":"",             "label":"Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.",             "desc":"",             "type":"Info",             "isVisible":true,             "value":"",             "order":-1},            {"id":"5E7DC065-CF78-5C78-AFA4-80929E96A923",             "name":"-n ",             "label":"Mismatch tolerance",             "desc":"Testing hovertext",             "type":"Number",             "isVisible":true,             "value":"0.04",             "order":-1},            {"id":"7A10212D-BBB1-7990-0AC0-950FB8A13C44",             "name":"-o ",             "label":"Maximum number of gap opens",             "type":"Number",             "isVisible":true,             "value":"1",             "order":-1},            {"id":"E0C3D817-4715-AB8F-80EE-3ACAC029C8B1",             "name":"-e ",             "label":"Maximum number of gap extensions",             "desc":"-1 for k-difference mode (disallowing long gaps)",             "type":"Number",             "isVisible":true,             "value":"-1",             "order":-1},            {"id":"ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E",             "name":"-d ",             "label":"Disallow long deletion within [value] bp towards the 3'-end",             "type":"Number",             "isVisible":true,             "value":"16",             "order":-1},            {"id":"3CAA4498-6A2F-7167-DDC0-3174385D0FBB",             "name":"-i ",             "label":"Disallow insertion/deletion within [value] bp towards the end",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"5",             "order":-1},            {"id":"CF1266E5-4069-C286-630A-FC4B54C1627E",             "name":"-k ",             "label":"Maximum edit distance in the seed",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"2",             "order":-1},            {"id":"A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7",             "name":"-M ",             "label":"Mismatch penalty",             "desc":"BWA will not search for suboptimal hits with a score lower than [value]",             "type":"Number",             "isVisible":true,             "value":"3",             "order":-1},            {"id":"438FB3A3-C78F-E2C3-4296-495487BCBABC",             "name":"-O ",             "label":"Gap open penalty",             "desc":"",             "type":"Number",             "isVisible":true,             "value":"11",             "order":-1},            {"id":"25A5BF70-73E4-E542-BCDD-9D1235E39860",             "name":"-E ",             "label":"Gap extension penalty",             "type":"Number",             "isVisible":true,             "value":"4",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"9A224CED-7C8C-3CD8-1E8E-432A1C9A796C",             "name":"-R ",             "label":"Proceed with suboptimal alignments even if the top hit is a repeat",             "desc":"For paired-end reads only. By default, BWA only searches for suboptimal alignments if the top hit is unique. Using this option has no effect on accuracy for single-end reads. It is mainly designed for improving the alignment accuracy of paired-end reads. However, the pairing procedure will be slowed down, especially for very short reads.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-1},            {"id":"numberThreads",             "name":"-t ",             "label":"",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1}]}],     "output":[]}], "analyses":[    {"analysis_name":"BWA Aligner for Single-End Illumina Reads",     "description":"Use BWA to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"BWA Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	ab60ca93cec4f453287e86529c9f8adcd|	2011-06-29 14:40:25
60	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             },                                             {                                                      "id": "threads",                                                      "name": "--num-threads ",                                                      "label": "Number of threads",                                                      "desc": "TopHat can run in parallel on the compute node.",                                                      "type": "Number",                                                      "isVisible": false,                                                      "value": 4,                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Single-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	a765f327258fb445a88bfc24c26788e33|	2011-06-29 15:48:09
61	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select Read 1 FASTQ file to align:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},       {"id":"TopHatInputFile2",         "name":"Select Read 2 FASTQ file to align:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": true,                                                      "value": "false",                                                      "order": -1                                             },                                             {                                                      "id": "threads",                                                      "name": "--num-threads ",                                                      "label": "Number of threads",                                                      "desc": "TopHat can run in parallel on the compute node.",                                                      "type": "Number",                                                      "isVisible": false,                                                      "value": 4,                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Paired-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	a034c7638dc8445e5af6ad580c3cb0f3f|	2011-06-29 15:48:44
62	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select Read 1 FASTQ file to align:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},       {"id":"TopHatInputFile2",         "name":"Select Read 2 FASTQ file to align:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": false,                                                      "value": "false",                                                      "order": -1                                             },                                             {                                                      "id": "threads",                                                      "name": "--num-threads ",                                                      "label": "Number of threads",                                                      "desc": "TopHat can run in parallel on the compute node.",                                                      "type": "Number",                                                      "isVisible": false,                                                      "value": 4,                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Paired-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	a034c7638dc8445e5af6ad580c3cb0f3f|	2011-06-29 15:55:15
63	{"components":[    {"name":"run_tophat.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"TopHat Alignment Tool",     "version":"1.01",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_tophat.pl",     "name":"TopHat Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align RNAseq sequences to a reference genome using TopHat.",     "input":[        {"id":"TopHatReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"TopHatInputFile1",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups": {                  "id": "--root-PropertyGroupContainer--",                  "name": "",                  "label": "TopHat",                  "desc": "",                  "type": "",                  "isVisible": true,                  "groups": [                           {                                    "id": "84E5B1EF-05FD-1CCF-6805-8701418AB872",                                    "name": "",                                    "label": "Options",                                    "desc": "",                                    "type": "",                                    "isVisible": true,                                    "groups": [],                                    "properties": [                                   \t\t   {                                                      "id": "2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826",                                                      "name": "--library-type ",                                                      "label": "Parameter 1",                                                      "desc": "",                                                      "type": "Text",                                                      "isVisible": false,                                                      "value": "fr-unstranded",                                                      "order": 0                                             },                                             {                                                      "id": "F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA",                                                      "name": "--min-anchor-length ",                                                      "label": "Anchor length",                                                      "desc": "TopHat will report junctions spanned by reads with at least this many bases on each side of the junction.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "8",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          2                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "522F5734-FA15-FDBA-C390-4EDD3F42316C",                                                      "name": "--splice-mismatches ",                                                      "label": "Maximum number of mismatches that can appear in the anchor region of spliced alignment",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "35CBD019-8B84-FF9A-8D2A-509262307EC6",                                                      "name": "--min-intron-length ",                                                      "label": "The minimum intron length",                                                      "desc": "TopHat will ignore donor/acceptor pairs closer than this many bases apart.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "70",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "1D83679F-685D-806F-0385-7E391406395D",                                                      "name": "--max-intron-length ",                                                      "label": "The maximum intron length",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50000",                                                      "validator": {                                                               "id": "",                                                               "name": "",                                                               "label": "",                                                               "desc": "",                                                               "type": "",                                                               "isVisible": true,                                                               "required": false,                                                               "rules": [                                                                        {                                                                                 "IntAbove": [                                                                                          -1                                                                                 ]                                                                        }                                                               ]                                                      },                                                      "order": -1                                             },                                             {                                                      "id": "DC31B362-5120-4405-4DD0-F1866E130D75",                                                      "name": "--min-isoform-fraction ",                                                      "label": "Minimum isoform fraction",                                                      "desc": "Filter out junctions supported by too few alignments (number of reads divided by average depth of coverage). Zero disables the filter.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "0.15",                                                      "order": -1                                             },                                             {                                                      "id": "22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5",                                                      "name": "--max-multihits ",                                                      "label": "Maximum number of alignments to be allowed",                                                      "desc": "Instructs TopHat to allow up to this many alignments to the reference for a given read, and suppresses all alignments for reads with more than this many alignments.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "20",                                                      "order": -1                                             },                                             {                                                      "id": "4A30FC41-4218-550A-1412-158694A221C6",                                                      "name": "--min-segment-intron ",                                                      "label": "Minimum intron length that may be found during split-segment (default) search.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "50",                                                      "order": -1                                             },                                             {                                                      "id": "C94FAB10-553A-50B3-114A-780779A2308C",                                                      "name": "--max-segment-intron ",                                                      "label": "Maximum intron length that may be found during split-segment (default) search",                                                      "desc": "",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "500000",                                                      "order": -1                                             },                                             {                                                      "id": "222E2998-FB4F-D828-D1D7-3EA03419B427",                                                      "name": "--segment-mismatches ",                                                      "label": "Number of mismatches allowed in each segment alignment for reads mapped independently",                                                      "desc": "Read segments are mapped independently, allowing up to this many mismatches in each segment alignment.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "2",                                                      "order": -1                                             },                                             {                                                      "id": "C956168F-90AC-C907-6CFB-D572A74CDF0F",                                                      "name": "--segment-length ",                                                      "label": "Minimum length of read segments",                                                      "desc": "Each read is cut up into segments, each at least this long. These segments are mapped independently.",                                                      "type": "Number",                                                      "isVisible": true,                                                      "value": "25",                                                      "order": -1                                             },                                             {                                                      "id": "8FD71E20-E861-3831-14B4-7CC3F64F7571",                                                      "name": "--no-convert-bam ",                                                      "label": "Do not convert output to BAM format",                                                      "desc": "",                                                      "type": "Flag",                                                      "isVisible": false,                                                      "value": "false",                                                      "order": -1                                             },                                             {                                                      "id": "threads",                                                      "name": "--num-threads ",                                                      "label": "Number of threads",                                                      "desc": "TopHat can run in parallel on the compute node.",                                                      "type": "Number",                                                      "isVisible": false,                                                      "value": 4,                                                      "order": -1                                             }                                    ]                           }                  ]         },     "output":[]}], "analyses":[    {"analysis_name":"TopHat Aligner for Single-End Illumina Reads",     "description":"Use TopHat to align next-gen RNAseq to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"TopHat Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	a765f327258fb445a88bfc24c26788e33|	2011-06-29 15:55:29
64	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Single-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "Selection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Single-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	aa98aa2205fec4cd195185b74fcd222cc|	2011-06-30 14:35:19
65	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Single-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Parameter 2",\t\t\t"desc": "HELLOWORLD",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "Selection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Single-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	aa98aa2205fec4cd195185b74fcd222cc|	2011-06-30 14:38:30
66	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Single-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Parameter 2",\t\t\t"desc": "HELLOWORLD",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Single-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	aa98aa2205fec4cd195185b74fcd222cc|	2011-06-30 14:54:38
67	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Single-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Parameter 2",\t\t\t"desc": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Single-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	aa98aa2205fec4cd195185b74fcd222cc|	2011-06-30 14:56:52
68	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Single-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Parameter 2",\t\t\t"desc": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Single-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	aa98aa2205fec4cd195185b74fcd222cc|	2011-06-30 14:59:10
69	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Single-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Single-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"desc": "",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Single-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Single-End Illumina Reads",         "config":            {}}]}]}	aa98aa2205fec4cd195185b74fcd222cc|	2011-06-30 15:00:15
70	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Paired-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"SOAP2InputFile2",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"desc": "",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Paired-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	ac0a5fbb86a3f4c3c89a37b29ad8854a4|	2011-06-30 16:03:09
71	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Paired-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"SOAP2InputFile2",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[         {"id":"minimalInsertSize","name":"-m ","label":"Minimal insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":400,"order":-1},            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"desc": "",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Paired-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	ac0a5fbb86a3f4c3c89a37b29ad8854a4|	2011-06-30 16:03:27
72	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Paired-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"SOAP2InputFile2",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[         {"id":"minimalInsertSize","name":"-m ","label":"Minimal insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":400,"order":-1},{"id":"maximumInsertSize","name":"-x ","label":"Maximum insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":600,"order":-1},            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"desc": "",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Paired-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	ac0a5fbb86a3f4c3c89a37b29ad8854a4|	2011-06-30 16:03:43
73	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Paired-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"SOAP2InputFile2",         "name":"Select FASTQ sequence to align",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[         {"id":"minimalInsertSize","name":"-m ","label":"Minimal insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":400,"order":-1},{"id":"maximumInsertSize","name":"-x ","label":"Maximum insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":600,"order":-1},{"id":"orientationMode","name":"-R ","label":"Reads are from a mate-pair library (> 2kb inserts)","desc":"","type":"Flag","isVisible":true,"value":false,"order":-1},            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"desc": "",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Paired-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	ac0a5fbb86a3f4c3c89a37b29ad8854a4|	2011-06-30 16:05:00
74	{"components":[    {"name":"run_soap2.pl",     "location":"/usr/local3/bin/",     "type":"executable",     "description":"SOAP2 Aligner for Paired-End Illumina Reads",     "version":"1.00",     "attribution":"SOAP2 Aligner <http://soap.genomics.org.cn/soapaligner.html>. iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run_soap2.pl",     "name":"SOAP2 Aligner for Paired-End Illumina Reads",     "type":"",     "description":"Align FASTQ sequences to a reference genome using SOAP2",     "input":[        {"id":"SOAP2ReferenceGenome",         "name":"Select a reference genome from the list.",         "type":"ReferenceSequence",         "switch":"--database ",         "order":1,         "required":false,         "multiplicity":"single"},        {"id":"SOAP2InputFile",         "name":"Select Read 1 FASTQ sequence:",         "description":"",         "switch":"--query1 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"},        {"id":"SOAP2InputFile2",         "name":"Select Read 1 FASTQ sequence:",         "description":"",         "switch":"--query2 ",         "type":"File",         "order":2,         "required":true,         "multiplicity":"single"}],     "groups":[        {"id":"optionsGroup",         "name":"",         "label":"Options",         "desc":"",         "type":"",         "isVisible":true,         "groups":[],         "properties":[         {"id":"minimalInsertSize","name":"-m ","label":"Minimal insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":400,"order":-1},{"id":"maximumInsertSize","name":"-x ","label":"Maximum insert size allowed for alignment","desc":"","type":"Number","isVisible":true,"value":600,"order":-1},{"id":"orientationMode","name":"-R ","label":"Reads are from a mate-pair library (> 2kb inserts)","desc":"","type":"Flag","isVisible":true,"value":false,"order":-1},            {"id":"filterLowQuality",             "name":"-n ",             "label":"Filter low quality reads containing more this many Ns:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":5,             "order":-1},            {"id":"totalMismatchesAllowed",             "name":"-v ",             "label":" Total allowed mismatches in one read:",             "desc":"",             "type":"Number",             "isVisible":true,             "value":2,             "order":-1},            {"id":"numberThreads",             "name":"-p ",             "label":"Number of threads to launch",             "desc":"",             "type":"Number",             "isVisible":false,             "value":4,             "order":-1},\t\t\t{\t\t\t"id": "matchModeInfo",\t\t\t"name": "",\t\t\t"label": "Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit",\t\t\t"desc": "",\t\t\t"type": "Info",\t\t\t"isVisible": true,\t\t\t"value": "",\t\t\t"order": 0\t\t\t},{\t\t\t"id": "matchMode",\t\t\t"name": "-M ",\t\t\t"label": "Matching mode",\t\t\t"type": "ValueSelection",\t\t\t"isVisible": true,\t\t\t"value": "4",\t\t\t"validator": {\t\t\t\t   "isVisible": true,\t\t\t\t   "required": true,\t\t\t\t   "rules": [{"MustContain": ["4","3","2","1","0"]}]\t\t\t},\t\t\t"order": 0\t\t\t}]}],     "output":[]}], "analyses":[    {"analysis_name":"SOAP2 Aligner for Paired-End Illumina Reads",     "description":"Use SOAP2 to align next-gen data to a reference sequence.",     "type":"Transcriptomics and Genomics",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SOAP2 Aligner for Paired-End Illumina Reads",         "config":            {}}]}]}	ac0a5fbb86a3f4c3c89a37b29ad8854a4|	2011-06-30 16:05:36
75	{    "components": [        {            "name": "muscle-qa",            "location": "/usr/local2/bin/",            "type": "executable",            "description": "",            "version": "",            "attribution": ""        }    ],    "templates": [        {            "component_ref" : "muscle-qa",            "name" : "Muscle-QA",            "type": "",            "description" : "Muscle:  Multiple Sequence Alignment",            "input" : [                {                    "id" : "MuscleIn",                    "name" : "Alignment file in Fasta format",                    "switch" : " -in ",                    "order" : 1,                    "multiplicity" : "single",                    "type": "File"                 }             ],            "groups" : [                {                    "id": "",                    "name" : "group1",                    "label" : "options",                    "type": "step",                    "properties" : [                        {                            "id" : "SeqType",                            "name" : " -seqtype ",                            "label" : "Type of sequence: nucleotide (nt) / amino acid (aa)",                            "type" : "ValueSelection",                            "value" : "auto",                            "validator" : {                                "name": "",                                "required" : true,                                "rules" : [                                    {                                        "MustContain" : [                                            "Auto",                                            "DNA",                                            "Protein"                                         ]                                     }                                 ]                             },                            "order" : 2                         }                     ]                 }             ],            "output" : [                {                    "id" : "OutputFilePhylipInterlaced",                    "name" : "alignment.phylipi",                    "switch" : " -phyiout ",                    "order" : 3,                    "multiplicity" : "single",                    "type": "File"                 },                {                    "id" : "OutputFileFasta",                    "name" : "alignment.mfa",                    "switch" : " -fastaout ",                    "order" : 3,                    "multiplicity" : "single",                    "type": "File"                 },                {                    "id" : "OutputFileMSF",                    "name" : "alignment.msf",                    "switch" : " -msfout ",                    "order" : 3,                    "multiplicity" : "single",                    "type": "File"                 }             ]        }    ],    "analyses": [        {            "analysis_name": "Muscle-QA (QA Testing)",            "description": "Muscle: Multiple Sequence Alignment",            "type": "Mutliple Sequence Alignment",            "steps": [                {                    "name": "step_1",                    "description": "",                    "template_ref": "Muscle-QA",                    "config": {                                            }                 }            ]        }    ]}	a747fffc4e72f4909a2647525bfaa11f6|	2011-07-05 09:31:05
76	{\t"components":[\t\t\t\t\t{ \t\t\t    "name": "muscle-blah",\t\t\t    "location": "/usr/local2/bin/",\t\t\t    "type": "executable",\t\t\t    "description": "",\t\t\t    "version": "",\t\t\t    "attribution": ""\t\t\t}\t\t\t\t\t\t],\t"templates":[\t\t{\t\t    "component_ref" : "muscle-blah",\t\t    "name" : "Muscle-Blah",\t\t    "type": "",\t\t    "description" : "Muscle:  Multiple Sequence Alignment",\t\t    "input" : [\t\t        {\t\t            "id" : "MuscleIn",\t\t            "name" : "Alignment file in Fasta format",\t\t            "switch" : " -in ",\t\t            "order" : 1,\t\t            "multiplicity" : "single",\t\t            "type": "File" \t\t        } \t\t    ],\t\t    "groups" : [\t\t        {\t\t            "id": "",\t\t            "name" : "group1",\t\t            "label" : "options",\t\t            "type": "step",\t\t            "properties" : [\t\t                {\t\t                    "id" : "SeqType",\t\t                    "name" : " -seqtype ",\t\t                    "label" : "Type of sequence: nucleotide (nt) / amino acid (aa)",\t\t                    "type" : "ValueSelection",\t\t                    "value" : "auto",\t\t                    "validator" : {\t\t                        "name": "",\t\t                        "required" : true,\t\t                        "rules" : [\t\t                            {\t\t                                "MustContain" : [\t\t                                    "Auto",\t\t                                    "DNA",\t\t                                    "Protein" \t\t                                ] \t\t                            } \t\t                        ] \t\t                    },\t\t                    "order" : 2 \t\t                } \t\t            ]\t\t           \t\t        } \t\t    ],\t\t\t "output" : [\t                {\t                    "id" : "OutputFilePhylipInterlaced",\t                    "name" : "alignment.phylipi",\t                    "switch" : " -phyiout ",\t\t\t    \t                    "order" : 3,\t                    "multiplicity" : "single",\t                    "type": "File" \t                },\t                {\t                    "id" : "OutputFileFasta",\t                    "name" : "alignment.mfa",\t                    "switch" : " -fastaout ",\t                    "order" : 3,\t                    "multiplicity" : "single",\t                    "type": "File" \t                },\t                {\t                    "id" : "OutputFileMSF",\t                    "name" : "alignment.msf",\t                    "switch" : " -msfout ",\t                    "order" : 3,\t                    "multiplicity" : "single",\t                    "type": "File" \t                } \t            ]\t\t\t}\t],\t"analyses":[\t\t{\t\t     "analysis_name": "Muscle-Blah (Invalid JSON)",\t\t     "description": "This should not be imported, it's invalid JSON.  Extra commas",\t\t     "type": "Mutliple Sequence Alignment",\t\t     "steps": [     {\t\t     \t\t          "name": "step_1",\t\t          "description": "",\t\t          "template_ref": "Muscle-Blah",\t\t          "config": {},\t\t     }],\t\t}\t]}	add5a95c07fe74746820e8de4101f4eb8|	2011-07-05 09:31:09
77	{"components":[    {"name":"fastq-dump",     "location":"/usr/local3/bin/sratoolkit.2.0.1-centos_linux64",     "type":"executable",     "description":"Convert SRA format data into FASTQ",     "version":"2.01",     "attribution":"NCBI SRA Toolkit 2.01 <http://www.ncbi.nlm.nih.gov/books/NBK47540/>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"fastq-dump",     "name":"SRA to FASTQ",     "type":"",     "description":"Convert SRA format to FASTQ.",     "input":[        {"id":"SRAFile",         "name":"Choose an SRA file:",         "switch":"",         "order":2,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Parameters",         "type":"step",         "properties":[            {"id":"AccessionName",             "name":"-A ",             "label":"SRA Accession Name",             "description":"",             "type":"Text",             "value":"SRR...",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1}]}]}], "analyses":[    {"analysis_name":"NCBI SRA Toolkit fastq-dump",     "description":"Convert SRA format to FASTQ using fastq-dump.",     "type":"Data Conversion",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"SRA to FASTQ",         "config":            {}}]}]}	af3108d64f08648418f9ff677c1516852|	2011-07-07 11:01:32
78	{"components":[    {"name":"run-genemania-query.pl",     "location":"/usr/local3/bin/genemania-query-runner-1.00/",     "type":"executable",     "description":"GeneMania Query Runner",     "version":"1.00",     "attribution":"GeneMania Query Runner <http://www.genemania.org/plugin/tools.html>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run-genemania-query.pl",     "name":"GeneMania Query Runner",     "type":"",     "description":"Run a gene network prediction and write the results to a file.",     "input":[],     "groups":[        {"id":" ",         "name":"group1",         "label":"Specify Gene List",         "type":"step",         "properties":[            {"id":"GeneList",             "name":" --genelist ",             "label":"Enter a comma- or space-separated list of genes:",             "description": "",             "type":"Text",             "value":"FWA, FLC, TFL1, FT, SOC1",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1}             ]        },        {"id":"",         "name":"group2",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"Species",         \t "order":2,         \t "label":"Select target species:",         \t "description": "",         \t "name": " --species ",         \t "value": "Arabidopsis thaliana",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["Arabidopsis thaliana"]}]},         \t "type": "ValueSelection"         \t},         \t{"id":"RelatedGeneLimit",         \t "order":2,         \t "label":"Related gene limit:",         \t "description": "",         \t "name": "--related_gene_limit ",         \t "value": 15,         \t "type": "Number"         \t },         \t{"id":"CombiningMethod",         \t "order":2,         \t "label":"Weighting Method:",         \t "description": "",         \t "name": "--combining_method ",         \t "value": "automatic",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["automatic","average", "average_category", "bp", "mf", "cc"]}]},         \t "type": "ValueSelection"         \t }         ]        },        {"id":" ",         "name":"group3",         "label":"Networks",         "type":"step",         "properties":[            {"id":"Coexp",             "name":" --coexp ",             "label":"Co-expression",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},\t\t\t{"id":"Coloc",             "name":" --coloc ",             "label":"Empirical colocation",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Gi",             "name":" --gi ",             "label":"Genetic interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},            {"id":"Path",             "name":" --path ",             "label":"Pathway interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Pi",             "name":" --pi ",             "label":"Physical interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":true},            {"id":"Predict",             "name":" --predict ",             "label":"Predicted interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Spd",             "name":" --spd ",             "label":"Shared protein domains",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Other",             "name":" --other ",             "label":"Other networks",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false} ]        }         \t        ],         "output":[            {"id":"GeneManiaOutput",             "name":"*results.report*",             "switch":" ",             "order":4,             "multiplicity":"many",             "type":"File"}]}], "analyses":[    {"analysis_name":"GeneMania Query Runner",     "description":"Run a gene network prediction and write the results to a file.",     "type":"Gene Annotation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"GeneMania Query Runner",         "config":            {}}]}]}	ac12eb6c54cd74ecaacaac8ee0174f44d|	2011-07-07 12:45:20
79	{"components":[    {"name":"changeCase.pl",     "location":"/usr/local3/bin/change_case-1.00/",     "type":"executable",     "description":"Change case of columns.",     "version":"1.00",     "attribution":"Port of Galaxy Change Case Tool: iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"changeCase.pl",     "name":"Change Case",     "type":"",     "description":"Change the case of specific columns in a delimited-text file.",     "input":[        {"id":"ChangeCaseInput",         "name":"Input File",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"Cols",             "name":"",             "label":"Specify columns to change:",             "description":"",             "type":"Text",             "value":"c1,c2",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1},            {"id":"Casing",             "name":"",             "label":"Change case to:",             "description":"",             "type":"ValueSelection",             "value":"Uppercase",             "order":3,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["Uppercase","Lowercase"]}]}},            {"id":"Delimiter",             "name":" ",             "label":"Input file is delimited by:",             "type":"ValueSelection",             "value":"TAB",             "order":2,             "validator":                {"name":"",                 "required":true,                 "rules":[                    {"MustContain":["TAB","SPACE","COMMA","DOT","PIPE","DASH","UNDERSCORE"]}]}}]}],     "output":[        {"id":"ChangeCaseOutput",         "name":"change_case_out.txt",         "switch":"",         "order":3,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Change Case",     "description":"Change the case of specific columns in a delimited-text file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Change Case",         "config":            {}}]}]}            	aa33390c746b04ed6896936e990fbbb9d|	2011-07-07 13:07:17
80	{"components":[    {"name":"awk_wrapper.sh",     "location":"/usr/local3/bin/awk_tool-1.00/",     "type":"executable",     "description":"Awk",     "version":"1.00",     "attribution":"Wrapper for GNU awk based on the Galaxy tool. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"awk_wrapper.sh",     "name":"Awk",     "type":"",     "description":"Run the UNIX awk command on the selected file.",     "input":[        {"id":"AwkInput",         "name":"Input File",         "description":"Select an input file.",         "switch":"",         "order":1,         "multiplicity":"single",         "type":"File"}],     "groups":[     {"id":"",         "name":"group1",         "label":"Parameters",         "type":"step",         "properties":[            {"id":"AwkProgram",             "name":"",             "label":"Enter an Awk Program",             "description": "",             "type":"Text",             "value":"",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":3},           {"id":"InputSeparator",             "name":"",             "label":"Input Field Delimiter",             "description": "",             "type":"ValueSelection",             "value":"tab",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["tab",",",".",":","|","-","_"]}]},             "order":4},           {"id":"OutputSeparator",             "name":"",             "label":"Input Field Delimiter",             "description": "",             "type":"ValueSelection",             "value":"tab",             "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["tab",",",".",":","|","-","_"]}]},             "order":5}               ]}     ],     "output":[        {"id":"AwkOutput",         "name":"awk_out.txt",         "switch":"",         "order":2,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"GNU awk",     "description":"Run the UNIX awk command on the selected file.",     "type":"Text Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Awk",         "config":            {}}]}]}	a14ca47a19372410992a83784e462dfe4|	2011-07-07 13:07:29
85	{ "components": [{"description": "", "location": "/usr/local3/bin/BTI_iPlant_RNAseq/scripts executable", "name": "RNAseq_Wrapper.sh", "type": "Brutnell RNAseq Pipeline", "version": "M. Vaughn"}, {"attribution": "M. Vaughn", "description": "ontologizer", "location": "/usr/local3/bin/ontologizer-1.00", "name": "ontologizer.sh", "type": "executable", "version": ""}, {"attribution": "M. Vaughn", "description": "BBC Bicluster", "location": "/usr/local2/BBC_Bicluster", "name": "BBC", "type": "executable", "version": ""}]}		2011-07-19 10:12:45
86	{ "components": [{"attribution": "M. Vaughn", "description": "Brutnell RNAseq Pipeline", "location": "/usr/local3/bin/BTI_iPlant_RNAseq/scripts", "name": "RNAseq_Wrapper.sh", "type": "executable", "version": ""}]}		2011-07-19 10:33:42
87	{"components":[    {"name":"run-genemania-query.pl",     "location":"/usr/local3/bin/genemania-query-runner-1.00/",     "type":"executable",     "description":"GeneMania Query Runner",     "version":"1.00",     "attribution":"GeneMania Query Runner <http://www.genemania.org/plugin/tools.html>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run-genemania-query.pl",     "name":"GeneMania Query Runner",     "type":"",     "description":"Run a gene network prediction and write the results to a file.",     "input":[],     "groups":[        {"id":" ",         "name":"group1",         "label":"Specify Gene List",         "type":"step",         "properties":[            {"id":"GeneList",             "name":" --genelist ",             "label":"Enter a comma- or space-separated list of genes:",             "description": "",             "type":"Text",             "value":"FWA, FLC, TFL1, FT, SOC1",             "validator":                {"name":"",                 "required":true,                 "rules":[]},             "order":1}             ]        },        {"id":"",         "name":"group2",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"Species",         \t "order":2,         \t "label":"Select target species:",         \t "description": "",         \t "name": " --species ",         \t "value": "Arabidopsis thaliana",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["Arabidopsis thaliana"]}]},         \t "type": "ValueSelection"         \t},         \t{"id":"RelatedGeneLimit",         \t "order":2,         \t "label":"Related gene limit:",         \t "description": "",         \t "name": "--related_gene_limit ",         \t "value": 15,         \t "type": "Number"         \t },         \t{"id":"CombiningMethod",         \t "order":2,         \t "label":"Weighting Method:",         \t "description": "",         \t "name": "--combining_method ",         \t "value": "automatic",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["automatic","average", "average_category", "bp", "mf", "cc"]}]},         \t "type": "ValueSelection"         \t },         \t {"id":"OutputType",         \t "order":2,         \t "label":"Output Format:",         \t "description": "",         \t "name": "--out ",         \t "value": "flat",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["flat","genes", "xml", "scores"]}]},         \t "type": "ValueSelection"         \t }         ]        },        {"id":" ",         "name":"group3",         "label":"Networks",         "type":"step",         "properties":[            {"id":"Coexp",             "name":" --coexp ",             "label":"Co-expression",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},\t\t\t{"id":"Coloc",             "name":" --coloc ",             "label":"Empirical colocation",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Gi",             "name":" --gi ",             "label":"Genetic interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},            {"id":"Path",             "name":" --path ",             "label":"Pathway interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Pi",             "name":" --pi ",             "label":"Physical interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":true},            {"id":"Predict",             "name":" --predict ",             "label":"Predicted interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Spd",             "name":" --spd ",             "label":"Shared protein domains",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Other",             "name":" --other ",             "label":"Other networks",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false} ]        }         \t        ],         "output":[            {"id":"GeneManiaOutput",             "name":"*results.report*",             "switch":" ",             "order":4,             "multiplicity":"many",             "type":"File"}]}], "analyses":[    {"analysis_name":"GeneMania Query Runner",     "description":"Run a gene network prediction and write the results to a file.",     "type":"Gene Annotation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"GeneMania Query Runner",         "config":            {}}]}]}	ac12eb6c54cd74ecaacaac8ee0174f44d|	2011-07-20 14:53:46
88	{ "components": [{"location": "/usr/local2/qxpak5", "name": "PlantQxpak.py", "type": "executable"}]}		2011-07-22 15:49:46
89	{"components":[    {"name":"seq_stats2.pl",     "location":"/usr/local3/bin",     "type":"executable",     "description":"Sequence Statistics",     "version":"1.00",     "attribution":"Compute common statistics for a file of nucleotide contigs. iPlant DE version developed by Josh Stein (steinj@cshl.edu) and Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"seq_stats2.pl",     "name":"Sequence Statistics",     "type":"",     "description":"Compute on sequence statistics on a contigs file.",     "input":[        {"id":"Input",         "name":"Select a contig file to analyze:",         "description":"",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[],     "output":[        {"id":"Output",         "name":"seq_stats_out.txt",         "switch":" > ",         "order":1,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Sequence Statistics",     "description":"Compute on sequence statistics on a contigs file.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Sequence Statistics",         "config":            {}}]}]}	a6ad920c05b884d3da6b857b2f866624b|	2011-07-28 12:00:06
90	{"components":[    {"name":"seq_stats2.pl",     "location":"/usr/local3/bin/seq_stats-1.00",     "type":"executable",     "description":"Sequence Statistics",     "version":"1.00",     "attribution":"Compute common statistics for a file of nucleotide contigs. iPlant DE version developed by Josh Stein (steinj@cshl.edu) and Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"seq_stats2.pl",     "name":"Sequence Statistics",     "type":"",     "description":"Compute on sequence statistics on a contigs file.",     "input":[        {"id":"Input",         "name":"Select a contig file to analyze:",         "description":"",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[],     "output":[        {"id":"Output",         "name":"seq_stats_out.txt",         "switch":" > ",         "order":1,         "multiplicity":"single",         "type":"File"}]}], "analyses":[    {"analysis_name":"Sequence Statistics",     "description":"Compute on sequence statistics on a contigs file.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Sequence Statistics",         "config":            {}}]}]}	a6ad920c05b884d3da6b857b2f866624b|	2011-07-28 12:35:53
91	{"components":[    {"name":"seq_stats2.pl",     "location":"/usr/local3/bin/seq_stats-1.00",     "type":"executable",     "description":"Sequence Statistics",     "version":"1.00",     "attribution":"Compute common statistics for a file of nucleotide contigs. iPlant DE version developed by Josh Stein (steinj@cshl.edu) and Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"seq_stats2.pl",     "name":"Sequence Statistics",     "type":"",     "description":"Compute on sequence statistics on a contigs file.",     "input":[        {"id":"Input",         "name":"Select a contig file to analyze:",         "description":"",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[],     "output":[]     }], "analyses":[    {"analysis_name":"Sequence Statistics",     "description":"Compute on sequence statistics on a contigs file.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Sequence Statistics",         "config":            {}}]}]}	a6ad920c05b884d3da6b857b2f866624b|	2011-07-28 12:47:11
92	{ "components": [{"location": "/usr/local2/rjungle", "name": "rjungle-1.2.365-i686-pc-linux-gnu", "type": "executable"}, {"location": "/usr/local2/rjungle", "name": "rjunglesparse-1.2.365-i686-pc-linux-gnu", "type": "executable"}]}		2011-07-28 14:14:53
93	{ "components": [{"location": "/usr/local2/VBay", "name": "run_vbay.sh", "type": "executable"}]}		2011-07-28 16:14:50
94	{"components":[    {"name":"shuffleSequences_fastq.pl",     "location":"/usr/local3/bin/interlace_pairs-1.00",     "type":"executable",     "description":"Interlace Paired FASTQ files",     "version":"1.00",     "attribution":"Interlace paired-end sequences into a single file. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"shuffleSequences_fastq.pl",     "name":"Interlace Paired FASTQ files",     "type":"",     "description":"Interlace paired-end sequences into a single file.",     "input":[        {"id":"Input1",         "name":"Select Read 1 (Left) FASTQ file:",         "description":"",         "switch":" ",         "order":0,         "multiplicity":"single",         "type":"File"},        {"id":"Input2",         "name":"Select Read 2 (Right) FASTQ file:",         "description":"",         "switch":" ",         "order":1,         "multiplicity":"single",         "type":"File"} ],     "groups":[],     "output":[      {"id":"Interlaced",         "name":"Interlaced.fq",         "switch":" ",         "order":2,         "multiplicity":"single",         "type":"File"}]     }], "analyses":[    {"analysis_name":"Interlace Paired FASTQ files",     "description":"Interlace paired-end sequences into a single file.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Interlace Paired FASTQ files",         "config":            {}}]}]}	ac09eede4b40d45af81d249b547edc1ea|	2011-07-28 17:13:42
95	{ "components": [{"location": "/usr/local2/structure_linux_console2.3.3/console", "name": "structure", "type": "executable"}, {"location": "/usr/local2/SPAGeDi-1.3a-Linux-i686/bin", "name": "spagedi", "type": "executable"}]}		2011-08-02 13:28:46
96	{"components":[    {"name":"fasta_filter_length.pl",     "location":"/usr/local3/bin/fasta_filter_by_length-1.00/",     "type":"executable",     "description":"FASTA Filter By Length",     "version":"1.00",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"fasta_filter_length.pl",     "name":"FASTA Minimum Size Filter",     "type":"",     "description":"Return sequences with minimum size N.",     "input":[        {"id":"FastaSizeFilterInput",         "name":"Input File",         "switch":"-i ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"MinLength",             "name":"--min ",             "label":"Minimum Length",             "description": "",             "type":"Number",             "value":100,             "validator":                {"name":"",                 "required":true,                 "rules":[{"IntAbove":[-1]}]},             "order":1}             ]        }],                 "output":[            {"id":"FastaSizeFilterOutput",             "name":"fasta_filter_by_length_out.fa",             "switch":"-o ",             "order":3,             "multiplicity":"single",             "type":"File"}]}], "analyses":[    {"analysis_name":"FASTA Minimum Size Filter",     "description":"Extract sequences from a FASTA file larger than a specified size.",     "type":"FASTA Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"FASTA Minimum Size Filter",         "config":            {}}]}]}	a5ece6d08975b4f8dbc7f7b0b549e4444|	2011-08-03 03:23:22
97	{"components":[    {"name":"bundle.sh",     "location":"/usr/local3/bin/bundle_sequences_abyss-1.00",     "type":"executable",     "description":"ABySS-Bundle Sequences",     "version":"1.00",     "attribution":"Bundle related sequences into a library for Abyss assembler. Developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"bundle.sh",     "name":"ABySS-Bundle Sequences",     "type":"",     "description":"Bundle related sequences into a library for Abyss assembler.",     "input":[        {"id":"input",         "name":"Input Files",         "description":"Select files in the order you wish them to be added to the bundle.",         "switch":"",         "order":0,         "multiplicity":"multiple",         "type":"File"}],     "groups":[],     "output":[]     }], "analyses":[    {"analysis_name":"ABySS-Bundle Sequences",     "description":"Bundle related sequences into a library for Abyss assembler.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"ABySS-Bundle Sequences",         "config":            {}}]}]}	ac36a87a2d78c4a75994dcb5b40418b44|	2011-08-03 09:49:46
98	{"components":[    {"name":"fasta_filter_length.pl",     "location":"/usr/local3/bin/fasta_filter_by_length-1.00/",     "type":"executable",     "description":"FASTA Filter By Length",     "version":"1.00",     "attribution":"iPlant DE tool developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"fasta_filter_length.pl",     "name":"FASTA Minimum Size Filter",     "type":"",     "description":"Return sequences with minimum size N.",     "input":[        {"id":"FastaSizeFilterInput",         "name":"Input File",         "switch":"-i ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"MinLength",             "name":"--min ",             "label":"Minimum Length",             "description": "",             "type":"Number",             "value":100,             "validator":                {"name":"",                 "required":true,                 "rules":[{"IntAbove":[-1]}]},             "order":1}             ]        }],                 "output":[            {"id":"FastaSizeFilterOutput",             "name":"fasta_filter_by_length_out.fa",             "switch":"-o ",             "order":3,             "multiplicity":"single",             "type":"File"}]}], "analyses":[    {"analysis_name":"FASTA Minimum Size Filter",     "description":"Extract sequences from a FASTA file larger than a specified size.",     "type":"FASTA Manipulation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"FASTA Minimum Size Filter",         "config":            {}}]}]}	a5ece6d08975b4f8dbc7f7b0b549e4444|	2011-08-03 12:49:43
99	{"components":[    {"name":"run-genemania-query.pl",     "location":"/usr/local3/bin/genemania-query-runner-1.00/",     "type":"executable",     "description":"GeneMania Query Runner",     "version":"1.00",     "attribution":"GeneMania Query Runner <http://www.genemania.org/plugin/tools.html>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"run-genemania-query.pl",     "name":"GeneMania Query Runner",     "type":"",     "description":"Run a gene network prediction and write the results to a file.",     "input":[{"id":"geneList",         "name":"File containing a gene list",         "switch":"--genelist ",         "order":0,         "multiplicity":"single",         "type":"File"}],     "groups":[        {"id":"",         "name":"group2",         "label":"Options",         "type":"step",         "properties":[         \t{"id":"Species",         \t "order":2,         \t "label":"Select target species:",         \t "description": "",         \t "name": " --species ",         \t "value": "Arabidopsis thaliana",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["Arabidopsis thaliana"]}]},         \t "type": "ValueSelection"         \t},         \t{"id":"RelatedGeneLimit",         \t "order":2,         \t "label":"Related gene limit:",         \t "description": "",         \t "name": "--related_gene_limit ",         \t "value": 15,         \t "type": "Number"         \t },         \t{"id":"CombiningMethod",         \t "order":2,         \t "label":"Weighting Method:",         \t "description": "",         \t "name": "--combining_method ",         \t "value": "automatic",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["automatic","average", "average_category", "bp", "mf", "cc"]}]},         \t "type": "ValueSelection"         \t },         \t {"id":"OutputType",         \t "order":2,         \t "label":"Output Format:",         \t "description": "",         \t "name": "--out ",         \t "value": "flat",         \t "validator":                {"name":"",                 "required":true,                 "rules":[{"MustContain" : ["flat","genes", "xml", "scores"]}]},         \t "type": "ValueSelection"         \t }         ]        },        {"id":" ",         "name":"group3",         "label":"Networks",         "type":"step",         "properties":[            {"id":"Coexp",             "name":" --coexp ",             "label":"Co-expression",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},\t\t\t{"id":"Coloc",             "name":" --coloc ",             "label":"Empirical colocation",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Gi",             "name":" --gi ",             "label":"Genetic interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":true},            {"id":"Path",             "name":" --path ",             "label":"Pathway interactions",             "description": "",\t\t\t "order":3,             "type":"Flag",             "value":false},            {"id":"Pi",             "name":" --pi ",             "label":"Physical interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":true},            {"id":"Predict",             "name":" --predict ",             "label":"Predicted interactions",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Spd",             "name":" --spd ",             "label":"Shared protein domains",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false},            {"id":"Other",             "name":" --other ",             "label":"Other networks",             "description": "",             "type":"Flag",\t\t\t "order":3,             "value":false} ]        }         \t        ],         "output":[            {"id":"GeneManiaOutput",             "name":"*results.report*",             "switch":" ",             "order":4,             "multiplicity":"many",             "type":"File"}]}], "analyses":[    {"analysis_name":"GeneMania Query Runner",     "description":"Run a gene network prediction and write the results to a file.",     "type":"Gene Annotation",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"GeneMania Query Runner",         "config":            {}}]}]}	ac12eb6c54cd74ecaacaac8ee0174f44d|	2011-08-04 08:53:51
100	{"components":[    {"name":"cuffcompare.pl",     "location":"/usr/local3/bin/cuffcompare-1.00/",     "type":"executable",     "description":"Cuffcompare",     "version":"1.00",     "attribution":"Cuffcompare <http://cufflinks.cbcb.umd.edu/manual.html#cuffcompare>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"cuffcompare.pl",     "name":"Cuffcompare",     "type":"",     "description":"Compare your assembled transcripts to a reference annotation and track Cufflinks transcripts across multiple experiments.",     "input":[     {"id":"GTFList",         "name":"Select one or more Cufflinks GTF files",         "switch":" ",         "order":0,         "multiplicity":"multiple",         "type":"File"},     {                           "id": "C851957F-C237-639A-880B-1FE557600FD9",                           "name": "Select reference genome annotation -or-",                           "multiplicity": "One",                           "type": "Input File",                           "cmdSwitch": "--cannedReference=",                           "order": -1,                           "file_info_type_id": "68246DDF-8B1B-44C0-827F-88945CAD8227",                           "file_info_type": "ReferenceAnnotation",                           "output_filename": "",                           "format_id": [],                           "format": [],                           "required": false                  },                  {                           "id": "9AAC817E-F909-66E1-9CD6-1CC49971C502",                           "name": "Select a user-defined GTF annotation",                           "multiplicity": "One",                           "type": "Input File",                           "cmdSwitch": "--userReference=",                           "order": -1,                           "file_info_type_id": "13313A72-EA0A-49DF-9105-AF798165A482",                           "file_info_type": "GenomicAnnotation",                           "output_filename": "",                           "format_id": [],                           "format": [],                           "required": false                  }         ],     "groups":[\t\t{"id":" ",\t\t"name":"group1",\t\t"label":"Options",\t\t"type":"step",\t\t"properties":[\t\t\t{\t\t\t"id": "FEA0B90D-7E7C-C3E3-F475-5A53EC57E5AA",\t\t\t"name": "-R ",\t\t\t"label": "Ignore reference transcripts not covered by query files",\t\t\t"description": "",\t\t\t"type": "Flag",\t\t\t"isVisible": true,\t\t\t"value": "false",\t\t\t"order": -2\t\t\t},\t\t\t{\t\t\t"id": "35E78F5C-FE81-8950-49B9-03977BD75201",\t\t\t"name": "-C ",\t\t\t"label": "Enables the \\"contained\\" transcripts to be also written to a file.",\t\t\t"description": "",\t\t\t"type": "Flag",\t\t\t"isVisible": true,\t\t\t"value": "false",\t\t\t"order": -2\t\t\t},\t\t\t{\t\t\t"id": "547F82BA-B2C6-DE96-C76D-E309A34973FC",\t\t\t"name": "-o=",\t\t\t"label": "Prefix for cuffcompare outputs",\t\t\t"description": "",\t\t\t"type": "Text",\t\t\t"isVisible": true,\t\t\t"value": "cuffcmp",\t\t\t"order": -2\t\t\t}         ]}],         "output":[]         }], "analyses":[    {"analysis_name":"Cuffcompare",     "description":"Compare your assembled transcripts to a reference annotation and track Cufflinks transcripts across multiple experiments.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"Cuffcompare",         "config":            {}}]}]}	a21206ad98d4f4f3aacc9db5fdc8a3808|	2011-08-04 10:25:37
101	{"components":[    {"name":"cuffdiff.pl",     "location":"/usr/local3/bin/cuffdiff-1.00/",     "type":"executable",     "description":"CuffDiff",     "version":"1.00",     "attribution":"CuffDiff <http://cufflinks.cbcb.umd.edu/manual.html#cuffcompare>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"cuffdiff.pl",     "name":"CuffDiff",     "type":"",     "description":"Find significant changes in transcript expression, splicing, and promoter use.",     "input":[        {"id":"BAMList",         "name":"Select one or more Tophat SAM/BAM files",         "switch":" ",         "order":0,         "multiplicity":"multiple",         "type":"File"},        {"id":"cannedGTF",         "name":"Select reference genome annotation:",         "multiplicity":"One",         "type":"Input File",         "cmdSwitch":"--cannedReference=",         "order":-1,         "file_info_type_id":"68246DDF-8B1B-44C0-827F-88945CAD8227",         "file_info_type":"ReferenceAnnotation",         "output_filename":"",         "format_id":[],         "format":[],         "required":true},        {"id":"fragmentBiasCorrect",         "name":"Select reference genome to correct for fragment bias (optional):",         "multiplicity":"One",         "type":"Input File",         "cmdSwitch":"--frag-bias-correct=",         "order":-1,         "file_info_type_id":"13313A72-EA0A-49DF-9105-AF798165A482",         "file_info_type":"ReferenceSequence",         "output_filename":"",         "format_id":[],         "format":[],         "required":false},        {"id":"maskFile",         "name":"Specify a mask file (optional)",         "switch":"--mask-file=",         "order":-1,         "multiplicity":"One",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"num_threads",             "name":"--num-threads=",             "label":"Number of threads",             "description":"",             "type":"Number",             "isVisible":false,             "value":6,             "order":-2},            {"id":"time_series",             "name":"--time-series ",             "label":"Treat sample files as a time series",             "description":"Samples should be provided in increasing time order.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"upper_quartile_norm",             "name":"--upper-quartile-norm ",             "label":"Upper quartile normalization",             "description":"Normalizes by the upper quartile of the number of fragments mapping to individual loci.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"library_size_norm",             "name":"",             "label":"Library size estimation for normalization",             "description":"",             "type":"Selection",             "isVisible":true,             "value":"1",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"MustContain":[                        {"display":"Normalize by total hits",                         "value":"--total-hits-norm ",                         "isDefault":false},                        {"display":"Normalize by hits to known transcripts",                         "value":"--compatible-hits-norm ",                         "isDefault":true}]}]},             "order":-2},            {"id":"multi_read_correct",             "name":"--multi-read-correct ",             "label":"Perform multiple-hit correction",             "description":"Do an initial estimation procedure to more accurately weight reads mapping to multiple locations in the genome",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"FDR",             "name":"--FDR=",             "label":"False Discovery Rate",             "description":"The allowed false discovery rate (FDR)",             "type":"Number",             "isVisible":true,             "value":"0.05",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"MustContain":[                        {"display":0,                         "value":"",                         "isDefault":false}]},                    {"DoubleRange":[0,1]}]},             "order":-2},            {"id":"473E403D-3FAD-2E5A-5FA5-FEE820BBD857",             "name":"--min-alignment-count=",             "label":"Minimum per-locus counts for significance testing",             "description":"The minimum number of alignments in a locus for needed to conduct significance testing on changes in that locus observed between samples",             "type":"Number",             "isVisible":true,             "value":"10",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"IntAbove":[0]}]},             "order":-2}]}],     "output":[]}], "analyses":[    {"analysis_name":"CuffDiff",     "description":"Find significant changes in transcript expression, splicing, and promoter use.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"CuffDiff",         "config":            {}}]}]}	af615bf214d9c4253828a20d5868b2ec4|	2011-08-04 15:54:42
102	{"components":[    {"name":"cuffdiff.pl",     "location":"/usr/local3/bin/cuffdiff-1.00/",     "type":"executable",     "description":"CuffDiff",     "version":"1.00",     "attribution":"CuffDiff <http://cufflinks.cbcb.umd.edu/manual.html#cuffcompare>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"cuffdiff.pl",     "name":"CuffDiff",     "type":"",     "description":"Find significant changes in transcript expression, splicing, and promoter use.",     "input":[        {"id":"BAMList",         "name":"Select one or more Tophat SAM/BAM files",         "switch":" ",         "order":0,         "multiplicity":"multiple",         "type":"File"},        {"id":"cannedGTF",         "name":"Select reference genome annotation:",         "multiplicity":"One",         "type":"Input File",         "cmdSwitch":"--cannedReference=",         "order":-1,         "file_info_type_id":"68246DDF-8B1B-44C0-827F-88945CAD8227",         "file_info_type":"ReferenceAnnotation",         "output_filename":"",         "format_id":[],         "format":[],         "required":true},        {"id":"fragmentBiasCorrect",         "name":"Select reference genome to correct for fragment bias (optional):",         "multiplicity":"One",         "type":"Input File",         "cmdSwitch":"--frag-bias-correct=",         "order":-1,         "file_info_type_id":"13313A72-EA0A-49DF-9105-AF798165A482",         "file_info_type":"ReferenceSequence",         "output_filename":"",         "format_id":[],         "format":[],         "required":false},        {"id":"maskFile",         "name":"Specify a mask file (optional)",         "switch":"--mask-file=",         "order":-1,         "required":false,         "multiplicity":"One",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"num_threads",             "name":"--num-threads=",             "label":"Number of threads",             "description":"",             "type":"Number",             "isVisible":false,             "value":6,             "order":-2},            {"id":"time_series",             "name":"--time-series ",             "label":"Treat sample files as a time series",             "description":"Samples should be provided in increasing time order.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"upper_quartile_norm",             "name":"--upper-quartile-norm ",             "label":"Upper quartile normalization",             "description":"Normalizes by the upper quartile of the number of fragments mapping to individual loci.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"library_size_norm",             "name":"",             "label":"Library size estimation for normalization",             "description":"",             "type":"Selection",             "isVisible":true,             "value":"1",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"MustContain":[                        {"display":"Normalize by total hits",                         "value":"--total-hits-norm ",                         "isDefault":false},                        {"display":"Normalize by hits to known transcripts",                         "value":"--compatible-hits-norm ",                         "isDefault":true}]}]},             "order":-2},            {"id":"multi_read_correct",             "name":"--multi-read-correct ",             "label":"Perform multiple-hit correction",             "description":"Do an initial estimation procedure to more accurately weight reads mapping to multiple locations in the genome",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"FDR",             "name":"--FDR=",             "label":"False Discovery Rate",             "description":"The allowed false discovery rate (FDR)",             "type":"Number",             "isVisible":true,             "value":"0.05",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"MustContain":[                        {"display":0,                         "value":"",                         "isDefault":false}]},                    {"DoubleRange":[0,1]}]},             "order":-2},            {"id":"473E403D-3FAD-2E5A-5FA5-FEE820BBD857",             "name":"--min-alignment-count=",             "label":"Minimum per-locus counts for significance testing",             "description":"The minimum number of alignments in a locus for needed to conduct significance testing on changes in that locus observed between samples",             "type":"Number",             "isVisible":true,             "value":"10",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"IntAbove":[0]}]},             "order":-2}]}],     "output":[]}], "analyses":[    {"analysis_name":"CuffDiff",     "description":"Find significant changes in transcript expression, splicing, and promoter use.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"CuffDiff",         "config":            {}}]}]}	af615bf214d9c4253828a20d5868b2ec4|	2011-08-04 16:30:30
103	{"components":[    {"name":"cuffdiff.pl",     "location":"/usr/local3/bin/cuffdiff-1.00/",     "type":"executable",     "description":"CuffDiff",     "version":"1.00",     "attribution":"CuffDiff <http://cufflinks.cbcb.umd.edu/manual.html#cuffcompare>. iPlant DE version developed by Matt Vaughn (vaughn at iplantcollaborative dot org)."}], "templates":[    {"component_ref":"cuffdiff.pl",     "name":"CuffDiff",     "type":"",     "description":"Find significant changes in transcript expression, splicing, and promoter use.",     "input":[        {"id":"BAMList",         "name":"Select one or more Tophat SAM/BAM files",         "switch":" ",         "order":0,         "multiplicity":"multiple",         "type":"File"},        {"id":"cannedGTF",         "name":"Select reference genome annotation:",         "multiplicity":"One",         "type":"Input File",         "cmdSwitch":"--cannedReference=",         "order":-1,         "file_info_type_id":"68246DDF-8B1B-44C0-827F-88945CAD8227",         "file_info_type":"ReferenceAnnotation",         "output_filename":"",         "format_id":[],         "format":[],         "required":true},        {"id":"fragmentBiasCorrect",         "name":"Select reference genome to correct for fragment bias (optional):",         "multiplicity":"One",         "type":"Input File",         "cmdSwitch":"--frag-bias-correct=",         "order":-1,         "file_info_type_id":"13313A72-EA0A-49DF-9105-AF798165A482",         "file_info_type":"ReferenceSequence",         "output_filename":"",         "format_id":[],         "format":[],         "required":false},        {"id":"maskFile",         "name":"Specify a mask file (optional)",         "switch":"--mask-file=",         "order":-1,         "required":false,         "multiplicity":"One",         "type":"File"}],     "groups":[        {"id":" ",         "name":"group1",         "label":"Options",         "type":"step",         "properties":[            {"id":"num_threads",             "name":"--num-threads=",             "label":"Number of threads",             "description":"",             "type":"Number",             "isVisible":false,             "value":6,             "order":-2},            {"id":"label_names",             "name":"--label=",             "label":"Comma-delimited list of sample names",             "description":"One entry per BAM or SAM file in the file select box",             "type":"Text",             "isVisible":true,             "required":true,             "value":"RNA1,RNA2...",             "order":-2},             {"id":"time_series",             "name":"--time-series ",             "label":"Treat sample files as a time series",             "description":"Samples should be provided in increasing time order.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"upper_quartile_norm",             "name":"--upper-quartile-norm ",             "label":"Upper quartile normalization",             "description":"Normalizes by the upper quartile of the number of fragments mapping to individual loci.",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"library_size_norm",             "name":"",             "label":"Library size estimation for normalization",             "description":"",             "type":"Selection",             "isVisible":true,             "value":"1",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"MustContain":[                        {"display":"Normalize by total hits",                         "value":"--total-hits-norm ",                         "isDefault":false},                        {"display":"Normalize by hits to known transcripts",                         "value":"--compatible-hits-norm ",                         "isDefault":true}]}]},             "order":-2},            {"id":"multi_read_correct",             "name":"--multi-read-correct ",             "label":"Perform multiple-hit correction",             "description":"Do an initial estimation procedure to more accurately weight reads mapping to multiple locations in the genome",             "type":"Flag",             "isVisible":true,             "value":"false",             "order":-2},            {"id":"FDR",             "name":"--FDR=",             "label":"False Discovery Rate",             "description":"The allowed false discovery rate (FDR)",             "type":"Number",             "isVisible":true,             "value":"0.05",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"MustContain":[                        {"display":0,                         "value":"",                         "isDefault":false}]},                    {"DoubleRange":[0,1]}]},             "order":-2},            {"id":"473E403D-3FAD-2E5A-5FA5-FEE820BBD857",             "name":"--min-alignment-count=",             "label":"Minimum per-locus counts for significance testing",             "description":"The minimum number of alignments in a locus for needed to conduct significance testing on changes in that locus observed between samples",             "type":"Number",             "isVisible":true,             "value":"10",             "validator":                {"id":"",                 "name":"",                 "label":"",                 "description":"",                 "type":"",                 "isVisible":true,                 "required":true,                 "rules":[                    {"IntAbove":[0]}]},             "order":-2}]}],     "output":[]}], "analyses":[    {"analysis_name":"CuffDiff",     "description":"Find significant changes in transcript expression, splicing, and promoter use.",     "type":"NGS",     "steps":[        {"name":"step_1",         "description":"",         "template_ref":"CuffDiff",         "config":            {}}]}]}	af615bf214d9c4253828a20d5868b2ec4|	2011-08-04 17:09:27
\.


--
-- Data for Name: info_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY info_type (hid, id, name, label, description, deprecated, display_order) FROM stdin;
4	212907C0-736E-4DBE-B6E7-5DC0431C275F	ReconcileTaxa	Reconciled Taxonomy Information	\N	f	999
6	0E3343E3-C59A-44C4-B5EE-D4501EC3A898	ReferenceGenome	Reference Sequence and Annotations	\N	f	999
7	57EB7FB6-BDC0-42AA-B494-0483F9347815	ReferenceSequence	Reference Sequence Only	\N	f	999
8	68246DDF-8B1B-44C0-827F-88945CAD8227	ReferenceAnnotation	Reference Annotation Only	\N	f	999
1	97D8CCF7-7242-4038-942C-235F2291AB6C	ACEField	Reconciled Tree and Trait Information for CACE and DACE	\N	t	999
2	CA9ADDE4-AB94-4A40-8C2F-C0B814156298	ContrastField	Reconciled Tree and Trait Informaiton for Independent Contrast	\N	t	999
5	E819FF9A-7398-4DF9-8191-0F5AFBBE5CA3	ReferenceDummyGenes	Fake Reference Genome for the Cufflinks Post-Processing Step	\N	t	999
3	0900E992-3BBD-4F4B-8D2D-ED289CA4E4F1	File	Unspecified	\N	f	1
9	762E5A0A-AFB2-420E-8456-F79C78A29051	SequenceAlignment	Sequence Alignment	\N	f	999
10	F65A8F23-3E46-4DF4-80F9-387641C013A6	MultipleSequenceAlignment	Multiple Sequence Alignment	\N	f	999
11	4A56F043-C62F-4FE9-A11F-A9A7D18E370F	BarcodeFile	Barcode File	\N	f	999
12	DD178256-CE77-41B0-A785-7E955799A20D	ExpressionData	Expression Data	\N	f	999
13	13313A72-EA0A-49DF-9105-AF798165A482	GenomicAnnotation	Genomic Annotation	\N	f	999
14	D4089473-139E-4345-9CA9-ADDCFC4B887E	BiologicalModel	Biological Model	\N	f	999
15	1C59C759-9CD3-4036-B7B4-82E8DA40D0C2	NucleotideOrPeptideSequence	Nucleotide or Peptide Sequence	\N	f	999
16	3B4FC426-290A-4F63-ADB4-75A60A43B420	Structure	Structure	\N	f	999
17	A378CA30-28C9-4179-8381-EC098A89D12B	TraitFile	Trait File	\N	f	999
18	7BDA7EF9-7B25-43DA-93D3-A6C483FD24E4	TreeFile	Tree File	\N	f	999
19	F1A9CE39-B83D-4820-909E-583F76BC5EBE	VariantData	Variant Data	\N	f	999
20	F51BAAE3-4368-4814-BCA0-78BAD9906445	Archive	Archive	\N	f	999
21	57BD5BA7-C899-4D50-8676-A3CD56E68F8A	Binary	Binary	\N	f	999
22	3B07F544-86A6-459E-B46A-BA53E6A37F33	TabularData	Tabular Data	\N	f	999
23	D433BEE7-BFDE-4696-A2B8-EB2B92AC0E13	GraphFile	Graph File	\N	f	999
24	6270AB49-D6B6-4D8C-B15A-89657B4227A4	PlainText	Plain Text	\N	f	999
25	15696BC7-F712-43F3-9910-150B53272841	StructuredText	Structured Text	\N	f	999
26	D106C3F9-93B5-4146-AAF0-727A0E8D8A50	Image	Image	\N	f	999
\.


--
-- Data for Name: input_output_mapping; Type: TABLE DATA; Schema: public; Owner: -
--

COPY input_output_mapping (hid, source, target) FROM stdin;
1	2	3
2	3	4
3	4	5
4	5	6
5	4	6
6	9	10
\.

--
-- Data for Name: multiplicity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY multiplicity (hid, id, name, label, description, type_name) FROM stdin;
0	F137B03F-A685-4D4F-ADCA-391A6D57BDFA	many	Many		MultiFileSelector
1	AE1D0568-2F11-4624-B8F1-220E77F14AF7	single	Single		FileInput
2	57C3C939-FB72-4E89-8D6F-E01A5A336445	collection	Folder		FolderInput
\.

--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notification (hid, id, name, sender, type) FROM stdin;
1	temporary_id	temporary_name	contrastStep_tree	updateData
2	temporary_id	temporary_name	dace_tree	updateData
3	temporary_id	temporary_name	cace_tree	updateData
\.


--
-- Data for Name: notification_set; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notification_set (hid, id, name, template_id) FROM stdin;
1	nbe7d4732cf484ce2a3e594fcd0c17d75		a35f5afa532454d5c900ba40b1a04d83c
2	n09e47ef621cf44099e9a44daaef641e5		a4068abfb78af40f496917cc4916383f1
3	n505d5dc2e79d4fbe85246e142ffb60f2		ac6c8e153504c438ea462b41d8f8e98b0
\.


--
-- Data for Name: notification_set_notification; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notification_set_notification (notification_set_id, notification_id, hid) FROM stdin;
1	1	0
2	2	0
3	3	0
\.


--
-- Data for Name: notifications_receivers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY notifications_receivers (notification_id, receiver, hid) FROM stdin;
1	contrastStep_reconciletaxa	0
2	dace_reconciletaxa	0
3	cace_reconciletaxa	0
\.


--
-- Data for Name: parent_template_child_template; Type: TABLE DATA; Schema: public; Owner: -
--

COPY parent_template_child_template (parent_id, child_id, hid) FROM stdin;
\.


--
-- Data for Name: precedence_constraint; Type: TABLE DATA; Schema: public; Owner: -
--

COPY precedence_constraint (hid, id, name, description, type) FROM stdin;
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: -
--

COPY property (hid, id, name, description, label, defalut_value, is_visible, ordering, property_type, validator) FROM stdin;
153	BB029A39-CF3B-767D-4E83-576569F1488F	-seqtype Auto, -seqtype DNA, -seqtype Protein		Sequence Type	0	t	0	8	112
154	72DA528E-EEC7-42CB-AC29-444CE9366CF8	-d aa, -d nt		Sequence Type	0	t	0	8	113
155	55EEA9CB-DBEC-A83C-42AB-74F3E5EB3A25	-t 		title(without space)	mylibrary	t	0	12	\N
156	420B192D-D64A-29A3-32A7-1674F6F5A18E	-p		check to output in PostScript; default is PNG.	false	t	0	5	\N
157	46471484-6508-5C59-5A55-F35730DED17C	-t		title(without space)	mylibrary	t	0	12	\N
158	49A8DDCD-2438-537C-CD68-25682657186C	-p		check to output in PostScript; default is PNG. 	false	t	0	5	\N
159	9D4E8A03-E5B9-5C7C-1B65-49A43215F7A8	-Q		score	33	t	0	12	114
160	086D4058-E595-0E47-8632-B5A76F2BE315	-a fL, -a cCPL, -a both		which mode		t	2	8	115
161	782990D1-E39B-DC60-129F-D1AF8F7753C0	-l 		user entered lambda (or delete 0 value if finding lambda))	0	t	4	1	\N
162	25DD66D1-4163-CFAF-C247-7DDCFE0F9205	-s 		sequence length (or delete 0 if using defaults)	0	t	5	1	\N
163	C5F26CED-8BDA-BDD7-9F05-58143E277EEE			save tree	true	t	6	5	\N
164	5637C0A5-1805-B7C2-1FCA-B7FEFDD6191C			Parameter 1	1	t	2	12	\N
168	085F8C03-71C7-3DAD-1B3D-428E91565A07			Choose model (brown=Brownian motion, ou1=OU model with a single global mean, ousm=OU model with different means for each state)	brown	t	4	12	118
169	5EF2A66D-BF70-49D1-4431-B7E18371DAEA	-s 		source field in gff	vcf	t	0	12	\N
170	BCEA4C35-CE7F-A04D-4EC1-F4BC4EC624B5	-t 		type field in gff	sequence_feature	t	0	12	\N
171	C6FFA30F-C474-C9B7-9970-763D4A974004	-c MGSA, -c Parent-Child-Intersection, -c Parent-Child-Union, -c Term-For-Term, -c Topology-Elim, -c Topology-Weighted		algorithm	0	t	0	8	119
172	120CE668-3B04-FA73-B14E-1463873490BF	-i 		ignore genes with no association in the calculation	false	t	0	5	\N
173	B5C2B058-1A89-82A9-266F-0118567D7722	-o 		output dir		t	0	12	\N
174	84215B50-075E-8B91-FF9A-9A78C81CE2F1	-d 		dot file output 0-0.5	0	t	0	1	120
1246	2D48ACBD-9BDF-8FA2-A21D-9160A61BF453	-f 		Enter first base to keep	1	t	1	1	403
1247	14159CD2-0E43-F2CE-72F2-6D453AA77D30	-l 		Enter last base to keep:	36	t	2	1	404
208	0E699CB6-E8F6-A1F2-A5C7-24843F665F08	-t 		Trait selction	1	t	0	1	\N
209	935D5409-990E-E9C8-9AF8-8FA4774D2669	-r 		Number of permutations 	0	t	0	1	\N
210	D2CEAC23-5E1F-68C8-FEE8-2957A1EE5A4C	-A 		Parameter 3	on	f	0	12	\N
1248	96958B55-D070-7A93-E660-C73E825B8013	-Q 33 		FASTQ data is in Sanger (PHRED33) format	false	t	3	5	\N
214	8638874F-E0FB-C1D6-86C8-739E7D40A04D	--foobar		Foobar parameter	35	t	0	1	140
215	E4C2725A-03BE-AB28-10EC-DDB6B587AA73	-M 0,-M 1,-M 2		Model Selection	0	t	0	8	141
216	C0F0BC68-085E-35DD-39AD-8EF15EEC1A4F	-t 		Trait Number	1	t	0	1	142
217	F6158BFB-BE92-890E-7D29-50B509122910	-u 		Maximum Number of Steps	100	t	0	1	143
218	D3BA2F18-DEC8-FD88-49E6-31377F3EDB29	-A on,-A off		Automatic	0	f	0	8	144
236	461FC20C-1D06-341D-C4BC-8EBA7ABA2BDD	-w 		Window Size for Model 6 (cM)	10.0	t	0	1	\N
237	CAB5B133-57B4-62E0-DD09-AEA31D75E8E5	-I 		Hypothesis Test	1	t	0	1	\N
238	7AAED0CA-2A9C-FD86-CC71-66247F6EFBDA	-A on,-A off		Parameter 8	0	t	0	8	151
239	E8846DFA-E359-B21D-6BC5-3D251C7D22C6	-t 		Trait to Analyze	1	t	0	1	\N
240	218A4A1C-1F41-313D-B949-5F9EBE63139B	-q 		Maximum Number of QTL to Fit	19	t	0	1	\N
241	E059459A-24DC-AF5D-7C35-4AA5BE23883F	-k 		Maximum Number of Epistatic Interactions	19	t	0	1	\N
242	23264103-D39C-BB97-A387-EBAE18C3BF69	-d 		Walking Speed (cM)	2.0	t	0	1	\N
243	CB8B7FC9-7E7E-6205-8AC6-ED2C055415AB	-S 		Information Criterion	1	t	0	1	\N
244	BAECDABA-2249-F8E0-7E38-08A6A35931AB	-L 		Threshold for Adding/Dropping Parameters	0	t	0	1	\N
245	1E9B0C6E-1A3C-AC41-FF7A-3674C1264FAA	-I 		Work Code	smprtSeC	t	0	12	\N
246	6295BCFB-BE1D-A162-B98B-7502C7F4F17F	-p 		Phase of Analysis	0	t	0	1	\N
370	LastLines		Extract first N lines from the input file.	Extract first N lines	1	t	1	1	187
378	File1Column				1	t	7	1	192
379	File2Column				9	t	1	1	193
380	JoinType			Type of Join:		t	1	9	194
381	Delimiter			Delimiter character:	tab	t	4	12	195
382	Case Insensitive	 -i 			false	t	5	5	\N
383	Empty String Filler				false	f	3	12	\N
384	Output Format				false	f	2	12	\N
392	LastLines		Extract last N lines from the input file.	Extract last N lines	1	t	1	1	198
393	PrefixLinesByCount	 -c 		Prefix lines by number of occurrences	false	t	1	5	199
394	OnlyPrintDuplicateLines	 -d 		Only report duplicate lines	false	t	1	5	200
395	IgnoreCase	 -i 		Ignore differences in case	true	t	1	5	201
396	UniqueOnly	 -u 		Only report unique lines	false	t	1	5	202
397	SkipFields	 -f 		Avoid comparing the first N fields	0	t	0	1	203
219	D926FF08-84C1-3F07-5A3E-C99ED2FAC62D	-t		Parameter 1	50	t	0	1	145
247	6F526E43-1E61-83DC-C98B-474CA046C068	-H		Hypothesis Testing	10	t	0	1	\N
248	DC455EC8-11C6-DB69-D9DE-9D55D0B03FD7	-S 		Significance Threshold	3.84	t	0	1	\N
249	0FE5A4D9-43E1-F288-0C3A-B8D8F1F5B6DE	-a 		Alternative Threshold	0.05	t	0	1	\N
250	4E921136-0148-18FC-8E1C-32362DC645F7	-L 		LR or LOD	0	t	0	1	\N
251	42270978-124B-0A7A-9779-395466AED56E	-I 		Work Code	ZM	t	0	12	\N
1252	34ECA570-8B9D-D4B7-7C15-5642064F4DC4	-a 		Enter the adapter string to clip	CCTTAAGG	t	1	10	407
1253	3FFBD572-A4BE-6E26-646C-F2AA4C6F3EAD	-l 		Discard sequences shorter than this many nucleotides	5	t	2	1	408
1254	8D89A02C-1B76-A056-F772-54D08CF9B8D8	-d 		Keep the adapter and this many bases after it. Zero indicates no adapter sequence to be kept.	0	t	3	1	\N
1255	508841BE-2F76-EF00-74C6-000AA507431F	-c 		Keep only sequences which contained the adapter	false	t	4	5	\N
1046	63CA491E-69AA-218C-17CA-FAEF472646D0	-T 		Transition/Transversion Ratio	2.00	t	0	1	\N
1047	37CD6CBD-2242-7F9F-3C36-6791AC07DD4D	-O 		Outgroup Root on Species N	1	t	0	1	\N
1048	122F1BAB-7475-E462-5E88-DE2DC4E722D4	-I 		Sequences Interleaved	true	t	0	5	\N
1049	94432C46-B60A-73B7-D453-FF18AF925C76	-D F84, -D 'Kimura 2-parameter',  -D Jukes-Cantor, -D LogDet, -D 'Similarity table'		Distance Method	0	t	0	8	326
340	sraFTPURL			Enter full SRA FTP URL	ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/litesra/SRX/SRX000/SRX000348	t	0	12	172
341	DirectoryName			Directory Name	SRA-Import	f	1	12	173
348	Columns		Columns are specified as c1, c2, and so on. Column count begins with 1. Columns can be specified in any order (e.g., c2,c1,c6). If you specify more columns than are actually present, empty spaces will be filled with dots.	Enter Comma-separated List Columns to Extract ie. c1,c2,c3		t	1	12	180
349	Delimiter	 		Column Delimiter	Tab	t	2	9	181
364	FindPattern			Find Pattern		t	2	12	186
365	Color				NOCOLOR	f	3	12	\N
366	CaseInsensitive	-i 	Ignore case when searching.	Case insenstive search	false	t	4	5	\N
367	LinesAfter	-A 	Return N lines after match.	Lines after match	0	t	5	1	\N
368	LinesBefore	-B 	Return N lines before match.	Lines before match	0	t	5	1	\N
369	InvertMatch	-v 	Return lines that DON'T match the pattern.	Invert match	false	t	4	5	\N
399	NoGroup	--nogroup 	Turn off the dynamic grouping of bases in the various per-base plots.  This would allow you to see a result for each base of a 100bp run for example.	Turn off the dynamic grouping of bases	1	t	1	5	\N
177	DCF342F3-F60A-31A4-8F14-5A2AEBC4C297	-m 		Model	\N	t	0	12	\N
197	9DF04AB4-5C71-3D78-59AA-58E820450F17	-T		Transition/transversion ratio	2.0000	t	0	1	\N
198	3D9FFE4F-1280-890D-5868-54FED31A30EB	-F		User-defined base frequencies	false	t	0	5	\N
199	5DBA46B9-692F-E213-1EFE-4D2F48542A35	-f		Base frequencies (A,C,G,T/U)	0.25 0.25 0.25 0.25	t	0	10	\N
200	708758B1-EA8D-3121-C2C3-48ED150FE4BB	-S yes, -S no		Speedier but rougher analysis	0	t	0	8	132
201	27F60385-13F5-AC9B-BBDB-10C7A1E5D9BE	-G yes, -G no		Global rearrangements	1	t	0	8	133
202	502C2DD1-6008-69C6-9DB7-1CA867A632F2	-J		Number of time to jumble input order 	0	t	0	11	134
203	8C0E18A9-F782-0241-3767-46E3FC6E8EDB	-0		Outgroup root	1	t	0	1	\N
204	D40302D7-C945-C7DC-17C4-8BB12B3D6138	-I yes, -I no		Input sequences interleaved	0	t	0	8	135
205	36F398BE-8066-1BF0-EE2B-4003C5321C5E	-5 yes, -5 no		Reconstruct hypothetical sequences	1	t	0	8	136
220	4AB4F19B-A237-47FC-0F70-F2307ECF665C	-t		my param	50	t	0	1	146
221	8327CD95-BBCD-54BA-88EE-CD9F0D6CA4FD	-s		Parameter 2	test	t	0	12	\N
222	9DAA724D-C998-4A6A-D2F8-910AF1E92699	-t 		Trait Selection	1	t	0	1	147
223	D82967E3-5362-F39C-CDAC-505981AA7872	-M 		Model Selection	3	t	0	12	\N
224	32642B27-37A8-683B-F7E7-78E569B343CF	-c 		Chromosome	0	t	0	1	\N
225	0306E5CC-A254-BCD9-834B-A39D660E8E4C	-d 		Walking Speed (cM)	2.0	t	0	1	\N
226	632DEBBD-D2AD-1EA5-0A05-AA4648BAEA15	-n 		Number of Background Parameters	5	t	0	1	\N
227	2D719595-B4AC-84BA-1139-92B051D7E742	-w 		Window Size (cM)	10.0	t	0	1	\N
228	F9C4AB11-A5D6-E585-D60C-E6EF479D5587	-r 		Permutations	0	t	0	1	148
1	script		\N		 /usr/local2/bin/reconcile_pair_end_files.pl 	f	0	3	\N
2	minAnchorLength	 --min-anchor-length 	\N	Anchor length:	8	t	1	1	1
3	spliceMismatches	 --splice-mismatches 	\N	Splice mismatches:	0	t	1	1	2
4	minIntronLength	 --min-intron-length 	\N	Minimum intron length:	70	t	1	1	3
5	maxIntronLength	 --max-intron-length 	\N	Maximum intron length:	500000	t	1	1	4
6	qualityScale	 --solexa-quals , --solexa1.3-quals , --integer-quals 	\N	Select input quality scale:	1	t	1	8	5
7	minIsoformFraction	 --min-isoform-fraction 	\N	Minimum isoform fraction:	0.15	t	1	1	6
60	mode		\N	mode	 varFilter 	f	2	4	\N
8	numberOfParallelThreads	 --num-threads 	\N	Number of threads to launch:	2	t	1	1	7
9	maxMultiHits	 --max-multihits 	\N	Allow this many hits per read:	40	t	1	1	8
10	minIsoformFraction	 --min-isoform-fraction 	\N	Minimum isoform fraction:	0.15	t	1	1	9
11	microExonSearch	 --microexon-search 	\N	Look for reads incident to microexons:	false	t	1	5	10
12	butterflySearch	 --butterfly-search 	\N	Use a slower but more sensitive algorithm	false	t	1	5	11
13	libraryType	 --library-type fr-unstranded , --library-type fr-firststrand , --library-type fr-secondstrand 	\N	Select library type:	0	t	1	8	12
14	segmentMismatches	 --segment-mismatches 	\N	Segment mismatches:	2	t	1	1	13
15	segmentLength	 --segment-length 	\N	Segment subdivide length:	25	t	1	1	14
16	minClosureExon	 --min-closure-exon 	\N	Length of exonic hops in splice graph:	50	t	1	1	15
17	minClosureIntron	 --min-closure-intron 	\N	Minimum intron length found during closure search:	50	t	1	1	16
18	maxClosureIntron	 --max-closure-intron 	\N	Maximum intron length found during closure search:	5000	t	1	1	17
19	minCoverageIntron	 --min-coverage-intron 	\N	Minimum intron length found during coverage search:	50	t	1	1	18
20	maxCoverageIntron	 --max-coverage-intron 	\N	Maximum intron length found during coverage search:	20000	t	1	1	19
21	minSegmentIntron	 --min-segment-intron 	\N	Minimum intron length found during split-segment search:	50	t	1	1	20
22	maxSegmentIntron	 --max-segment-intron 	\N	Maximum intron length found during split-segment search:	500000	t	1	1	21
23	keepTemp	 --keep-tmp 	\N	Preserve intermediate files from TopHat	false	t	1	5	22
24	noNovelJunctions	 --no-novel-juncs 	\N	Only inspect junctions specified in reference annotation:	false	t	1	5	23
25	meanInnerDist	 --mate-inner-dist 	\N	Expected (mean) inner distance between mate pairs:	200	t	1	1	24
26	script		\N		 /usr/local2/bin/run_tophat.sh 	f	0	3	\N
27	minAnchorLength	 --min-anchor-length 	\N	Anchor length:	8	t	1	1	25
28	spliceMismatches	 --splice-mismatches 	\N	Splice mismatches:	0	t	1	1	26
29	minIntronLength	 --min-intron-length 	\N	Minimum intron length:	70	t	1	1	27
30	maxIntronLength	 --max-intron-length 	\N	Maximum intron length:	500000	t	1	1	28
31	qualityScale	 --solexa-quals , --solexa1.3-quals , --integer-quals 	\N	Select input quality scale:	1	t	1	8	29
229	FB695E6A-2AA3-8901-FBBF-44FB1549AE92	-b 		Number of Bootstraps	0	t	0	1	\N
230	BD95CE88-EDF2-8FC4-3812-DB9F661C87A4	-A on,-A off		Automatic Mode	0	t	0	12	149
231	25AFBD77-A5D8-ACC7-6449-B7F040EC7DA9	-t 		Trait to Analyze	1	t	0	1	\N
232	D6F55C85-6FA5-2875-BAA9-B1759439502A	-M 		Model	3	t	0	1	150
233	C7913FFC-E647-2961-31F3-F63D0881B83F	-c 		Chromosome	0	t	0	1	\N
234	FEF491CD-2B32-8665-F37C-8B8D541F13F0	-d 		Walking Speed (cM)	2.0	t	0	1	\N
235	92858A13-7A93-3C67-C0A7-FA63AAE7F0D1	-n 		Number of Background Parameters for Model 6	5	t	0	1	\N
1050	4817DA22-049E-C82C-1E96-4EF50D37B8C5	-M 		Bootstrap Replicates	0	t	0	1	\N
33	numberOfParallelThreads	 --num-threads 	\N	Number of threads to launch:	2	t	1	1	31
34	maxMultiHits	 --max-multihits 	\N	Allow this many hits per read:	40	t	1	1	32
35	minIsoformFraction	 --min-isoform-fraction 	\N	Minimum isoform fraction:	0.15	t	1	1	33
36	microExonSearch	 --microexon-search 	\N	Look for reads incident to microexons	false	t	1	5	34
37	butterflySearch	 --butterfly-search 	\N	Use a slower but more sensitive algorithm	false	t	1	5	35
39	segmentMismatches	 --segment-mismatches 	\N	Segment mismatches:	2	t	1	1	37
40	segmentLength	 --segment-length 	\N	Segment subdivide length:	25	t	1	1	38
41	minClosureExon	 --min-closure-exon 	\N	Length of exonic hops in splice graph:	50	t	1	1	39
42	minClosureIntron	 --min-closure-intron 	\N	Minimum intron length found during closure search:	50	t	1	1	40
43	maxClosureIntron	 --max-closure-intron 	\N	Maximum intron length found during closure search:	5000	t	1	1	41
44	minCoverageIntron	 --min-coverage-intron 	\N	Minimum intron length found during coverage search:	50	t	1	1	42
45	maxCoverageIntron	 --max-coverage-intron 	\N	Maximum intron length found during coverage search:	20000	t	1	1	43
46	minSegmentIntron	 --min-segment-intron 	\N	Minimum intron length found during split-segment search:	50	t	1	1	44
47	maxSegmentIntron	 --max-segment-intron 	\N	Maximum intron length found during split-segment search:	500000	t	1	1	45
48	keepTemp	 --keep-tmp 	\N	Preserve intermediate files from TopHat	false	t	1	5	46
49	noNovelJunctions	 --no-novel-juncs 	\N	Only inspect junctions specified in reference annotation	false	t	1	5	47
50	script		\N		 /usr/local2/bin/run_tophat.sh 	f	0	3	\N
51	script		\N		 /usr/local2/bin/convert_to_bam.sh 	f	1	3	\N
52	script		\N		 /usr/local2/bin/merge_sam_files.sh 	f	1	3	\N
53	minReadDepth	 -d 	\N	Minimum read depth:	3	t	6	1	48
54	maxReadDepth	 -D 	\N	Maximum read depth:	100	t	7	1	49
55	basePairsGapExcluded	 -w 	\N	SNPs within X base pairs around a gap should be excluded:	10	t	8	11	50
57	maxSnpsInWindow	 -N 	\N	Maximum number of SNPs in a window:	2	t	10	1	52
58	windowSizeForFilteringAdjGaps	 -l 	\N	Window size for filtering adjacent gaps:	30	t	11	1	53
59	minSnpQuality	 	\N	Minimum SNP quality (PHRED based):	3	t	30	9	54
61	minRMSsnp	 -Q 	\N	Minimum RMS mapping quality for SNPS	25	t	3	1	\N
62	minRMSgap	 -q 	\N	 Minimum RMS mapping quality for gaps	10	t	4	1	\N
63	minIndelScore	 -G 	\N	Minimum indel score for nearby SNP filtering	25	t	5	1	\N
64	script		\N		 /usr/local2/bin/samtools_filtering.sh 	f	1	3	\N
65	col_title	 --column-title 	\N	Enter the sample name:	\N	t	2	10	55
66	sam2vcf		\N		 /usr/local2/bin/convert_to_vcf.sh 	f	0	3	\N
68	numberOfHaplotypes	 -N 	\N	Number of haplotypes in sample:	2	t	3	1	57
69	thetaParameter	 -I 	\N	Expected fraction of differences between a pair of haplotypes:	.001	t	4	1	58
70	indelProbability	 -I 	\N	Probability of an indel in sequencing (PHRED scale):	3	t	5	9	59
71	mode	 	\N	mode	 pileup 	f	1	12	\N
72	script	 	\N		 /usr/local2/bin/samtools_base_calling.sh 	f	0	3	\N
73	maxgap	 -o 	\N	Maximum number of gaps open:	1	f	4	1	60
74	gapextensions	 -e 	\N	Maximum number of gap extensions:	-1	f	4	1	61
75	longdeletion	 -d 	\N	Disallow deletion #bps:	16	f	4	1	62
76	indelbp	 -i 	\N	Disallow indel within # bp towards end:	5	f	4	1	63
77	seed	 -l 	\N	label	inf	f	4	1	64
78	editdistseed	 -k 	\N	Maximum edit distance:	2	f	4	1	65
79	threads	 -t 	\N	Number of threads:	1	f	4	1	66
80	mismatchpenalty	 -M 	\N	Mismatch penalty :	3	f	4	1	67
81	gopenpenalty	 -O 	\N	Gap open penalty: 	11	f	4	1	68
82	gextpenalty	 -E 	\N	Gap extension penalty:	4	f	4	1	69
83	suboptimalalign	 -R 	\N	Proceed with suboptimal alignments : 	32	f	4	1	70
84	reversecomp	 -c 	\N	Reverse query but not complement it	false	f	4	5	71
85	mode	 	\N	BWA command type	 aln 	f	1	12	72
87	readtrim	 -q 	\N	Parameter for read trimming:	0	f	4	1	74
88	script		\N		 /usr/local2/bin/run_bwa.sh 	f	0	3	\N
89	maxgap	 -o 	\N	Maximum number of gaps open:	1	f	4	1	75
90	gapextensions	 -e 	\N	Maximum number of gap extensions:	1	f	4	1	76
91	longdeletion	 -d 	\N	Disallow deletion #bps:	16	f	4	1	77
92	indelbp	 -i 	\N	Disallow indel within # bp towards end:	5	f	4	1	78
93	seed	 -l 	\N	label	inf	f	4	1	79
94	editdistseed	 -k 	\N	Maximum edit distance :	2	f	4	1	80
95	threads	 -t 	\N	Number of threads:  	1	f	4	1	81
96	mismatchpenalty	 -M 	\N	Mismatch penalty :	3	f	4	1	82
98	gextpenalty	 -E 	\N	Gap extension penalty:	4	f	4	1	84
99	suboptimalalign	 -R 	\N	Proceed with suboptimal alignments : 	32	f	4	1	85
1051	084E11D5-F25F-B9E6-E25C-DDD8790DD7CF	-c 		Calculate Consensus Tree	true	t	0	5	\N
1256	1A5F4E5C-C09D-561B-C608-001A167DED81	-C 		Keep only sequences which didn't contain the adapter	false	t	5	5	\N
1257	058A9BB0-AE09-7970-C0E1-8F0029F974D4	-n 		Keep sequences with unknown (N) nucleotides	false	t	6	5	\N
1258	58387F80-AF65-2D7B-5257-BB48499DC699	-Q 33 		FASTQ data is in Sanger (PHRED33) format	false	t	7	5	\N
1300	F2FFB918-DFA7-326E-9350-AF1FE8B639C2	-seqtype auto,-seqtype protein,-seqtype dna		Sequence Type	0	t	-1	8	430
181	B8C2541E-0056-A877-C8C4-C781979E1C26	, -m full, -m short, -m species 		Sequence identifier		t	0	8	124
32	minIsoformFraction	 --min-isoform-fraction 	\N	Minimum isoform fraction:	0.15	t	1	1	30
38	libraryType	 --library-type fr-unstranded , --library-type fr-firststrand , --library-type fr-secondstrand 	\N	Select library type:	0	t	1	8	36
56	windowSizeForFilteringDenseSnps	 -W 	\N	Window size for filtering dense SNPs:	10	t	9	1	51
67	thetaParameter	 -T 	\N	Theta parameter (error dependency coefficient).<br> Enter a number between 0 and 1:	.85	t	3	1	56
86	itersearch	 -N 	\N	Disable iterative search 	false	f	4	5	73
97	gopenpenalty	 -O 	\N	Gap open penalty: 	11	f	4	1	83
100	reversecomp	 -c 	\N	Reverse query but not complement it	false	f	4	5	86
101	mode	 	\N	BWA command type	 aln 	f	1	12	87
102	itersearch	 -N 	\N	Disable iterative search 	false	f	4	5	88
103	readtrim	 -q 	\N	Parameter for read trimming:	0	f	4	1	89
104	script		\N		 /usr/local2/bin/run_bwa_per.sh 	f	0	3	\N
1103	totalMismatchesAllowed	-v 		 Total allowed mismatches in one read:	2	t	-1	1	\N
1118	84364B02-BB13-49E8-B64B-C12EC4964C4E	-I 		Sequences Interleaved	true	t	0	5	\N
118	infop	info	\N	Please select at least one option	\N	t	0	6	\N
119	printreg	R#R	\N	Output correlations and regressions	true	t	3	5	\N
120	printcon	C	\N	Output contrasts	false	t	4	5	\N
121	script		\N		 /usr/local2/bin/contrastrun.sh 	f	0	3	\N
122	option	 	\N	Maximum number of gaps open	contrastc.tmp	f	4	12	102
123	mode	 --vanilla 	\N			f	1	8	\N
124	script		\N		 /usr/local2/bin/cacerun.R 	f	2	3	\N
125	ip	 -i 	\N	Initial value (starting rate for ML estimation)	0.1	t	3	1	103
126	mode		\N	R environment type	 --vanilla 	f	0	12	\N
127	script		\N		 /usr/local2/bin/dacerun.R 	f	1	3	\N
128		This tool splits a FASTQ file into several files using barcodes as the split criteria.	\N	This tool splits a FASTQ file into several files using barcodes as the split criteria.	\N	t	1000	6	\N
129	barcodeEntryOption	 --bcfile 	\N	Enter barcode:	\N	t	2	13	\N
130	numberOfAllowedMismatches	 --mismatches 	\N	Number of allowed mismatches:	1	t	3	1	104
131	script	 	\N			f	0	3	\N
132	bposition	 --bol 	\N		 	f	4	12	\N
133	prefix	 --prefix 	\N	Prefix	\N	f	4	12	\N
134			\N	This tool will convert quality scoring to Sanger scoring.	\N	t	0	6	\N
135	qualityScoresType	 fqint2std , sol2std , sol2std2 , fa2std , fq2fa , export2std , csfa2std 	\N	My sequence reads are the following scoring type:	\N	t	1	8	105
136	script	 	\N		 /usr/local2/bin/run_scaler.sh 	f	0	3	\N
148			\N	This tool will submit your list of names for matching to the iPlant database.	\N	t	0	6	\N
149	tnrs		\N		\N	t	0	14	\N
150	includeFamilyNames	familyNames	\N	Include family names in output	\N	t	0	5	\N
151	script		\N	script	 /usr/local2/bin/merge_fastq_files.sh 	f	0	3	\N
152	script		\N		 /usr/local2/bin/merge_sam_files.sh 	f	2	3	\N
1052	B67F57A9-6B38-B9C3-7164-3E8605E31266	-P 'Jones-Taylor-Thornton matrix', -p 'Henikoff/Tillier PMB matrix', -P 'Dayhoff PAM matrix', -P 'Kimura formula', -P 'Similarity table'		Distance Matrix	0	t	0	8	327
182	A349FBA9-BE4D-260C-029A-FCD3F3897A93	-f		Parameter-kk		t	0	12	\N
183	D97ADD23-8C87-05A4-C3D0-7D70EE127EF2	-f		Parameter 2-kkEDITED		t	0	12	\N
184	A349FBA9-BE4D-260C-029A-FCD3F3897A93	-f		Parameter-kk		t	0	12	\N
185	D97ADD23-8C87-05A4-C3D0-7D70EE127EF2	-f		Parameter 2-kkEDITED		t	0	12	\N
186	29759284-5266-49AC-0B21-4E057D1FA7B2	-f		First base to keep:	1	t	0	1	125
187	02DC5719-5AB5-A83D-690A-0192AF76A483	-l		Last base to keeo:	28	t	0	1	126
1053	E91A84DC-876D-CE09-07F9-51531C5C55A8	-I 		Sequences Interleaved	true	t	0	5	\N
1054	D96684AD-CEA2-E303-B0A4-A57B4665C860	-O 		Outgroup Root at species N	1	t	0	1	\N
1055	960FDA0D-F720-86C9-ED90-F7EEAB25A692	-M 		Bootstrap Replicates	0	t	0	1	\N
1056	5818452F-3448-C169-4BD7-AE998FDE07DB	-c 		Calculate Consensus Tree	true	t	0	5	\N
1262	51B9AD98-B0EF-7FE4-74B9-7ADEBADE6024	-q 		Minimum quality score to keep	20	t	1	1	411
1263	BCCB23E7-02A5-8F7A-A4FA-EE49249D6FC0	-p 		Minimum percent of bases that must have this quality	50	t	2	1	412
1264	85BDEF8F-CD54-F5DB-4A86-51174790D1AD	-Q 33 		FASTQ data is in Sanger (PHRED33) format	true	f	3	5	\N
1267	79C77C61-B422-9391-6000-B3220E0A8DE1			script	/usr/local2/bin/lopper.R	f	1	12	\N
1268	F892D921-10EF-0D82-6CF5-5B75D38DD31D	-f csv, -f csvx, -f nwk, -f nex, -f lst 		File 1 format		t	2	8	413
1269	79EDAB07-9664-ACCD-B415-E092583C9DD2	csv, csvx, nwk, nex, lst 		File 2 format		t	3	8	414
1270	5201954A-1402-D525-BC96-44F40B241950	-t 0, -t 1, -t 2, -t 3 		Resolve taxa names (experimental)	0	t	5	8	415
1271	9FC8D15E-BF02-58AE-D555-B9C3AFD73E69			The Taxonomic Name Resolution Service checks the taxa names from the input files against the Tropicos database (Missouri Botanical Garden) and returns the accepted name. This service is experimental and large files might take long to process.		t	6	6	\N
1272	8C6449BB-AD67-890A-E552-B2FCA9C8F6B1	-m 0, -m 1, -m 2, -m 3 		Save mismatches	0	t	4	8	416
1565	D6FD0F03-1C45-A7D5-584E-3AF026A7D084	-A 		Automatic	on	f	-1	12	\N
1347	95AD8D8A-54BC-32C5-3433-F17A48330F66			Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.		t	-1	6	\N
1099	minimalInsertSize	-m 		Minimal insert size allowed for alignment	400	t	-1	1	\N
1100	maximumInsertSize	-x 		Maximum insert size allowed for alignment	600	t	-1	1	\N
1101	orientationMode	-R 		Reads are from a mate-pair library (> 2kb inserts)	false	t	-1	5	\N
1102	filterLowQuality	-n 		Filter low quality reads containing more this many Ns:	5	t	-1	1	\N
1104	numberThreads	-p 		Number of threads to launch	4	f	-1	1	\N
1105	matchModeInfo			Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit		t	0	6	\N
1106	matchMode	-M 		Matching mode	4	t	0	9	334
1116	5F303512-8007-A423-93B0-63A6E97D148F	-G 		Global Rearrangements	false	t	0	5	\N
1117	784A67C2-78E5-2D56-FE38-CD82E0D32E8B	-S 		Speedier (but rougher) analysis	true	t	0	5	\N
1119	7D053483-E83B-E5D3-1BCA-042F9019FF91	-O 		Outgroup root on species N	0	t	0	1	\N
1120	4FBD925C-1213-302F-DF25-0B16989F92E0	-J 		Jumble taxon input order N times	0	t	0	1	\N
1121	F04058F8-E5F6-EABD-ABE4-FBD5F77F8502	-T 		Transition/Transversion Ratio	2.000	t	0	1	\N
1122	5CD104F6-9DDC-8812-AE01-EA3CBFEA8EF8	-5 		Reconstruct hypothetical ancestral sequences	false	t	0	5	\N
1123	C6CB2FC2-281A-A6A0-4268-4042DBDEE8CB	-M 		Bootstrap replicates 	0	t	0	1	\N
1124	49C932EC-148A-D4B5-593C-58E53FFE7ECE	-c 		Calculate Consensus Tree	true	t	0	5	\N
1153	EE93839D-12CF-0461-E95B-18497BE5D0B3	-n 		Parameter 1	tester	t	2	12	\N
1156	14E642BC-6538-F104-C195-1EAD12D475B9	-f 		First base to keep	1	t	1	1	351
1157	3B59532A-4F6C-B6D9-0CC3-0BAA2818DE0A	-l 		Last base to keep	28	t	2	1	352
1158	BE28A018-4538-4721-5EB0-62EC5F4575B3	-q 		Minimum quality score to keep	10	t	1	1	353
1159	E87D4134-C8D6-A2D0-AFF1-63D5FA39C862	-p 		Percentage of bases that must have the above quality score	80	t	2	1	354
1160	SeqType	 -seqtype 		Type of sequence: nucleotide (nt) / amino acid (aa)	auto	t	2	9	355
1161	SeqType	 -seqtype 		Type of sequence: nucleotide (nt) / amino acid (aa)	auto	t	2	9	356
1165	554B3326-C816-66C1-40F1-997F8AA6F405			script	/usr/local2/bin/treeview.pl	f	1	12	\N
1166	009903E9-5895-8F0F-9BAB-3677D0BBB85B	-m GTRCAT, -m GTRMIX, -m GTRGAMMA, -m PROTCAT, -m PROTMIX, -m PROTGAMMA		Model		t	2	8	357
1167	D97F2DFF-B539-1D03-D309-A26F297EE70E	,DAYHOFF,BLOSUM62		Substitution matrix		t	3	8	358
1168	0A8F915A-00B5-1FB8-222A-D86B22C92346	F		Use empirical Amino Acid frequencies	false	t	4	5	\N
1171	717F8E95-C498-EC6E-4D5F-9E8F82C329F4	-f 		First base to keep:	1	t	2	1	361
1172	A1A6D0C7-EC7B-4112-8257-401C4E6CD1A0	-l 		Last base to keep:	28	t	3	1	362
1566	CBC0F338-97DE-B93E-8B38-CDE868250431	-I		Interactive	0	f	-1	1	\N
1273	AccessionName	-A 		SRA Accession Name	SRR...	t	1	12	417
1274	D0EDE5CF-B3E5-14C6-FE96-31EBA4A11128	-n 		Sample Size	200	t	-1	1	418
1298	A52CB953-3C2D-C9F5-6FD3-D8D418E8246E	Auto, Protein, DNA		Sequence Type	0	t	3	8	429
1299	C11E8E64-5A30-BBC9-0D76-EB482E20E207			script	/usr/local2/bin/run_muscle.pl	f	1	12	\N
597	_pval	-p 	False Discovery Rate cut-off (-p)	FDR cut off	0.0001	t	3	12	\N
598	_delta	-r 	Delta value (-r)	Delta (See PeakRanger paper)	0.8	t	4	1	\N
599	_bw		Smoothing bandwidth (-b)	Smoothing bandwidth	99	t	5	1	\N
1348	5E7DC065-CF78-5C78-AFA4-80929E96A923	-n 		Mismatch tolerance	0.04	t	-1	1	\N
600	_ex		Read extension length (-l)	Read extension length	200	t	5	1	\N
601	_pad	--pad 	Pad read coverage to avoid false positive summits	Pad read coverage profiles	false	t	6	5	\N
602	nThread	-t 		Number of threads	4	f	7	1	\N
603	runningMode	--mode 		Specify the running mode	region	t	8	9	254
604	format	 --format 		Specify the format of the input files	sam	t	9	9	255
1349	7A10212D-BBB1-7990-0AC0-950FB8A13C44	-o 		Maximum number of gap opens	1	t	-1	1	\N
1350	E0C3D817-4715-AB8F-80EE-3ACAC029C8B1	-e 		Maximum number of gap extensions	-1	t	-1	1	\N
1351	ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E	-d 		Disallow long deletion within [value] bp towards the 3'-end	16	t	-1	1	\N
1352	3CAA4498-6A2F-7167-DDC0-3174385D0FBB	-i 		Disallow insertion/deletion within [value] bp towards the end	5	t	-1	1	\N
1353	CF1266E5-4069-C286-630A-FC4B54C1627E	-k 		Maximum edit distance in the seed	2	t	-1	1	\N
1354	A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7	-M 		Mismatch penalty	3	t	-1	1	\N
1355	438FB3A3-C78F-E2C3-4296-495487BCBABC	-O 		Gap open penalty	11	t	-1	1	\N
1356	25A5BF70-73E4-E542-BCDD-9D1235E39860	-E 		Gap extension penalty	4	t	-1	1	\N
1357	9A224CED-7C8C-3CD8-1E8E-432A1C9A796C	-R 		Proceed with suboptimal alignments even if the top hit is a repeat	false	t	-1	5	\N
1358	9A224CED-7C8C-3CD8-1E8E-432A1C9A796C	-R 		Proceed with suboptimal alignments even if the top hit is a repeat	false	t	-1	5	\N
1359	numberThreads	-t 			4	f	-1	1	\N
881	96FF8149-E74D-8471-CC69-EEE73999E753	-J 		Jumble taxon input order N times	0	t	0	1	\N
882	DBD0A945-2B02-1F91-47C2-B99E52A7CFDA	-5 		Print sequence at each node	false	t	0	5	\N
883	EEE532D0-A3E3-8D6C-D281-BF2D22DE0907	-I 		Sequences Interleaved	true	t	0	5	\N
884	450E2822-D905-F684-4EFE-8F5653B46BE5	-O 		Outgroup root on species N	1	t	0	1	\N
885	4A820718-3DBD-E536-C99B-0B8343F83BAA	-M 		Bootstrap replicates	0	t	0	1	\N
886	4012081D-7472-7A44-BCD7-73F08D3B817D	-c 		Compute consensus tree	true	t	0	5	\N
1913	num_threads	--num-threads=		Number of threads	6	f	-2	1	\N
1914	label_names	--label=	One entry per BAM or SAM file in the file select box	Comma-delimited list of sample names	RNA1,RNA2...	t	-2	12	\N
1915	time_series	--time-series 	Samples should be provided in increasing time order.	Treat sample files as a time series	false	t	-2	5	\N
1916	upper_quartile_norm	--upper-quartile-norm 	Normalizes by the upper quartile of the number of fragments mapping to individual loci.	Upper quartile normalization	false	t	-2	5	\N
1186	B67511FD-1DB1-1CBC-6F82-46270FF1A0A6	-G 		Global Rearrangements	false	t	2	5	\N
1187	F06B14A8-F504-6880-4D11-078ADF72A28A	-S 		Speedier (but rougher) analysis	true	t	3	5	\N
1188	C4B511E7-BFAD-4890-E81A-912803A07AD3	-I 		Sequences Interleaved	true	t	4	5	\N
1189	AE47C226-7ECE-C63E-848F-A8E319FB49D6	-O 		Outgroup root on species N	1	t	5	1	371
1190	F33DE840-341D-8AE7-8E83-890D0E18B247	-J 		Jumble taxon input order N times	0	t	6	1	372
1191	2F8AEBE8-37F0-472A-FF93-F216AFB8B858	-5 		Reconstruct hypothetical sequences	false	t	7	5	\N
1192	68B6C2E3-74DA-100C-89EA-8BFB81E0B981	-P 'Jones-Taylor-Thornton', -P 'Henikoff/Tillier PMB', -P 'Dayhoff PAM' 		Probability Model	0	t	8	8	373
1917	library_size_norm			Library size estimation for normalization	1	t	-2	8	765
1290	Cols			Specify columns to change:	c1,c2	t	1	12	422
1291	Casing			Change case to:	Uppercase	t	3	9	423
1292	Delimiter	 		Input file is delimited by:	TAB	t	2	9	424
1293	AwkProgram			Enter an Awk Program		t	3	12	425
785	2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826	--library-type 		Parameter 1	fr-unstranded	f	0	12	\N
786	F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA	--min-anchor-length 		Anchor length	8	t	-1	1	288
787	522F5734-FA15-FDBA-C390-4EDD3F42316C	--splice-mismatches 		Maximum number of mismatches that can appear in the anchor region of spliced alignment	0	t	-1	1	289
788	35CBD019-8B84-FF9A-8D2A-509262307EC6	--min-intron-length 		The minimum intron length	70	t	-1	1	290
789	1D83679F-685D-806F-0385-7E391406395D	--max-intron-length 		The maximum intron length	50000	t	-1	1	291
790	DC31B362-5120-4405-4DD0-F1866E130D75	--min-isoform-fraction 		Minimum isoform fraction	0.15	t	-1	1	\N
791	22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5	--max-multihits 		Maximum number of alignments to be allowed	20	t	-1	1	\N
792	4A30FC41-4218-550A-1412-158694A221C6	--min-segment-intron 		Minimum intron length that may be found during split-segment (default) search.	50	t	-1	1	\N
793	C94FAB10-553A-50B3-114A-780779A2308C	--max-segment-intron 		Maximum intron length that may be found during split-segment (default) search	500000	t	-1	1	\N
794	222E2998-FB4F-D828-D1D7-3EA03419B427	--segment-mismatches 		Number of mismatches allowed in each segment alignment for reads mapped independently	2	t	-1	1	\N
795	C956168F-90AC-C907-6CFB-D572A74CDF0F	--segment-length 		Minimum length of read segments	25	t	-1	1	\N
796	8FD71E20-E861-3831-14B4-7CC3F64F7571	--no-convert-bam 		Do not convert output to BAM format	false	f	-1	5	\N
797	threads	--num-threads 		Number of threads	4	f	-1	1	\N
798	2BF9E7B8-C3DF-FAD9-616F-BB9F93BDF826	--library-type 		Parameter 1	fr-unstranded	f	0	12	\N
799	F0B8DC0C-6541-FFEF-FAEC-41CD4B5206DA	--min-anchor-length 		Anchor length	8	t	-1	1	292
800	522F5734-FA15-FDBA-C390-4EDD3F42316C	--splice-mismatches 		Maximum number of mismatches that can appear in the anchor region of spliced alignment	0	t	-1	1	293
801	35CBD019-8B84-FF9A-8D2A-509262307EC6	--min-intron-length 		The minimum intron length	70	t	-1	1	294
802	1D83679F-685D-806F-0385-7E391406395D	--max-intron-length 		The maximum intron length	50000	t	-1	1	295
803	DC31B362-5120-4405-4DD0-F1866E130D75	--min-isoform-fraction 		Minimum isoform fraction	0.15	t	-1	1	\N
804	22365E2E-7BC7-6E3E-6A02-96FE96E9D7B5	--max-multihits 		Maximum number of alignments to be allowed	20	t	-1	1	\N
805	4A30FC41-4218-550A-1412-158694A221C6	--min-segment-intron 		Minimum intron length that may be found during split-segment (default) search.	50	t	-1	1	\N
806	C94FAB10-553A-50B3-114A-780779A2308C	--max-segment-intron 		Maximum intron length that may be found during split-segment (default) search	500000	t	-1	1	\N
807	222E2998-FB4F-D828-D1D7-3EA03419B427	--segment-mismatches 		Number of mismatches allowed in each segment alignment for reads mapped independently	2	t	-1	1	\N
808	C956168F-90AC-C907-6CFB-D572A74CDF0F	--segment-length 		Minimum length of read segments	25	t	-1	1	\N
809	8FD71E20-E861-3831-14B4-7CC3F64F7571	--no-convert-bam 		Do not convert output to BAM format	false	f	-1	5	\N
810	threads	--num-threads 		Number of threads	4	f	-1	1	\N
1193	5204174D-3DC9-43A9-5CFC-73A7DE8BE96C	-M 		Bootstrap replicates 	0	t	9	1	374
1194	6492BF41-31A3-2E21-2D5B-005FB1E5C1EE	-c 		Calculate Consensus Tree	true	t	10	5	\N
1294	InputSeparator			Input Field Delimiter	tab	t	4	9	426
1196	6C5A0468-369A-41D1-67D9-4D4AC1CDDAE2	-f 		First base to keep:	1	t	-1	1	376
1197	30DDFAD9-4BA8-C6EC-CF94-984F815EAD02	-l		Last base to keep:	1	t	-1	1	377
1295	OutputSeparator			Input Field Delimiter	tab	t	5	9	427
1301	8B1C5EE1-6A70-E5B1-8F22-9E1BA1577F9D	-f 		Parameter 1	1	t	2	1	431
1302	C199B706-D2D9-3B2D-4B54-55C159DE367C	-l 		Parameter 2	28	t	3	1	432
1203	67DA7A2F-DAC6-B497-7239-8125D0CEF81D			script	/usr/local2/bin/ninja	f	1	12	\N
1204	3B19F47B-757B-93BB-36B1-99501444D433	--in,--in_type d		Input type	0	t	2	8	380
1205	F9846519-4477-7E5F-53B7-266203F9F09D	--out 		Output file	tree.newick	t	4	12	\N
1215	785328DF-B877-8213-CF3D-38CBA7FFE78A			script	/usr/local2/bin/run_raxml_prot.sh	f	1	12	\N
1216	DAE7DA78-A7D0-283E-332D-B512E866C2EF	-m PROTCAT,-m PROTMIX,-m PROTGAMMA,-m PROTGAMMAI,-m PROTMIXI		Model:	0	t	4	8	386
1217	DE172489-E1C9-7F0B-6ADE-82D7F35B4410	BLOSUM62,DAYHOFF		Substitution matrix:	0	t	5	8	387
1218	03725AE5-44DF-00A3-CF2F-1F809ACF02C4	F		Use empirical frequencies	false	t	6	5	\N
1219	DB6BE145-1B98-6A60-530B-F197108CCD7A	-n		Output:	tree.nwk	t	3	12	388
1220	7B8FBFF3-3642-5497-7CCA-DAFE782F082E	-m GTRCAT,-m GTRMIX,-m GTRGAMMA,-m GTRGAMMAI,-m GTRMIXI		Model:	0	t	2	8	389
1221	60CBBA14-E8D5-44C2-0D25-20771FD4BCC0	-n		Output:	tree.nwk	t	3	12	390
1305	97BF54A9-D7CD-E051-9E4F-81E6A396589D	-i 		Initial value:	0.1	t	4	1	433
1306	3F824F74-0C67-34F1-164D-DB2A13564FB4			Parameter 1	/usr/local2/bin/dacerun.R	f	1	12	\N
1307	1295FA67-24E8-EB66-452D-D05A862D8EF4			Initial rate for ML optimization.		t	-1	6	\N
1308	58B64540-8553-3C32-F600-C3B2F27274C7			Formats:\n<p>Tree file: newick or nexus (experimental).</p>\n<p>Trait file: comma separated values (csv) table with header.</p>\nNote: If the trait file contains multiple traits, only the first column will be analysed.		t	-1	6	\N
1322	95AD8D8A-54BC-32C5-3433-F17A48330F66			Enter an integer to specify Maximum edit distance or a float to specify fraction of missing alignments given 2% uniform base error rate.		t	-1	6	\N
1323	5E7DC065-CF78-5C78-AFA4-80929E96A923	-n 		Mismatch tolerance	0.04	t	-1	1	\N
1324	7A10212D-BBB1-7990-0AC0-950FB8A13C44	-o 		Maximum number of gap opens	1	t	-1	1	\N
1325	E0C3D817-4715-AB8F-80EE-3ACAC029C8B1	-e 		Maximum number of gap extensions	-1	t	-1	1	\N
1326	ED4AC60D-DAB9-9ECF-88EC-65C1F1B12A0E	-d 		Disallow long deletion within [value] bp towards the 3'-end	16	t	-1	1	\N
1327	3CAA4498-6A2F-7167-DDC0-3174385D0FBB	-i 		Disallow insertion/deletion within [value] bp towards the end	5	t	-1	1	\N
1328	CF1266E5-4069-C286-630A-FC4B54C1627E	-k 		Maximum edit distance in the seed	2	t	-1	1	\N
1329	A1E8AF7F-F259-93A1-1C7C-A5C6200CAAD7	-M 		Mismatch penalty	3	t	-1	1	\N
1330	438FB3A3-C78F-E2C3-4296-495487BCBABC	-O 		Gap open penalty	11	t	-1	1	\N
1331	25A5BF70-73E4-E542-BCDD-9D1235E39860	-E 		Gap extension penalty	4	t	-1	1	\N
1332	9A224CED-7C8C-3CD8-1E8E-432A1C9A796C	-R 		Proceed with suboptimal alignments even if the top hit is a repeat	false	t	-1	5	\N
1333	9A224CED-7C8C-3CD8-1E8E-432A1C9A796C	-R 		Proceed with suboptimal alignments even if the top hit is a repeat	false	t	-1	5	\N
1334	numberThreads	-t 			2	f	-1	1	\N
1335	2F8DC640-4CED-CD2F-F8F6-5DA98B93AF5F			Phylogenetic Independent Contrasts ouput options.  Note that no data will be displyed unless one or more of these options are selected.		t	-1	6	\N
1336	77B4F768-778B-C684-B7C9-A3BAF80C3B5F	-R 		Print regressions	true	t	3	5	\N
1337	78E3D8ED-CA4C-126B-D491-77FE0A4AC29B	-C 		Print contrasts	true	t	4	5	\N
1015	filterLowQuality	-n 		Filter low quality reads containing more this many Ns:	5	t	-1	1	\N
1016	totalMismatchesAllowed	-v 		 Total allowed mismatches in one read:	2	t	-1	1	\N
1017	numberThreads	-p 		Number of threads to launch	4	f	-1	1	\N
1018	matchModeInfo			Select 0: exact; 1: 1 mismatch; 2: 2 mismatch; 3: gapped; 4: best hit		t	0	6	\N
1019	matchMode	-M 		Matching mode	4	t	0	9	324
1360	00773107-B17E-A2B0-C029-D8B015310A12	-J 		Jumble taxon input order N times	0	t	2	1	\N
1361	4EC1D2FB-B21F-536F-7301-6309306E0E45	-5 		Print sequence at each node	false	t	3	5	\N
1362	8A5FEBD8-0C21-ED8C-0541-87254F016277	-I 		Sequences Interleaved	true	t	4	5	\N
1363	07181E5C-CBD9-CB5A-445E-5A68DE2B8103	-O 		Outgroup root on species N	1	t	5	1	\N
1364	D632DBEF-113E-0021-0A9D-7FD98F383E12	-M 		Bootstrap replicates	0	t	6	1	\N
1365	15D58025-1794-E6DC-266B-8F9574FD2CFB	-c 		Compute consensus tree	true	t	7	5	\N
1402	91448AB8-E9BF-4554-C557-B525C3DD575D	-t dna, -t protein		Sequence Type	0	t	3	8	463
1413	42418626-A879-BF31-BE8A-DD51B5B3D3CA	-seqtype auto,-seqtype dna,-seqtype protein		What is the type of sequence?	0	t	4	8	467
1414	374AD7FF-E120-2D43-88F1-DFD7968C254D	-f 		First base yoooooo	1	t	2	1	468
1415	FEC63E37-E4CD-D6B8-87B3-02DFBDB704C4	-l 		Last base ddduuudddeee	28	t	3	1	\N
1441	C28F588D-221F-8780-E77C-58522325315A			K Value		t	2	12	\N
1444	05A51AFC-319D-8B07-6531-D88A04A7477D			Kvalue (Only or Low)	0	t	2	12	489
1445	F1B55CEC-952C-7D87-41EF-79EB63A5FBB6			Kvalue (High)		t	3	12	\N
1867	MinLength	--min 		Minimum Length	100	t	1	1	749
1631	56AA4EC8-3066-163B-D2FA-1A0FB66FC8D4	-f 		Input Format	csv	t	-1	12	\N
1632	D656960E-AD4F-562C-A3E7-B90C49875584	-t 		Output Format	qtlcart	t	-1	12	\N
1633	AD7E6E43-4D06-95E2-9130-2493EF8E182A	-s 		Output Filestem	qtlcart	t	-1	12	\N
1634	E3381CA2-E569-36B4-272B-3B3DBF4768FF	-g		Genotypes		t	-1	12	\N
1635	B7BF732C-7F70-7511-E15B-B4C246ECC258	-a		Alleles		t	-1	12	\N
1533	CBD50B03-4504-8C2E-3DF3-D22CE6DDD4A0	-A 		Parameter 1	on	f	-1	12	\N
1678	0FDAB459-E6F5-A803-8021-91B5312BA7DE			n		t	1	12	642
1679	B34E3EE6-3B1D-4863-E0FC-C28C46849649			m		t	2	12	643
1680	A0C7A328-6F12-C002-1F43-34AA75BEA772			pop_struct		t	3	12	644
1681	BF645486-6B6D-1F09-B66B-58105D166E01			n_pop		t	4	12	645
1682	B3F56FBD-DA14-027F-77C6-27566503FC0A			n_miss_rep		t	5	12	646
1683	AC85F024-A5D5-366F-49A5-91257D720AA2			n_order_rep		t	6	12	647
1684	A48EEED8-B266-CDC0-F442-6448AE3DC328			tol		t	7	12	648
1685	77411A24-67FF-60B9-042C-8CF5DA89B12C			mis_dat		t	12	12	649
1686	234F1586-CCCB-870B-007E-581D355B6416			thres		t	13	12	650
1692	A70231AD-B071-DAF0-315E-5C2EEC1A38ED	-D 		Species	Species	t	2	12	655
1693	2CD0D349-C006-8147-891B-ECFBC33F0F2B	-t 		t value	100	t	3	12	656
1694	5DB50657-405B-FA2C-AE3E-C06A735A0BF9	-y 		y value	1	t	4	12	657
1695	258F671C-1817-B549-A2CF-DED85C2A3B43	-i 		i value	1	t	5	12	658
1696	3E6346DB-D98C-A3FC-FCD1-B2BED83971F0	-v 		v vale		f	6	12	\N
1729	E7922974-7CEA-26C6-7DC4-A3C14AB94F62	-U 		U Value	2	t	2	12	687
1730	34FCEC67-F350-2C56-645A-9F52BDC7D963	-p 		p value		f	3	12	\N
1731	7B8D2169-EE2A-6548-ECAB-7E363915E3E9	-t 		t value	100	t	4	12	688
1732	22F4A16C-C8BD-1377-9687-647C431ED532	-m 		m value	1000	t	5	12	689
1733	23100750-6375-25FF-9AC7-3F75C90DA218	-y 		y value	1	t	6	12	690
1734	49C0EF94-78E2-A7C7-3C60-F5BBF0D0FD9D	-i 		i value	4	t	7	12	691
1735	14E58B74-857A-E7B5-354F-77A93D275D43	-v 		v		f	8	12	\N
1736	F0DE4B5F-E6CD-2132-A7DE-2F0E4DED9A4E	-k 		number of clusters	2	t	2	1	692
1737	16AD21B6-D931-16A4-6290-4005A5C74C60	-n 		normalization method	4	t	4	8	693
1738	8655D5D8-FDF0-4D25-FC47-636DC81E3EFE	-r 		NormalizationAlphaValue	0	t	5	1	\N
1746	6E40E97D-AF90-168C-47C4-BC1DCBA2638C	-m 		MTC method to use	1	t	9	8	696
1747	53F7CF3B-BDEE-8272-11E6-B9672267FA63	-c 		calculation method to use	2	t	11	8	697
1748	0B956739-ED58-3EF7-AEA3-3E778F522DE9	-d 		output .dot file	0	t	12	1	\N
1749	206A7C7F-BE86-1502-F99E-2353666F1EE0	-i 		ignore genes with no association	false	t	10	5	\N
1750	F9147F5E-40CC-89F4-312F-81D0B87F5079	-n 		additional annoation	false	t	8	5	\N
1751	0DCF6F61-25A0-33FC-F0C3-61A969117F5D	-r 		number of steps in resampling based MTCs	0	t	7	1	\N
1752	70EF784D-A7A9-4927-FDE5-F9EC91BF7AFE	-t 		size tolerance	0	t	6	1	\N
1836	AF9EC9D7-8328-B5FA-97F6-C6FACBBD6C73			Parameter 1	/usr/local2/bin/cacerun.R	f	1	12	\N
1837	F375BDB3-05E8-97A7-5C70-57FB3998E953			Formats:<p>Tree file: newick or nexus (experimental).</p><p>Trait file: comma separated values (csv) table with header.</p>		t	-1	6	\N
1838	pfe984b4e3a6f4c678ec011b7e536cc90	-a		Analyse all columns (If unchecked, only the first column will be analysed)	false	t	4	5	\N
1852	E7CF57C7-A43A-E888-8D03-97D48937BCB1			A good starting Kmer size is half of your shortest read length + 1.		t	-1	6	\N
1853	674643C5-B56F-045A-1B5C-61423B7ED4EE	--kmer=		Kmer	25	t	15	1	739
1854	C3912AC9-CE8A-5AC5-8439-BFFB13B638D8	--minPairs=		Minimum number of read-pairs to scaffold contigs	5	t	13	1	740
1855	80B379F9-16FB-3B05-558F-715025CA7432	--kmerCoverage=		Mean k-mer coverage threshold	6	t	14	1	741
1856	80D78A32-F6B6-1617-4F5B-74D1B6632768	--minSeedContig=		Minimum length of a seed contig	100	t	12	1	742
1857	96136AC5-9075-5046-3BB0-BDD3741E34D4	--erodeTips=		Erode blunt tips with coverage below this value	2	t	11	1	743
1858	0B92C39B-1D37-9988-9950-2F7CE4FFBFFA	--erodeTipsStrand=	Zero is the recommended value for this parameter when doing transcriptome assembly.	Erode strand-specific tips with coverage less than this value	0	t	16	1	744
1859	19098D07-A079-AAB7-8EC8-8D1C6BBCDD8F	--peAligner=		Aligner used for scaffolding contigs	1	t	9	8	745
1860	85B4F945-929F-3181-3949-C1BE23CE5466	--assemblyName=	(Alphanumeric characters only. No punctuation or whitespace)	Name of this assembly	plant	t	10	12	746
1861	0C91F3D2-4939-2722-48BC-35D12E1D144C	--appid=		_appid	abyss-param-complex-ranger-1.2.7	f	1	12	\N
1862	3D0E2C9B-67CE-EC59-E8DA-82B6C93361D1	--maxMemory=		_maxMemory	2	f	4	1	\N
1863	84F67ADE-7BD2-EA84-EA75-97BD4FBD20D2			There's no magic button for a succesful genome or transcriptome assembly. We've made a good effort to choose reasonable defaults, but every sequence is different. If you find that your jobs are timing out at 12h, increase your estimated run time to 24h.		t	-1	6	\N
1864	302EBFDF-81A2-ED8C-69A4-589DA70633E2	--requestedTime=	Estimate the run-time for this assembly job	Estimated Run-time	3	t	3	8	747
1865	A26FCEBE-91EC-CFE5-B7DB-3637B53F9637			Another method for decreasing run time is to select the next increment up for job size. This represents a doubling of the number of processors devoted to your assembly.		t	-1	6	\N
1866	47440C5B-72EB-38FB-5F40-ED7839ADD5FA	--processorCount=		Job Size	1	t	2	8	748
1870	Species	 --species 		Select target species:	Arabidopsis thaliana	t	2	9	750
1871	RelatedGeneLimit	--related_gene_limit 		Related gene limit:	15	t	2	1	\N
1872	CombiningMethod	--combining_method 		Weighting Method:	automatic	t	2	9	751
1873	OutputType	--out 		Output Format:	flat	t	2	9	752
1874	Coexp	 --coexp 		Co-expression	true	t	3	5	\N
1875	Coloc	 --coloc 		Empirical colocation	false	t	3	5	\N
1876	Gi	 --gi 		Genetic interactions	true	t	3	5	\N
1877	Path	 --path 		Pathway interactions	false	t	3	5	\N
1878	Pi	 --pi 		Physical interactions	true	t	3	5	\N
1879	Predict	 --predict 		Predicted interactions	false	t	3	5	\N
1880	Spd	 --spd 		Shared protein domains	false	t	3	5	\N
1881	Other	 --other 		Other networks	false	t	3	5	\N
1882	FEA0B90D-7E7C-C3E3-F475-5A53EC57E5AA	-R 		Ignore reference transcripts not covered by query files	false	t	-2	5	\N
1883	35E78F5C-FE81-8950-49B9-03977BD75201	-C 		Enables the "contained" transcripts to be also written to a file.	false	t	-2	5	\N
1884	547F82BA-B2C6-DE96-C76D-E309A34973FC	-o=		Prefix for cuffcompare outputs	cuffcmp	t	-2	12	\N
1944	FDCB89D6-B1C7-B5E0-4856-8CB6E133E465	--appid=		_appid	bx_evaluate-1.0.0	f	1	12	\N
1945	BACB1CCF-ECB7-6789-83F7-49CA406381F2	--processorCount=		_processorCount	1	f	3	1	\N
1946	918610B6-AB3E-E5FA-04EE-2F9F9D6CD5C6	--requestedTime=		_requestedTime	08:00:00	f	4	12	\N
1947	241BA461-67A3-8C6B-F8ED-EBDE3A0581DA	--maxMemory=		_maxMemory	2	f	2	1	\N
1948	8343CFF8-3DDA-42F4-0880-698AA807CBD2	--assembly_name=	Alphanumeric characters plus underscores and periods allowed. No whitespace.	Name of the assembly	contig_assembly	t	6	12	774
1949	8C35B84E-E71D-26BA-CDAB-299B68092869	--evalue=		E-value threshold	0.01	t	8	1	775
1950	DEB65931-2F87-06B5-4042-CE7A2F8D3AD2	--blastmode=	Choose between all hits or top hits only	BLASTX pipeline mode	0	t	7	8	776
1954	5708CB6E-7D07-1F0C-822D-446D83C45554			script	/usr/local2/bin/GetSeq.pl	f	1	12	\N
1955	C14B8652-6C19-11A4-CE26-B790644D8843	,-m full, -m species, -m short 		Header content	3	t	3	8	779
1956	pc52bf615fbf246288aa85bdb1c493edb	-k 		Number of residues of tolerance around the median for sequence length filtering:		t	4	1	\N
1981	FF45C5AB-7742-11BF-D610-334C5527AD9E	-a 	Which type of analysis will you run?	analysis		t	3	16	790
1982	1B87D542-568D-0641-F991-11FEEBC7B320			 fL = find lambda; cCPL = calculate penalized likelihood; both = both		t	-1	6	\N
1983	E602A93A-4D26-1B57-F55C-79B3EAAEC8D1	-l 	Best lambda (required for cCPL only)	lambda		t	4	11	\N
1984	16267486-00A9-3E59-C88B-F4692DEAAC85	-s 	How many base pairs? (Default value is 100)	sequence length		t	5	11	\N
1918	multi_read_correct	--multi-read-correct 	Do an initial estimation procedure to more accurately weight reads mapping to multiple locations in the genome	Perform multiple-hit correction	false	t	-2	5	\N
1919	FDR	--FDR=	The allowed false discovery rate (FDR)	False Discovery Rate	0.05	t	-2	1	766
1920	473E403D-3FAD-2E5A-5FA5-FEE820BBD857	--min-alignment-count=	The minimum number of alignments in a locus for needed to conduct significance testing on changes in that locus observed between samples	Minimum per-locus counts for significance testing	10	t	-2	1	767
1940	4A9505DB-CA1B-0FB9-27BA-CF2F7D109452	--appid=		Parameter 2	bx_refseq_pipeline-1.0.0	f	1	12	\N
1941	CFFA2618-B0F3-8492-A7A2-FCFA4AB592F3	--processorCount=		Parameter 3	128	f	2	1	\N
1942	4BC66396-9EBE-8634-1651-CFF419EF8D2C	--requestedTime=		Parameter 4	24:00:00	f	3	12	\N
1943	B66EF84B-C01A-9CD9-6F85-9DB8C5D696CF	--maxMemory=		Parameter 5	2	f	4	1	\N
1957	57FF93E0-4EA9-46FF-F629-250E91C5E06E	-d 		Distance used to calculate background expression	1000	t	3	1	780
1958	E1054F7F-3B09-695F-9751-A128E3FC7619	-l 		Sequence read length (bp)	36	t	5	1	781
1959	706AFA55-59C8-D7D8-827D-B9AC476AF440	-m 		Maximum multiple hits	25	t	6	1	782
1960	2C295AB3-6433-C7E2-D852-A367AB454DC1	-e 		Mismatches allowed	2	t	4	1	783
1961	9025CF83-72CE-ED33-319B-AE063DAD48B6	-p 		Gap opens allowed	2	t	7	1	784
1962	9D58A70E-331A-842E-7037-E14664030F95	-w 		Half-junction size	18	t	8	1	785
1989	262942EC-ED5A-B937-7A3C-BFD99A0A042B	-a 		Analysis		t	2	16	\N
1990	997FF6CD-0C54-5870-B5AC-A10B5327D099			cDTT = for disparity through time analysis; cDTT.CI for DTT analysis with confidence intervals		t	-1	6	\N
1991	938E5596-E0C0-A877-2A14-C3F8EB41D25F	-m 		mdi	1	t	5	16	\N
1992	3EB5C290-536A-0413-CABA-3C45B79D9BE0	-o 		confidence (not required for DTT analysis)	0.95	t	6	11	\N
2011	73DD17B1-24DF-5160-B6C1-080A9255CFD5	-c 		Community Analysis	comdistn	t	5	12	\N
2012	0B51E7FC-DA4D-52A1-74D7-07285532EC82	-r 		Number of Randomizations	999	t	6	1	\N
2013	9E856955-4DB3-FC93-723F-DA30BB1A9818	-m 		Null Model	taxa.labels	t	7	12	\N
2014	338ADE86-563F-D992-21A7-2BC7664212C0	-a 		Weight by Abundance?	false	t	8	5	\N
\.


--
-- Data for Name: property_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY property_group (hid, id, name, description, label, group_type, is_visible) FROM stdin;
1			\N		step	t
2	idPanel0	Options	\N	Select parameters	step	t
3	idPanel0	Options	\N	Select parameters	step	t
4	idPanel0	First Panel	\N	Options	step	t
5	idPanel0	First Panel	\N	Options	step	t
6	idPanel1	Filtering	\N	Filtering	step	t
7	idPanel1	Options	\N	Options	step	t
8	idPanel0	Base Calling	\N	Base calling	step	t
9	idPanel0	Select Libraries	\N	Select Libraries	step	t
10	idPanel0	Select Libraries	\N	Select Libraries	step	t
13	idPanel1	Select output details	\N	Select output details	step	t
14	idPanel1	Select output details	\N	Select output details	step	t
15			\N	Set parameters	step	t
16		Set parameters	\N	Set parameters	step	t
17	idPanel0	Manage Barcodes	\N	Manage barcodes	step	t
18	idPanel3	Convert Scoring	\N	Convert scoring	step	t
22	idPanel0	Name Resolution	\N	Name Resolution	step	t
23	idPanel0	Options	\N	Options	step	t
24			\N	Set parameters	step	t
25	gfa0110c27af04d5e8a3d9a0c638fe524		\N	Sequence Type		t
26	g11bb51e429734cac9d7a7cff8beb8760		\N	Sequence Type		t
27	gbe7df512b4a441898d8e298a79a002ec		\N	plot		t
28	g9e3f4bc700e84f219f22aabf9ba7c4b4		\N	plot		t
29	202BF6EA-99A7-10E7-712C-0960FADB0FEA		\N	score	Text	t
30	g635f36ed086743e097d37e7fbea209a3		\N	parameters		t
31	gdb7ac598beb54add8316ee86f28c6bf8		\N	kVal		t
32	g613bc72ef3df43ff826fcab124637d1f		\N	Group 1		t
34	g2e4b71e523e24d34b188a01255009b56		\N	Group 1		t
35	gfb88ee4a20e74264bb5281aabfc7a9cc		\N	options		t
36	g91a81893da3a4b63b8f215500b7f70db		\N	Group 1		t
265	g1abb2e68a5194c70bf9aa4803cc2d8cf		\N	General Options		t
266	47D6BD61-D10E-1AB1-CDEB-D9374CE6FAAA		\N	Advanced options	Text	t
267	CF45B5B3-F1FD-D249-306D-2335F9958E78		\N	Bootstrap Options	Text	t
40	g52d60978aa704eedafddf3819eedb7e1		\N	Group 1		t
269	ED2DBAFB-EEDE-1437-82D9-873CA1ACA06B		\N	Remove non-biological sequences		t
45	gf15ff8ace7fd4e0e9dc4fd2363af2da1		\N	Output options		t
46	g4d61628517b54641a99cfce97ad4a135		\N	Group 1-kk		t
47	5505AD32-A623-659E-B3EB-F0AF34CB6F63		\N	Group 2-kk	Text	t
48	g6114781cc5ad481a818087f36a717942		\N	Group 1-kk		t
49	5505AD32-A623-659E-B3EB-F0AF34CB6F63		\N	Group 2-kk	Text	t
50	g9977de35f0d34aa5a8570b92b46e5518		\N	Remove non-biological sequences		t
51	g4126ebaa50504bb6ab1f47035bb6139f		\N	Group 1		t
52	g808947327f0e44e9bd30841a40cb36e1		\N	Group 1		t
53	g2fb385051f9d4b81b74bf8befca42329		\N	Group 1		t
272	66961C16-30C5-DEB4-120C-D7ED2473802B		\N	Options		t
55	g861fa54f21b8412db8d157ddee813efb		\N	Input Options		t
57	g6bdeb5f1d82545ec93bf2431848265bf		\N	Parameters		t
59	g2cc8aec73f754347b82a59b896b18250		\N	Advanced		t
60	gb1403cf0a0ac4ba187f3740b7c99cc66		\N	Parameters		t
61	g1766d06901524a7a9b61cddbd492b975		\N	Group 1		t
62	gf3576b1be84f4b2985d46e1510c6a19b		\N	Select Params		t
63	1AFBD708-5106-E12D-0B53-0CBC95E5B5C7		\N	New Group	Text	t
64	gf2ef5db4ef694e17bdeb3b98cf43d480		\N	Parameters		t
65	gbcfd2f7d3e77407d92ce7c083d5e2c46		\N	Parameters		t
66	g73902dca900c4f299728f818a11f0aad		\N	Parameters		t
67	896DE3A6-3344-0CCB-E1CA-16F361CC97E9		\N	Phase and Work Code	Text	t
68	g513f119a82694903871735b94674d7ee		\N	Parameters		t
275	57EB6494-7A36-5BF3-59DE-42D623F4E495		\N	Options		t
276	91D14F2B-9C91-7A15-63C5-472D8AD5FE79		\N	Options		t
71	g85f5eead40654698986ea0830652595a		\N	Group 1		t
283	gfa6258e48b6540758bdd54772d6ca00c		\N	Options		t
285	gdf74e6938cc8468190990b0a3b9cba14		\N	Options		t
291	 	group1	\N	Parameters	step	t
80	gfadad84b743149d4bbeb7e7fe560bb05	group1	\N	Import sequence archive	step	t
83	 	group1	\N	Options	step	t
292	6B46E2BA-D5C8-6F5A-D534-C679650DA7ED		\N	Parameters		t
89	 	group1	\N	Regular Expression	step	t
90	g4a6bd28b234343fea6ba8dc8299d61f4	group2	\N	Options	step	t
91	g9a362e539d074a4da644c51156ef3b18	group1	\N	Options	step	t
422	B963BF29-87CB-6D51-E371-12B564BABAEA		\N	Details		t
93	 	group1	\N	Options	step	t
302	217B17AC-CB60-C16B-FFA2-E4928A3BF650		\N	Sequence Type		t
303	5C4BC852-D750-910B-FF76-926DAE791820		\N	Sequence Type		t
96	ge8e2ff2a02fa4ae49e461a03a6f2574d	group1	\N	Options	step	t
97	 	group1	\N	Options	step	t
99	gf2e43757dacc4214b6bfe1860c6405c1	group1	\N	Options	step	t
306	E7665DF6-1AA3-26E4-4A1E-95ADC38FCB3F		\N	Parameters		t
307	248BC6A2-7C72-3F0E-3A67-CE773FA26D61		\N	Details		t
309	1D957FC1-65D5-E033-9D79-BEB15200E6E1		\N	Options		t
310	6CF31073-3800-949A-27FD-D4BECA167004		\N	Output options		t
128	gdb076ff792f140819cdf6ee1a6760c6f	quality	\N	Options	step	t
129	 	running_mode	\N	Running modes	step	t
151	84E5B1EF-05FD-1CCF-6805-8701418AB872		\N	Options		t
152	84E5B1EF-05FD-1CCF-6805-8701418AB872		\N	Options		t
177	g271592f4679d4a788cbe1d5f7f3ad091		\N	Options		t
178	578BA879-297F-31A8-D131-3826DE374865		\N	Bootstrap Options (Optional)	Text	t
287	gca18485a63cf41a3bcee24665edada1c		\N	Options		t
289	DFA220F0-854A-5A91-AEFE-E09430A0627D		\N	Formats and options		t
290	D6A22D4C-1ECC-F0C3-8988-F9629DA6EB25		\N	Output		t
425	891DFF1E-23FB-5C13-D727-263E4DD8E715		\N	Assembly Options		t
426	D9F0EFAC-F304-C69D-52A0-2245CA09DE99		\N	Run Options		t
427	g9190aebab5aa493c9f634ac7d6caccbf	group1	\N	Options	step	t
429	ga626a68c4e2d426d884bb0d65ef70165	group2	\N	Options	step	t
299	 	group1	\N	Options	step	t
300	gd97ed90e2a4247e686bf8bc4f53d2aa3	group1	\N	Parameters	step	t
430	 	group3	\N	Networks	step	t
304	01AA795D-D837-9C68-950A-F4A82355D86A		\N	Group 1		t
431	 	group1	\N	Options	step	t
436	 	group1	\N	Options	step	t
316	1D957FC1-65D5-E033-9D79-BEB15200E6E1		\N	Options		t
212	optionsGroup		\N	Options		t
221	gec492f6a5d9f4e7fbba5528a8deb84dd		\N	Options		t
222	40660F23-3067-91C0-C97C-2F5035662ACE		\N	Bootstrap Options	Text	t
223	g5e659e1402fd43deaec5c06c0cd54fc7		\N	Options		t
224	F90D0138-D997-EB1B-ABBA-22B12BE92CCB		\N	Bootstrap Options	Text	t
231	optionsGroup		\N	Options		t
235	gbc8528ac650542d0b5cd95d4db2b9997		\N	General Options		t
236	3BEA163B-3018-B0CF-8D7C-256F69F4212A		\N	Advanced Options	Text	t
237	F56CA966-A5D5-6DE4-8CED-58451D8665C9		\N	Bootstrap Options	Text	t
245	7A49B5C2-6A14-80DA-BC84-407422380EC3		\N	Group 15		t
247	1A86F973-DB4D-2675-487E-7D1904DBC8B8		\N	Set parameters		t
248	01740D77-1D4F-E8BF-5421-25D2DEA025A2		\N	Select Parameters		t
249	g7f7ee5c57f4d438d9189fc8a14993e97	group1	\N	options	step	t
250	g2c1604c95de343a7a05279f7a56c9522	group1	\N	options	step	t
254	473BF70A-C999-F941-EE6C-BD9F735A8E6E		\N	Group 1		t
255	DA461BA5-CC2B-9FC4-9E0B-31214B8B7DCC		\N	Group 1		t
257	D4B76878-00BB-504F-A917-D230A9918994		\N	Remove non-biological sequences		t
317	g0440260cd0884256bb8431ced4c2070b		\N	Options		t
318	A075BEBA-D4F3-AA08-A6FC-5870C9BE5598		\N	Bootstrap Options	Text	t
325	g9324aa29f1204068a46d384745fca27b		\N	Options		t
441	99B17B27-2EEB-C19E-EA44-6901B2D903CB		\N	Parameters		t
442	BBA8CB4A-C79D-D6EE-4C6B-FA4195074DF1		\N	Options		t
330	CA010822-78C9-DCE2-9736-76F8BA9793F8		\N	Sequence Type		t
331	061DB27F-ACDE-4197-EC1B-315066F2EC8E		\N	Remove non-biological sequences		t
444	5F6FBEC4-4AE9-496D-6E6D-69B492C3DE96		\N	Options		t
445	8180504A-881C-C29B-F9B2-C54BE8F938D7		\N	Options		t
339	48241CA6-4E37-EEF8-04A2-5D5C86F5F9A0		\N	Parameters		t
341	BB6D54CD-26BF-20AB-48C6-DF1E734EE803		\N	BordaParameters		t
450	CBCFD8DC-01F6-635B-FD2E-DF1F881F829E		\N	PL params		t
452	A7E010F1-9EDE-B969-0B27-880CFD3F5E66		\N	Disparity params		t
458	gdd04075193a44b17ac8011ddaacf82df		\N	Group 1		t
354	B387962E-F47F-EB5E-907D-8D5AA58328DD		\N	Parameters		t
362	ABC897B7-22DB-4AC2-878A-877BCFAABA9F		\N	Parameters		t
378	02AF2439-9F03-B0E3-0511-D4AC2DC5BFEF		\N	Group 1		t
384	A36D7B51-6CEA-A1A8-137E-E07091879A73		\N	Parameters		t
386	154EC204-5D15-AF95-DD05-206E62E2F734		\N	Parameters		t
395	3C5ABBA2-01BF-D0FC-F24D-B6D267653398		\N	Parameters		t
396	21BB6A59-CDAA-CB7C-EDFD-6A0465754739		\N	parameters		t
398	7BAE79B3-D572-92E9-7531-A41F0ACA9E4E		\N	parameters		t
\.


--
-- Data for Name: property_group_contract; Type: TABLE DATA; Schema: public; Owner: -
--

COPY property_group_contract (property_group_id, contract_id, id) FROM stdin;
\.


--
-- Data for Name: property_group_property; Type: TABLE DATA; Schema: public; Owner: -
--

COPY property_group_property (property_group_id, property_id, hid) FROM stdin;
1	1	0
93	380	2
93	381	3
93	382	4
93	383	5
93	384	6
29	159	0
303	1300	0
247	1156	0
247	1157	1
27	155	0
27	156	1
28	157	0
5	52	0
28	158	1
339	1441	0
152	798	0
152	799	1
16	125	0
16	126	1
16	127	2
152	800	2
26	154	0
152	801	3
341	1444	0
341	1445	1
152	802	4
152	803	5
378	1631	0
248	1158	0
14	122	0
378	1632	1
378	1633	2
378	1634	3
378	1635	4
152	804	6
152	805	7
152	806	8
152	807	9
152	808	10
152	809	11
152	810	12
13	118	0
13	119	1
13	120	2
13	121	3
15	123	0
15	124	1
248	1159	1
59	214	0
62	220	0
63	221	0
64	222	0
22	148	0
223	1052	0
223	1053	1
223	1054	2
224	1055	0
224	1056	1
330	1413	0
331	1414	0
331	1415	1
22	149	1
22	150	2
64	223	1
64	224	2
64	225	3
64	226	4
64	227	5
64	228	6
64	229	7
64	230	8
60	215	0
60	216	1
304	1301	0
304	1302	1
35	169	0
35	170	1
36	171	0
36	172	1
36	173	2
36	174	3
60	217	2
60	218	3
61	219	0
65	231	0
65	232	1
65	233	2
65	234	3
65	235	4
65	236	5
65	237	6
65	238	7
66	239	0
66	240	1
66	241	2
40	177	0
30	160	0
30	161	1
30	162	2
30	163	3
292	1274	0
66	242	3
66	243	4
66	244	5
67	245	0
316	1347	0
316	1348	1
316	1349	2
316	1350	3
316	1351	4
316	1352	5
316	1353	6
316	1354	7
316	1355	8
316	1356	9
316	1357	10
316	1358	11
316	1359	12
458	2011	0
458	2012	1
458	2013	2
67	246	1
68	247	0
31	164	0
68	248	1
68	249	2
68	250	3
45	181	0
212	1015	0
46	182	0
47	183	0
48	184	0
49	185	0
50	186	0
50	187	1
177	881	0
212	1016	1
212	1017	2
212	1018	3
212	1019	4
231	1099	0
68	251	4
458	2014	3
231	1100	1
231	1101	2
177	882	1
177	883	2
177	884	3
178	885	0
178	886	1
221	1046	0
231	1102	3
231	1103	4
231	1104	5
231	1105	6
231	1106	7
55	197	0
55	198	1
55	199	2
55	200	3
55	201	4
55	202	5
55	203	6
55	204	7
55	205	8
445	1957	0
221	1047	1
221	1048	2
445	1958	1
445	1959	2
91	370	0
445	1960	3
445	1961	4
445	1962	5
93	378	0
93	379	1
96	392	0
249	1160	0
250	1161	0
436	1913	0
436	1914	1
436	1915	2
436	1916	3
436	1917	4
436	1918	5
436	1919	6
436	1920	7
221	1049	3
222	1050	0
89	364	0
89	365	1
222	1051	1
90	366	0
90	367	1
90	368	2
90	369	3
83	348	0
83	349	1
444	1954	0
444	1955	1
265	1186	0
265	1187	1
265	1188	2
265	1189	3
266	1190	0
266	1191	1
266	1192	2
267	1193	0
267	1194	1
429	1870	0
429	1871	1
429	1872	2
429	1873	3
430	1874	0
23	151	0
9	73	0
9	74	1
9	75	2
9	76	3
9	77	4
9	78	5
9	79	6
9	80	7
9	81	8
9	82	9
9	83	10
9	84	11
9	85	12
9	86	13
9	87	14
275	1215	0
430	1875	1
430	1876	2
300	1293	0
300	1294	1
300	1295	2
9	88	15
430	1877	3
430	1878	4
430	1879	5
430	1880	6
275	1216	1
275	1217	2
245	1153	0
430	1881	7
444	1956	2
275	1218	3
275	1219	4
151	785	0
151	786	1
151	787	2
431	1882	0
431	1883	1
431	1884	2
255	1166	0
255	1167	1
255	1168	2
257	1171	0
257	1172	1
302	1298	0
302	1299	1
384	1678	0
384	1679	1
269	1196	0
269	1197	1
3	27	0
3	28	1
3	29	2
3	30	3
3	31	4
3	32	5
3	33	6
3	34	7
3	35	8
3	36	9
3	37	10
3	38	11
3	39	12
3	40	13
3	41	14
3	42	15
3	43	16
3	44	17
3	45	18
3	46	19
3	47	20
3	48	21
3	49	22
3	50	23
384	1680	2
384	1681	3
384	1682	4
384	1683	5
384	1684	6
384	1685	7
384	1686	8
2	2	0
2	3	1
2	4	2
2	5	3
2	6	4
2	7	5
272	1203	0
272	1204	1
272	1205	2
325	1402	0
276	1220	0
2	8	6
2	9	7
2	10	8
2	11	9
2	12	10
2	13	11
2	14	12
276	1221	1
57	208	0
57	209	1
57	210	2
2	15	13
2	16	14
2	17	15
2	18	16
2	19	17
2	20	18
2	21	19
2	22	20
289	1267	0
289	1268	1
289	1269	2
289	1270	3
289	1271	4
290	1272	0
386	1692	0
386	1693	1
386	1694	2
386	1695	3
386	1696	4
2	23	21
2	24	22
2	25	23
2	26	24
450	1981	0
151	788	3
151	789	4
151	790	5
151	791	6
151	792	7
151	793	8
441	1940	0
317	1360	0
317	1361	1
317	1362	2
317	1363	3
318	1364	0
318	1365	1
441	1941	1
441	1942	2
441	1943	3
442	1944	0
442	1945	1
128	597	0
128	598	1
128	599	2
128	600	3
128	601	4
129	602	0
129	603	1
129	604	2
442	1946	2
442	1947	3
442	1948	4
442	1949	5
442	1950	6
450	1982	1
450	1983	2
450	1984	3
151	794	9
151	795	10
151	796	11
151	797	12
17	128	0
17	129	1
17	130	2
17	131	3
17	132	4
17	133	5
422	1836	0
422	1837	1
422	1838	2
18	134	0
18	135	1
18	136	2
285	1252	0
285	1253	1
285	1254	2
285	1255	3
285	1256	4
285	1257	5
285	1258	6
452	1989	0
452	1990	1
452	1991	2
452	1992	3
99	399	0
97	393	0
97	394	1
97	395	2
97	396	3
97	397	4
299	1290	0
299	1291	1
299	1292	2
80	340	0
80	341	1
291	1273	0
309	1322	0
309	1323	1
309	1324	2
309	1325	3
309	1326	4
309	1327	5
309	1328	6
309	1329	7
309	1330	8
310	1335	0
310	1336	1
310	1337	2
309	1331	9
309	1332	10
309	1333	11
309	1334	12
354	1533	0
306	1305	0
306	1306	1
306	1307	2
307	1308	0
362	1565	0
362	1566	1
395	1729	0
395	1730	1
395	1731	2
395	1732	3
395	1733	4
395	1734	5
395	1735	6
427	1867	0
396	1736	0
396	1737	1
396	1738	2
10	89	0
10	90	1
10	91	2
10	92	3
10	93	4
10	94	5
398	1746	0
235	1116	0
235	1117	1
235	1118	2
235	1119	3
236	1120	0
236	1121	1
236	1122	2
237	1123	0
237	1124	1
398	1747	1
398	1748	2
398	1749	3
10	95	6
10	96	7
10	97	8
398	1750	4
398	1751	5
398	1752	6
10	98	9
10	99	10
10	100	11
10	101	12
10	102	13
10	103	14
10	104	15
4	51	0
8	67	0
8	68	1
8	69	2
8	70	3
8	71	4
8	72	5
6	53	0
6	54	1
6	55	2
6	56	3
6	57	4
6	58	5
6	59	6
6	60	7
6	61	8
6	62	9
6	63	10
6	64	11
7	65	0
7	66	1
24	152	0
34	168	0
254	1165	0
287	1262	0
287	1263	1
287	1264	2
283	1246	0
283	1247	1
283	1248	2
425	1852	0
425	1853	1
425	1854	2
425	1855	3
425	1856	4
425	1857	5
425	1858	6
425	1859	7
425	1860	8
426	1861	0
426	1862	1
426	1863	2
426	1864	3
426	1865	4
426	1866	5
25	153	0
\.


--
-- Data for Name: property_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY property_type (hid, id, name, description, label, deprecated, display_order, value_type_id) FROM stdin;
2	pt2cf37b0d-5463-4aef-98a2-4db63d2f3dbc	ClipperSelector		\N	t	999	\N
3	ptbea4f078-6296-4511-834a-27b6bc3c88ab	Script		\N	t	999	\N
4	pt9935e153-5765-4c2e-a2bc-676f88b11267	Mode		\N	t	999	\N
13	pt553f6a79-329e-470b-b827-ebbf2d2811f1	BarcodeSelector		\N	t	999	\N
14	pt8d7dfb62-2ba4-4ad1-b38e-068318200d9b	TNRSFileSelector		\N	t	999	\N
6	ptc5b85c6b-381e-44f6-a568-186f1fe7f03d	Info	Informative static text	\N	t	8	1
12	ptffeca61a-f1b9-43ba-b6ff-fa77bb34f396	Text	A text box (no caption or number check)	\N	f	1	1
1	ptd2340f11-d260-41b4-93fd-c1d695bf6fef	Number	A text box that checks for valid number input	\N	f	2	3
10	ptf22ca553-856b-4253-b0f3-514701ed4567	QuotedText	A text box that will add quotes for passing string to command line	\N	f	3	1
5	pt206a93d6-bac4-4925-89fe-39c073e85c47	Flag	A checkbox for yes/no selection	\N	f	5	2
8	ptbabc3c29-39c2-47b5-8576-f3741f9ae329	Selection	A list for selecting a choice (can be text)	\N	f	6	1
9	pt7c71012b-158d-44fd-bda1-a5fb4d43bfd8	ValueSelection	A list for selecting a value (numeric range)	\N	f	7	3
15	F03DD9AC-B586-4FE1-A75B-3E2967BD0207	MultiLineText	A multiline text box		f	9	1
11	pt67bdfe81-361e-41fe-852a-35159e1e7bc5	XBasePairs	A text box with caption (x=user specified number)	\N	f	4	3
16	871AA217-2E6C-48E2-880A-EE7815E8F7F8	XBasePairsText	A text box with caption (x=user specified text)		f	4	1
\.


--
-- Data for Name: rule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rule (hid, id, name, description, label, rule_type) FROM stdin;
72	re27050725c9b4f44801e8d6808c650ec		\N		5
73	r5aac2e72e21344bb9e54abc09c87d385		\N		5
74	r4bcb3f3afae5462699eebc0a84453187		\N		5
77	ra0ca6d2343654bcf9d63980cb819b3cb		\N		5
78	rb755525d0c7743b88fa1c47e86a27324		\N		6
223	r2b5f4e3bb9f64dcc9e2d302bbd6a6345		\N		2
82	rb8476c55d98d48a29e7f2beb5f432267		\N		5
83	r7aa6a805bd6d4fa5b68e9c2040d9e9dc		\N		2
84	r62155f16ac26486587fc5a506029cb13		\N		2
224	r267b328e8c9c47569f5314aa23509f8b		\N		2
225	r657968bcbc47435ba0b7f9122ee55c0b		\N		2
226	r258472e5de89472f8e0c5af906fc8995		\N		2
227	r10ccc83427f1403d999360b9f21a9d3d		\N		2
228	r991f5073445c4cf2a1417a3bbacdc7e8		\N		2
229	raafd9e4d31474c3caff4f777ce168cb2		\N		2
230	rf4ee1287396f4435933717ff2d176074		\N		2
328	r9e240c8e105646d294fc22a0c2356eb4		\N		5
329	r975b24143ae24d69b73e3c1e35054fbd		\N		5
330	r1ef640d8542d4620bdd17964c10cf6a6		\N		5
331	r0245f1b5cb754d2b848f2bffd01c9815		\N		5
335	r4e473e0e1a60439285f024af56a5453f		\N		5
336	r675955f75d17492b910e1aa2bb65c1fd		\N		5
337	rd2cff000ba39488e89489b0fc16c9a34		\N		5
249	r4b439b031b334e3687cba127a9385c89		\N		5
338	r9be1c18f27004851b5f15b62649120de		\N		5
251	r8209fa2b0a3c4db6981df18505c8bd61		\N		5
252	r77a2140c6feb422b930c1298fb8143d2		\N		5
342	r09ccc279803c40db97f2320c2ecaed4a		\N		2
343	r357dfbf6104c41afb89ef78323c56ccf		\N		2
259	rceec008aff4645f1b2fd7ba318d1fb9b		\N		5
276	r387784368db54f428ead6d3a8dee16ef		\N		2
277	rbd1e0a933fac475994299fc2759b6f37		\N		2
278	r2a53d9e570bc43a0845b56ae158d7778		\N		3
279	rae29cedad5c54e9d88d82cc8b9549bb5		\N		3
280	rd85328d201694ea7b451843513bc45ef		\N		5
281	r68cf824e903c4100b44f3159ad1dd96c		\N		5
282	r8715eef947cc4467bb4ebf4161537417		\N		5
283	r15a3ec01c0e149378e23d6b63abdfd15		\N		5
286	r57fbc0b4d5f44af68bebfdfd0aa26085		\N		2
287	r97b876d876eb424d9be846afa35acaf5		\N		2
293	rd935a51338bb469dad739af6b3395388		\N		5
295	rc2bbc01661ba49d9be73c2000716bced		\N		2
296	r2ff9152124a94acf846627aa9c6e7726		\N		2
299	r46f4c94d8293442bbb1d97955616f07b		\N		5
304	r01ebdff865914b238835f4cc271d6e5d		\N		5
305	r3e477ece16c541f9a29ae612ec779587		\N		5
306	rea8e417bcb8a4a4e84e63a4f337c7419		\N		5
319	r84e747d12fc746b790a798049aa66b69		\N		2
320	rda8cc9fe6d404c56a3c84c8f68159ae5		\N		2
323	r2ebcc03c90c8441e8bdf63ed50985814		\N		2
1			\N		2
2			\N		2
3			\N		2
4			\N		2
5			\N		5
6			\N		6
7			\N		3
8			\N		3
9			\N		6
10			\N		5
11			\N		2
12			\N		2
13			\N		2
14			\N		2
15			\N		2
16			\N		2
17			\N		2
18			\N		2
19			\N		2
20			\N		2
21			\N		2
22			\N		2
332	r103807b187974bcc8526dd9d8e39b479		\N		2
340	r27e0ba6c5fba4ca2a78bdfdbcb1fe44c		\N		5
341	rfc5d029392a143599ba538aa43800e41		\N		5
344	rd49c6eb738844e73864e1192b52bb821		\N		8
90	r67ea6c39252b41df94fd9f3bbdc3009c		\N		5
91	r53706e740019450b9bc6ed72346cb2d0		\N		5
92	r4f6b12ad927c44aa8a09095e623457c0		\N		3
93	r481b561ce3ed4081ad80b74e1d086a8e		\N		5
94	r17f30121c4de45818bda92d9594bffdc		\N		5
98	r2678c48aa567486fbbe8485d9949399c		\N		5
99	r757a5880252442b68c115a1758e8470d		\N		2
100	rea472c7fea204a60b905869c4dafdd25		\N		2
101	re8e3c5bb6bc2477083fc07950d620b73		\N		5
102	ra6cd18e4d50747c591a85e40fee365e4		\N		2
23			\N		2
24			\N		5
25			\N		6
26			\N		3
27			\N		3
28			\N		6
29			\N		5
30			\N		2
31			\N		2
32			\N		2
33			\N		2
34			\N		2
35			\N		2
36			\N		2
37			\N		2
38			\N		2
39			\N		3
40			\N		3
41			\N		2
42			\N		2
43			\N		2
44			\N		2
45			\N		5
46			\N		6
47			\N		3
48			\N		6
49			\N		5
61			\N		6
62			\N		3
63			\N		5
326	r587a5e1fefa94bda93b6ef768e0cb767		\N		3
327	rc1eea91f30154a258837abcd7ae63d24		\N		3
103	rebac343d272a48d08df31c98b221dc6f		\N		2
104	reacfb888420f46ff87443aac0223d4d8		\N		2
105	rd298ed2aff174c6db8ce11adde8414b3		\N		3
106	r777ac77efd0c40688ef4b1605365b192		\N		5
107	r1dac32c429f24fd7880af654fa628d90		\N		3
108	r5c1d7c4d0d844a7691149cb87ebd7b4f		\N		5
133	rc0306311c3214339bd5c5fa4549b1bda		\N		5
136	rebe4f9d6fc2e4b319f57da72442c18b7		\N		2
139	r08ff83d9879d41499853cc5f7447d639		\N		5
140	r73ba9219ed284927a70ed9e60ed2eb19		\N		5
143	r03c6d7288b35434d8c0701a1799b4777		\N		2
189	rb724a9be18eb4bfd97f573c1d518fc30		\N		5
190	r09930d0abadd4933a30ec82191adda1e		\N		5
471	r89f7a32af07a4972ad2fe2826dbbf9e8		\N		3
472	r50a37fc9310a40b384418f7d55404359		\N		2
473	rfb74e6109bcd440da9ba79ab41c4220e		\N		8
474	rae8a1a49c8834da7acb5fa1d09af9df4		\N		2
475	r02df4657ff1449aeb1b527d0dcd93ed7		\N		2
476	r4813cd76d0b146bf8a0ae65271bfb9d7		\N		2
477	r7d30d512aa19496aa354c52f8310acea		\N		5
478	r00491342844e4f6891ad1f0060c2bbb0		\N		10
479	r8e25aad505e64f2d9ef7b2e39ec0f021		\N		5
480	re9488ff5a7b64694976031502dec1ced		\N		5
372	r1a427e06b31f41369b0f0d19369d07e9		\N		5
481	r955cbd354d7644fc8bdee05fbd99a6a3		\N		2
374	re78be3d1e7fe47a396e0f68c5ff63902		\N		5
375	r211155d40e5a42eeb9da065239a569c2		\N		2
482	r7154bc914995430696d979385cc2b9c5		\N		5
483	rd2f6193c61644d5cbe092e0b97a2ebe9		\N		5
484	r9fdc04f5205b4259b87d6d66021592e0		\N		5
501	r8ecc13ea9f9b40cf9b37fea7a3ef685e		\N		5
502	r3fec9b699b914974b780c2cf0098db5b		\N		5
503	r03a199366e084de199ec2a6a250a36e8		\N		6
504	rd5189323baa64310b62735d4f8a0fd76		\N		2
508	ra50d540dd86b4aec91079d3465084c3a		\N		10
509	r5a042fa52b3544da9f861a3d9a313f9f		\N		6
510	r6bb9c0f581a14ee8b7651e1984d03c68		\N		5
512	rbf6cf21e54c34fae91ce634d41b7db10		\N		5
431	re642db24d60f4f308602120ba967d543		\N		2
432	r1e8ce70d373645379a0b2f2127e3bc00		\N		5
435	r9da840a362a54ddcadb2c322563b021c		\N		5
436	rab26899444da478da3e5e20842ec785f		\N		5
\.


--
-- Data for Name: rule_argument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rule_argument (rule_id, argument_value, hid) FROM stdin;
286	0	0
287	1	0
341	auto	0
341	protein	1
341	dna	2
332	0	0
323	0	0
295	0	0
296	28	0
61	0.0	0
61	100.0	1
90	yes	0
90	no	1
91	yes	0
91	no	1
92	0	0
92	1000000	1
93	yes	0
93	no	1
94	yes	0
94	no	1
77	MGSA	0
77	Parent-Child-Intersection	1
98	Forward Stepwise Regression	0
98	Backward Elimination Regression	1
98	Forward Regression with Backward Elimination	2
99	0	0
100	0	0
101	on	0
101	off	1
102	0	0
103	0	0
104	0	0
105	0	0
105	10000	1
106	on	0
106	off	1
107	1	0
107	9	1
108	on	0
108	off	1
471	17	0
471	63	1
374	auto	0
374	dna	1
77	Parent-Child-Union	2
77	Term-For-Term	3
77	Topology-Elim	4
77	Topology-Weighted	5
78	0	0
78	0.5	1
74	find best lambda value	0
74	run PL with user input for lambda	1
74	find best lambda and use it in PL analysis	2
282	GTRCAT	0
282	GTRMIX	1
282	GTRGAMMA	2
282	PROTCAT	3
82	gi only	0
82	full info (gi, accession, id, species name, taxon id)	1
82	short info (gi, short species)	2
82	species (gi, species name)	3
83	0	0
84	1	0
282	PROTMIX	4
282	PROTGAMMA	5
283	None (nucleotide sequences)	0
249	4	0
249	3	1
249	2	2
249	1	3
249	0	4
472	0	0
473	0	0
474	0	0
139	Both	0
139	First_Not_Second	1
139	Second_Not_First	2
139	Both_Plus_Unpaired_From_First	3
139	Both_Plus_Unpaired_From_Second	4
139	All	5
140	tab	0
140	,	1
140	.	2
140	:	3
475	-1	0
140	|	4
140	-	5
140	_	6
252	Jones-Taylor-Thornton matrix	0
252	Henikoff/Tillier PMB matrix	1
252	Dayhoff PAM matrix	2
276	0	0
277	0	0
252	Kimura formula	3
143	0	0
252	Similarity table	4
476	-1	0
374	protein	2
477	{"isDefault":false,"value":"--peAligner=KAligner","display":"KAligner"}	0
477	{"isDefault":true,"value":"--peAligner=bwa","display":"BWA"}	1
278	0	0
278	60	1
279	0	0
279	100	1
280	Auto	0
280	DNA	1
280	Protein	2
281	Auto	0
281	DNA	1
281	Protein	2
477	{"isDefault":false,"value":"--peAligner=bowtie","display":"BOWTIE"}	2
259	4	0
259	3	1
259	2	2
259	1	3
259	0	4
478	[A-Za-z0-9]+	0
479	{"isDefault":false,"value":"--requestedTime=01:00:00","display":"1 h"}	0
479	{"isDefault":false,"value":"--requestedTime=04:00:00","display":"4 h"}	1
479	{"isDefault":false,"value":"--requestedTime=08:00:00","display":"8 h"}	2
479	{"isDefault":true,"value":"--requestedTime=12:00:00","display":"12 h"}	3
479	{"isDefault":false,"value":"--requestedTime=24:00:00","display":"24 h"}	4
480	{"isDefault":false,"value":"--processorCount=16","display":"Small (Bacterial or Plastid)"}	0
480	{"isDefault":true,"value":"--processorCount=64","display":"Transcriptome, Single Flowcell"}	1
480	{"isDefault":false,"value":"--processorCount=128","display":"Transcriptome, Multiple Flowcell"}	2
46	0.0	0
46	1.0	1
47	1	0
136	0	0
337	tab	0
337	,	1
337	.	2
337	:	3
337	|	4
337	-	5
337	_	6
338	tab	0
338	,	1
338	.	2
338	:	3
338	|	4
338	-	5
338	_	6
283	DAYHOFF	1
283	BLOSUM62	2
47	10	1
48	0.0	0
375	0	0
48	1.0	1
49	0	0
49	10	1
49	20	2
49	30	3
49	40	4
49	50	5
49	60	6
39	1	0
39	100	1
251	F84	0
251	Kimura 2-parameter	1
251	Jukes-Cantor	2
251	LogDet	3
251	Similarity table	4
40	1	0
73	aa	0
73	nt	1
293	Jones-Taylor-Thornton	0
293	Henikoff/Tillier PMB	1
293	Dayhoff PAM	2
342	0	0
343	4	0
20	3	0
21	-1	0
22	0	0
23	0	0
24	Input quals are from GA Pipeline ver. < 1.3	0
24	Input quals are from GA Pipeline ver. >= 1.3	1
24	Qualities are given as space-separated integers	2
25	0.0	0
25	1.0	1
26	1	0
26	8	1
27	0	0
27	10000	1
28	0.0	0
28	1.0	1
29	Not strand-specific	0
29	Rightmost end of fragment is sequenced first.	1
29	Leftmost end of fragment is sequenced first.	2
30	-1	0
31	0	0
32	0	0
33	0	0
34	0	0
35	0	0
36	0	0
37	0	0
38	0	0
1	3	0
2	-1	0
3	0	0
4	0	0
5	Input quals are from GA Pipeline ver. < 1.3	0
5	Input quals are from GA Pipeline ver. >= 1.3	1
5	Qualities are given as space-separated integers	2
6	0.0	0
6	1.0	1
7	1	0
7	8	1
8	0	0
8	10000	1
9	0.0	0
9	1.0	1
10	Not strand-specific	0
10	Rightmost end of fragment is sequenced first.	1
10	Leftmost end of fragment is sequenced first.	2
11	-1	0
12	0	0
13	0	0
14	0	0
15	0	0
16	0	0
17	0	0
18	0	0
19	0	0
480	{"isDefault":false,"value":"--processorCount=256","display":"Medium-sized Genome"}	3
72	Auto	0
501	{"isDefault":false,"value":"--total-hits-norm ","display":"Normalize by total hits"}	0
501	{"isDefault":true,"value":"--compatible-hits-norm ","display":"Normalize by hits to known transcripts"}	1
502	{"isDefault":false,"value":"","display":0}	0
503	0	0
40	100	1
41	0	0
42	0	0
43	0	0
503	1	1
504	0	0
133	Tab	0
133	Comma	1
133	Dash	2
133	Underscore	3
133	Pipe	4
133	Dot	5
133	Whitespace	6
72	DNA	1
72	Protein	2
44	0	0
45	0	0
45	10	1
45	20	2
45	30	3
45	40	4
45	50	5
45	60	6
431	0	0
432	csn	0
432	rsn	1
326	0	0
326	40	1
327	0	0
327	100	1
432	iqrn	2
432	sqrn	3
432	none	4
319	0	0
320	0	0
335	Uppercase	0
335	Lowercase	1
336	TAB	0
336	SPACE	1
336	COMMA	2
336	DOT	3
336	PIPE	4
336	DASH	5
336	UNDERSCORE	6
435	Bonferroni	0
435	None	1
435	Westfall-Young-Single-Step	2
435	Benjamini-Hochberg	3
435	Benjamini-Yekutieli	4
435	Bonferroni-Holm	5
435	Westfall-Young-Step-Down	6
436	Parent-Child-Union	0
344	0	0
436	Parent-Child-Intersection	1
436	Term-For-Term	2
436	Topology-Elim	3
436	Topology-Weighted	4
436	MGSA	5
189	region	0
189	resolution	1
190	sam	0
190	bowtie	1
190	eland	2
190	bam	3
190	bed	4
223	2	0
224	-1	0
225	-1	0
226	-1	0
62	1	0
62	100	1
63	Convert FASTQ-int format to the standard/Sanger FASTQ	0
63	Convert Solexa/Illumina (< 1.3) FASTQ to the standard FASTQ	1
63	Convert Solexa/Illumina (>=1.3) FASTQ to the standard FASTQ	2
63	Convert FASTA to the standard FASTQ	3
63	Convert various FASTQ-like format to FASTA	4
63	Convert Solexa export format to Sanger FASTQ	5
63	Convert AB SOLiD read format to Sanger FASTQ	6
304	PROTCAT	0
304	PROTMIX	1
304	PROTGAMMA	2
304	PROTGAMMAI	3
304	PROTMIXI	4
305	BLOSUM62	0
305	DAYHOFF	1
227	2	0
228	-1	0
229	-1	0
230	-1	0
512	Minimal (IDs only)	0
512	Full	1
512	Species names	2
512	Shortened	3
481	-1	0
340	Auto	0
340	Protein	1
340	DNA	2
299	Multiple sequence alignment (fasta)	0
299	Pair-wise distance matrix (phylip)	1
372	dna	0
372	protein	1
306	GTRCAT	0
306	GTRMIX	1
306	GTRGAMMA	2
306	GTRGAMMAI	3
306	GTRMIXI	4
508	[A-Za-z0-9_.]+	0
509	0	0
509	1	1
510	{"isDefault":true,"value":"--blastmode=top","display":"Top hits"}	0
328	Comma separated values 	0
328	Comma separated values without header	1
328	Newick	2
328	Nexus	3
328	List	4
329	Comma separated values	0
329	Comma separated values without header	1
329	Newick	2
329	Nexus	3
329	List	4
330	None	0
330	File 1	1
330	File 2	2
330	Both	3
331	None	0
331	File 1	1
331	File 2	2
331	Both	3
482	Arabidopsis thaliana	0
483	automatic	0
483	average	1
483	average_category	2
483	bp	3
483	mf	4
483	cc	5
484	flat	0
484	genes	1
484	xml	2
484	scores	3
\.


--
-- Data for Name: rule_subtype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rule_subtype (hid, id, name, description) FROM stdin;
1	B85DE8E1-7DDD-4F65-AD94-E896B74DC133	Integer	A whole number
2	CE7C5AD2-5FCA-4611-843F-791EEE1F6E87	Double	A real number
3	6BF5E9DB-86CB-4E6A-A579-0F3819E4FD68	String	Arbitrary text
\.


--
-- Data for Name: rule_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rule_type (hid, id, name, description, label, deprecated, display_order, rule_description_format, rule_subtype_id) FROM stdin;
3	rte04fb2c6-d5fd-47e4-ae89-a67390ccb67e	IntRange	Has a range of integers allowed	\N	f	1	Value must be between: {Number} and {Number}.	1
2	rt2c3eec11-011a-4152-b27b-00d73deab7cf	IntAbove	Has a lower limit (integer)	\N	f	3	Value must be above: {Number}.	1
6	rt58cd8b75-5598-4490-a9c9-a6d7a8cd09dd	DoubleRange	Has a range of values allowed (non-integer)	\N	f	2	Value must be between: {Number} and {Number}.	2
1	rt07303d4b-3635-4934-93e6-b24de4f2725b	IntBelowField	Needs to be less than another associated parameter	\N	t	5	Value must be below: {FieldRef}.	1
4	rte1afc242-8962-4f0c-95be-5a6363cdd48b	IntAboveField	Needs to be greater than another associated parameter	\N	t	6	Value must be above: {FieldRef}.	1
7	rtaebaaff6-3280-442d-b45e-6fd65e2d2c80	IntBelow	Has a higher limit (integer)	\N	f	4	Value must be below: {Number}.	1
8	87087b30-e7af-4b04-b08f-49baf5570466	DoubleAbove	Has a lower limit (double)	\N	f	8	Value must be above {Number}.	2
9	716a791b-47f3-4a53-9585-ed2f731a47f8	DoubleBelow	Has a higher limit (double)	\N	f	9	Value must be below {Number}.	2
10	4b4ee99b-2cf2-4ff8-8474-73fc6a1effa7	Regex	Matches a regular expression	\N	f	10	Value must match regular expression {String}	3
5	rt0621f097-1b31-4457-812b-c8ca70bfbe14	MustContain	Must contain certain terms	\N	t	7	Value must contain: {List}.	1
11	2D531048-A876-4B5D-8D21-54074910C721	CharacterLimit	Value must contain at most a maximum number of characters		f	11	Value must contain at most {Number} characters.	3
\.


--
-- Data for Name: rule_type_value_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rule_type_value_type (rule_type_id, value_type_id) FROM stdin;
1	3
4	3
7	3
8	3
9	3
10	1
11	1
2	3
6	3
3	3
5	1
5	3
\.


--
-- Data for Name: step_precedence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY step_precedence (hid, id, name, description) FROM stdin;
\.


--
-- Data for Name: step_precedence_constraints; Type: TABLE DATA; Schema: public; Owner: -
--

COPY step_precedence_constraints (step_precedence_id, precedence_constraint_id, hid) FROM stdin;
\.


--
-- Data for Name: step_precedence_inbound; Type: TABLE DATA; Schema: public; Owner: -
--

COPY step_precedence_inbound (step_precedence_id, transformation_step_id, hid) FROM stdin;
\.


--
-- Data for Name: step_precedence_outbound; Type: TABLE DATA; Schema: public; Owner: -
--

COPY step_precedence_outbound (step_precedence_id, transformation_step_id, hid) FROM stdin;
\.


--
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template (hid, id, name, description, label, type, component_id) FROM stdin;
1	t65ad6c869e45445882d8d283e99e863c	Handle Fastq Paired End Reads	\N	Handle Fastq Paired End Reads	preprocessing	c25d1206fbd2543fd90f8ce76d363087b
2	tafa3108f6b222163b584cfb5499e4f58	TopHat Paired End for Illumina	\N	TopHat Paired End for Illumina	UHTS Alignment Tools	c4b3ebdd32137419b820ba3ddbd7d141e
3	tb584cfb5499e4f58afa3108f6b222163	TopHat Single End for Illumina	\N	TopHat Single End for Illumina	UHTS Alignment Tools	c4b3ebdd32137419b820ba3ddbd7d141e
4	t259a86b292964cb4bae61400993f2af0	Merge Input files	\N	Merge Input files	samtools	c4b3ebdd32137419b820ba3ddbd7d141e
5	t35698bf3f770431dac9ec86069ccb2ce	Merge Input files	\N	Merge Input files	samtools	c4b3ebdd32137419b820ba3ddbd7d141e
6	t6cf67a33e016493194be0978e01f47d9	Filtering	\N	Filtering	varfilter	c4b3ebdd32137419b820ba3ddbd7d141e
7	t5063fc675dc94877bc000eb5633e18aa	VCF converter	\N	VCF converter	VCFC	c4b3ebdd32137419b820ba3ddbd7d141e
8	t2d6ebb74f29a498cbc0ad3d01b80e3a1	Base calling	\N	Base calling	samtools	c4b3ebdd32137419b820ba3ddbd7d141e
9	td0c69efa6ee5440c83c3168c6a8030c3	Align - bwa	\N	Align - bwa	Bwa	c4b3ebdd32137419b820ba3ddbd7d141e
10	t3e5fa5b431a74a1390eca8c870ee6690	Align - bwa	\N	Align - bwa	Bwa	c4b3ebdd32137419b820ba3ddbd7d141e
13	t67151b1dea3a4aee84bfea14015c11a8	Independent Contrast	\N	Independent Contrast	IndependentContrast	c4b3ebdd32137419b820ba3ddbd7d141e
14	t67151b1dea3a4aee84bfeb14015c11a8	Independent Contrast	\N	Independent Contrast	IndependentContrast	c4b3ebdf32237419b820bf1db0781412e
15	t319b9ca5e639468d800aee51b95b998c	Continuous Ancestral Character Estimation	\N	Continuous Ancestral Character Estimation	cace	c12bd559051333352e31302e3231d750adbbbb3b582a
16	t12bd045b75933352e31302e3231d0429321818ccf8c	Discrete Ancestral Character Estimation	\N	Discrete Ancestral Character Estimation	dace	c12bd559051333352e31302e3231d750adbbbb3b582a
17	t152be766a851453491e220ff7bea12de	FASTX Barcode Splitter (Single End)	\N	FASTX Barcode Splitter (Single End)	fastxsplitter	c4b3ebdd32137419b820ba3ddbd7d141e
18	td44b92b00cec4881ac49b4edad05c158	FASTQ Quality Rescaler	\N	FASTQ Quality Rescaler	fastxgroomer	c4b3ebdd32137419b820ba3ddbd7d141e
271	6211AFE4-2F7B-F850-127F-658521B30521	perltest3	\N	perltest3		c25d1206fbd2543fd90f8ce76d363087b
272	21F54682-5D2A-1B3C-BC5C-EDEA0CED1C1B	CONTRAST	\N	CONTRAST		c0da16dd996b14323b315b118ad3d1c74
22	t12af368916d33352e31302e3231d01170012afe3c9oldr	TNRS	\N	TNRS	TNRS	\N
23	t06132fa100a244878a31b84465a6e243	Bowtie merge input files	\N	Bowtie merge input files	bash command	c4b3ebdd32137419b820ba3ddbd7d141e
24	t0117d106b39d4081909f2cbfefbc4d29	Merge multiple sam files	\N	Merge multiple sam files	mergesam	c4b3ebdd32137419b820ba3ddbd7d141e
25	t649789b6669d43d09afbc4ba3f789e5d	MUSCLE-V4	\N	MUSCLE-V4		c73ef66158ef94f1bb90689ff813629f5
26	6C87D62D-236A-C9F7-1DF3-3B7E22926B1F	PhyML-3	\N	PhyML-3		c2d79e93d83044a659b907764275248ef
27	A491D1C1-CE61-56DA-8458-2C603F3B48EF	fastx_nt_distribution	\N	fastx_nt_distribution		c886d74d9b353404f9e254b7bfbc5ceaa
28	EF64AD00-9A14-EE88-1BD1-27E90ABDE244	fastx_qchart	\N	fastx_qchart		c226b4e9660b340d1aface5a571155948
29	E85D0F0E-1923-92A5-5D3C-7EDA880220DE	fastx_qstats_67	\N	fastx_qstats_67		cf7445ca29d734e32a05eacd5ba6b4b8c
30	37A7E123-A7FA-7B91-9C44-0D96289FB6AC	Find Lambda and run PL	\N	Find Lambda and run PL		c12bd559051333352e31302e3231d750adbbbb3b582a
31	E8C72058-3156-0690-F11B-237E91AA01C2	Borda_Jason	\N	Borda_Jason		c972a44a0f7ce497c94b63c92a15d685e
32	4385F2B5-D091-E6BC-CB04-671CE13E2936	cuffcompare	\N	cuffcompare		c156679abb02947378b9b2c215103a96e
34	C43EB684-46C8-5A3B-137A-3B52F695958D	ouch	\N	ouch		c12bd559051333352e31302e3231d750adbbbb3b582a
35	EDB07330-4871-FA7C-64A2-0F69ADC02CBD	vcf_to_gff_4	\N	vcf_to_gff_4		c2bfb48795daa4c418c4de99646128949
36	068355FC-ACFA-99A3-58E3-9998608B4BC8	ontologizer_v4	\N	ontologizer_v4		c4b3ebdd32137419b820ba3ddbd7d141e
384	t59f7d38c7a714ea5a619166217b54ee4	ABySS-Bundle Sequences	\N	ABySS-Bundle Sequences		cedbad85b02af4c0c923cb30fa45d8296
40	0992A5E7-BF4E-C0FD-9054-F2A982F5D07B	naim_RAxML110608	\N	naim_RAxML110608		c34a9cffb616d4088941cc68853ef230a
185	0FC359D7-DBD1-1E93-6A6F-187E9D6709AF	PROTNJ	\N	PROTNJ		c39e5aca7c5874a0a861d8795aeccd0eb
202	90E731C3-4395-DB74-FE23-8DF7AEAA8959	test	\N	test		c72c314d1eace461290b9b568d9feb86a
46	A3B3B14A-005A-9A59-41B2-5591936B1F6B	GetSeq	\N	GetSeq		c25d1206fbd2543fd90f8ce76d363087b
49	A6D171BB-94E6-8AA3-35AC-AD0DDEB7D0BB	Kathleen's test tool for testing 1808	\N	Kathleen's test tool for testing 1808		cd49d4e63362c4312ae235b94a4bc46a4
50	BCED723B-327F-D529-76F7-E6F8F0111FA2	Kathleen's test tool for testing 1808 EDITED	\N	Kathleen's test tool for testing 1808 EDITED		cd49d4e63362c4312ae235b94a4bc46a4
51	C14FB8BA-8ED6-B9DE-656C-F33C1105AFE6	please	\N	please		cd49d4e63362c4312ae235b94a4bc46a4
52	8818FEFA-74E8-093A-1AE5-2889EB435383	Some Tool	\N	Some Tool		c25d1206fbd2543fd90f8ce76d363087b
53	4C826C07-F26D-ADF3-5213-18CA9A70F937	Some Other Tool	\N	Some Other Tool		c25d1206fbd2543fd90f8ce76d363087b
54	855C90C0-9C39-9FA0-858B-26054635AF1E	Testing 1766	\N	Testing 1766		cc5ee65a9f66242de89912792a876d264
56	AC65068A-A661-98E7-EE34-61AD25E1BA0C	dnaml	\N	dnaml		c75b1634302014a2b9b104875525b9bbf
58	9C96CB2C-88E8-DE76-80B2-691CFF1564AA	QTLC_LRmapqtl	\N	QTLC_LRmapqtl		c1e918c9ee57e4697b6bd923d85731561
60	7E05FD3D-F994-A6CD-D08A-027EE9BDECFA	progressiveMauve	\N	progressiveMauve		cd1e24d5a81964d16acf39bc615a2323d
62	DDBF4A0B-D335-0C0E-E49C-DDAD7F095A80	Fantastico	\N	Fantastico		cd56d5774c4674b2ca5766ec7f0d727bb
63	5B0E9A59-14D8-10AC-6C67-21BD27D3D0F6	QTLC_SRmapqtl	\N	QTLC_SRmapqtl		cddc9db8f68084974b386562f30aa9c30
64	051136E4-BD8F-9BC9-0CF6-F83DF1F7B66E	My New Analysis	\N	My New Analysis		c1e918c9ee57e4697b6bd923d85731561
65	C8F915A8-0A00-CFDB-23A1-569EA888386B	My new Analysis	\N	My new Analysis		c25d1206fbd2543fd90f8ce76d363087b
66	F0FA2431-0A88-AE19-0837-6F4B4685F7A5	QTLC_Zmapqtl	\N	QTLC_Zmapqtl		c0475ad6aa7cc4005ace2a3e4ae39a31e
396	tb352ef7873354d5ca5fc33cb168ba4f1	FASTA Minimum Size Filter	\N	FASTA Minimum Size Filter		c471a5b009a1b47ab9d8b73a193b2ea69
67	1F6C7150-DB15-8582-32FD-EE4F63C47A95	QTLC_JZmapqtl	\N	QTLC_JZmapqtl		c2cf5cb4fee404f8d9feb298a3e364331
68	C39CBD8F-6A5A-627D-037B-D704254F0FC9	QTLC_MImapqtl	\N	QTLC_MImapqtl		c9c510f8df88648c08e0975f6b7459e9c
69	CBBCD24B-27FD-8F97-B453-C2737318E465	QTLC_Eqtl	\N	QTLC_Eqtl		caad0982088a54ca289cb4d68aee0e31f
72	B34B6EDB-F14F-1D28-98B8-D44236CC556B	Import into viewer	\N	Import into viewer		c25d1206fbd2543fd90f8ce76d363087b
277	tb5bce6416e824ae09cbd990397bf3c72	BWA Aligner for Single-End Illumina Reads	\N	BWA Aligner for Single-End Illumina Reads		c170e6959760a40c7bc72d74d0e9ad05a
180	t31dd48ac7726471ead302c69302a0ba5	SOAP2 Aligner for Single-End Illumina Reads	\N	SOAP2 Aligner for Single-End Illumina Reads		c7a1566211b8c4bfdb1fb861c4a7691ae
184	5D23F468-C979-4E3E-268C-691D2BD79510	DNANJ	\N	DNANJ		c0917869c601946ceb45319271cc7ffe2
90	t0e37dd97b4b94f9a9dd9c88c2efe0139	Import from NCBI SRA	\N	Import from NCBI SRA		cb8d55bbfe0cf4b2399d6c4d563f67e16
92	teae2adb239a84d1bb6cca43f1e494cda	Concatenate	\N	Concatenate		c72c314d1eace461290b9b568d9feb86a
94	t7dcff8499d824c569144bc100228297e	CutColumns	\N	CutColumns		cf3fcec559489442a9fce1dcc38e376f5
98	tf9703adf82f14a4f99a7ff98bf9f76af	Grep	\N	Grep		c58d961d2d2434e2c824401e121c6f90c
99	ta2774fbd5b4c4d43b3f44ec4e9efd15c	Head	\N	Head		c5d00a4904570495b85729ddef7ad4a68
192	t9b5355bb78c84009bdfb64b5985405d7	SOAP2 Aligner for Paired-End Illumina Reads	\N	SOAP2 Aligner for Paired-End Illumina Reads		c7a1566211b8c4bfdb1fb861c4a7691ae
101	tae6dd93b3fcd4a3490380e0b7421f21b	Join	\N	Join		ce999c4026f0d44a7a155b7e02bb2c9a7
103	t8a63f3aa20ed4e918b7aedfe0590e7f3	Tail	\N	Tail		c99ffaf7a86674e86b0327f0606dc3855
104	t5806f4b361cc49a99ff98fccfb8023a1	Find Unique Values	\N	Find Unique Values		c4e6f548cc0ee431da7f2ddfdf3ace761
105	t672268ed7e7349c6a966dd198daa46f1	Word Count	\N	Word Count		caa493da65197451ebbeea2497d353868
194	C720C42D-531A-164B-38CC-D2D6A337C5A5	DNAML	\N	DNAML		c75b1634302014a2b9b104875525b9bbf
107	t87d15852a38643388e256ac147e918eb	FastQC	\N	FastQC		c31104ecabf734d6cbdd18f37351c8370
204	3771F7F6-C8A5-75EA-1135-0C4F526A9E63	FastX Trimmer Nicole test 070411(2)	\N	FastX Trimmer Nicole test 070411(2)		cd49d4e63362c4312ae235b94a4bc46a4
205	592BC439-1515-A0B2-44F7-155529377743	Nicole test for quality filter	\N	Nicole test for quality filter		c35c0e84eda2646aaa6c5cc8cb690da70
206	t8f2746d0b43b45ccbedafff067d10a70	Muscle-QA	\N	Muscle-QA		c67a0e12f8b3b48a49bdd1ffb905ddef6
207	tf718f5d9e59d4569a6f5eb15d2cc19fd	Muscle-Blah	\N	Muscle-Blah		c1cbeda6245de460c8bd49a639b9666a6
128	ta15e19e7954d44809fccfa2462b74ce9	BAM from SAM	\N	BAM from SAM		cbe3e4fd020a04a15a7233b8d4b800c98
129	t2eecc3d5175a4bbcb97aca530c92990d	ranger_template	\N	ranger_template		ce838ca518df645b984f549f0473712ed
211	t916a6973a97f45c990ab4706fd8efa9f	TreeView	\N	TreeView		c25d1206fbd2543fd90f8ce76d363087b
212	6A5AB0D5-9300-DAE6-05FF-43F1A202CCA6	RAxML	\N	RAxML		c34a9cffb616d4088941cc68853ef230a
214	A35C4F9D-A126-EA96-1765-E196F73247CF	dhanesh_trimmer_New	\N	dhanesh_trimmer_New		cd49d4e63362c4312ae235b94a4bc46a4
215	868A33E5-216D-9DB2-8AEB-EB0A6E3621AD	PerlTest Eric Lyons	\N	PerlTest Eric Lyons		c25d1206fbd2543fd90f8ce76d363087b
145	td99cfb23561847eba56b55f1f4653cfc	TopHat Aligner for Paired-End Illumina Reads	\N	TopHat Aligner for Paired-End Illumina Reads		c01101d34b35f4b14ad23757c3118d55d
146	t3fef43103bfb4e4d9e35168ecfb99240	TopHat Aligner for Single-End Illumina Reads	\N	TopHat Aligner for Single-End Illumina Reads		c01101d34b35f4b14ad23757c3118d55d
221	89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55	PROML	\N	PROML		cc5ece07eef66444bb26cca6632f20cf6
223	F8EB9061-060A-08AB-A4E1-12D8EEDE97B0	K Testing Trimmer on staging 7-6	\N	K Testing Trimmer on staging 7-6		cd49d4e63362c4312ae235b94a4bc46a4
158	429C704E-6A2D-B706-6740-F23C4B3EAFA6	DNAPARS	\N	DNAPARS		c398c185fa49c4110a935add7ac1b1c21
226	2A6B165E-416C-2EDD-1DF4-036EB7D0684F	Ninja	\N	Ninja		c4b3ebdd32137419b820ba3ddbd7d141e
229	D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F	RAxML - Proteins	\N	RAxML - Proteins		c4b3ebdd32137419b820ba3ddbd7d141e
230	76BB8EC5-B1A0-C988-7837-6E38081E2086	RAxML - Nucleotides	\N	RAxML - Nucleotides		c34a9cffb616d4088941cc68853ef230a
237	ta2eed78a0e924e6ba4fec03d929d905b	FASTX Trimmer	\N	FASTX Trimmer		cd49d4e63362c4312ae235b94a4bc46a4
239	t12094c41c22e4e02aa0d4240d7a855d5	FASTX Clipper	\N	FASTX Clipper		c000cbd03bb54493fa75e4fdc23d7c7ad
241	t2491b03961834651a0c8bdc3b6219e22	FASTX Quality Filter	\N	FASTX Quality Filter		c35c0e84eda2646aaa6c5cc8cb690da70
243	7203F97D-FD9A-BFE3-D9DE-9411524F70E3	lopper	\N	lopper		c12bd559051333352e31302e3231d750adbbbb3b582a
262	20FCA18E-379C-ADDA-CD91-14D4ED780563	Muscle-Test	\N	Muscle-Test		c73ef66158ef94f1bb90689ff813629f5
244	t304f47b348cf4c808d0d24b6a65e1bf2	SRA to FASTQ	\N	SRA to FASTQ		c8d39411067a74090ac1ab0264f3d745b
245	30633EFA-2847-A261-930B-124E89EF49B3	QTLC_Rcross	\N	QTLC_Rcross		c3965bc6723e142a19935c94ce1ff03c9
248	12F489C2-1E93-F342-8457-7882D8690554	QTLC_Rqtl	\N	QTLC_Rqtl		c960921911bcd496fbe18622c7f882f85
254	3B35E87C-83FA-39BA-B746-F9BEC66F666B	QTLC_Rmap2	\N	QTLC_Rmap2		c0f0f8f27fcd34fd9911dd09e32478a7b
255	DF367222-2ADF-B4FF-BB50-62077694E17F	QTLC_Prune2	\N	QTLC_Prune2		c98a53487a5c14f00858c8125b4f896a2
257	t67fd136727964441a9f337109eda6a07	Change Case	\N	Change Case		cd29032a8b6a64eceae4f5e668287cf81
258	t3dcd2557a48e4d4586f9272554d26804	Awk	\N	Awk		c699464200dfc4e2eb17b5e5e63b405e6
260	F50FE07D-91AA-AA36-1D47-BB2E7FDC7BB4	Muscle v5	\N	Muscle v5		c25d1206fbd2543fd90f8ce76d363087b
263	00E7EE6B-F837-772C-5E7E-1A5E7FD6F4B9	1_trimmer_tito	\N	1_trimmer_tito		cd49d4e63362c4312ae235b94a4bc46a4
265	6D9741BF-E608-FCC8-02E9-7AB485B3475C	DACE	\N	DACE		c12bd559051333352e31302e3231d750adbbbb3b582a
267	764E3C9C-33F4-1339-0FA4-148F34F4E66C	PerlTest2	\N	PerlTest2		c25d1206fbd2543fd90f8ce76d363087b
270	t30ebbba18f2c4b2980802cba7e9659d1	BWA Aligner for Paired-End Illumina Reads	\N	BWA Aligner for Paired-End Illumina Reads		c170e6959760a40c7bc72d74d0e9ad05a
393	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	CACE	\N	CACE		c12bd559051333352e31302e3231d750adbbbb3b582a
395	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	ABySS Short Read Assembler	\N	ABySS Short Read Assembler		c0d7c27ee23784641a568dc9cbdc4e11d
283	C4935B91-869E-A301-0EFE-6F891C62C771	PROTPARS	\N	PROTPARS		c684805629750462fab1d40abe1ad3c21
286	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	FastTree2	\N	FastTree2		c83b53a474f07457b9fa4f8134924afad
398	t39b8b781e2bd472790a3c3f4a5f97ad7	GeneMania Query Runner	\N	GeneMania Query Runner		c4f98cb7cdbdc482c8e8d0c921c36a061
399	tcfd2eccda56f4039a7da61b5fddabbc9	Cuffcompare	\N	Cuffcompare		c22cc44a316fe4b098aec542f7b5e416a
291	F400AC2B-82B4-3146-1738-3554471E8124	Muscle-BSA	\N	Muscle-BSA		c73ef66158ef94f1bb90689ff813629f5
292	35F0EF83-AD2C-46CE-B812-3AE170C7D9A3	Storme's Tool	\N	Storme's Tool		cd49d4e63362c4312ae235b94a4bc46a4
406	t30a4373655ea4d25988df49fa8388cf7	CuffDiff	\N	CuffDiff		c5eea5de6c18447ddb87a833eb66166da
300	8684F0BB-D355-EDF2-F140-F00E7E9113EE	CanberraTest	\N	CanberraTest		c7123617c86734ac184a5eb732f125024
302	73DF09FE-002E-26D0-CFF1-2F7AD0A50F02	BordaTest	\N	BordaTest		c972a44a0f7ce497c94b63c92a15d685e
411	C8FEA992-336B-2149-FEAA-AB211262B1C5	BLASTX Contig Annotation (Stage 1)	\N	BLASTX Contig Annotation (Stage 1)		c0d7c27ee23784641a568dc9cbdc4e11d
412	ADEE47E5-F60A-01D6-E012-AC54BEE21128	BLASTX Contig Annotation (Stage 2)	\N	BLASTX Contig Annotation (Stage 2)		c0d7c27ee23784641a568dc9cbdc4e11d
414	3D8B6BB1-BC60-4853-C335-4816FCCCD1F7	Get sequences	\N	Get sequences		c25d1206fbd2543fd90f8ce76d363087b
415	8C5AFCC1-BC0F-1E24-38D4-B44D979F3FB6	Brutnell Lab RNAseq Pipeline	\N	Brutnell Lab RNAseq Pipeline		c2e3f248ba7164db8aac9882ff9de7c2b
315	57AC5561-52BA-4A98-EA3B-B22B64E44F2E	QTLC_Rmap	\N	QTLC_Rmap		c0f0f8f27fcd34fd9911dd09e32478a7b
323	E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB	QTLC_Prune	\N	QTLC_Prune		c98a53487a5c14f00858c8125b4f896a2
334	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	iPlantQxpakTest	\N	iPlantQxpakTest		cb3e6856e42114ae9abebcb8f86f9a133
339	tc24a97fbea45437891de6fa17b86b4aa	Sequence Statistics	\N	Sequence Statistics		c220e2e6557bd48619d01117f8e7f4aea
340	tf4ccb7fc1191468e99ba530c1d65c656	Interlace Paired FASTQ files	\N	Interlace Paired FASTQ files		caa8b6cd6a3e544adbf2018ccaf11fe1f
350	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	qtlConvert	\N	qtlConvert		c12bd559051333352e31302e3231d750adbbbb3b582a
356	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	run_Vbay.shTest	\N	run_Vbay.shTest		c3c2d856a73ea4d38984de9077f2fb207
358	D1C1258F-47B8-6149-EEDC-817F6F9CEDA1	RandomJungleTest	\N	RandomJungleTest		ccf050cbbecab4fbfb4f1697b73518be9
367	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	RandomJungleParseTest	\N	RandomJungleParseTest		c6d4809204c654bd7a7b6923d7ab6d05d
368	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	BBC biclustering	\N	BBC biclustering		c238dfeaccde44771a3f1db6595553604
370	9C5F8373-0B21-21EF-0836-1AD566DA5937	Ontologizer	\N	Ontologizer		c0e25fea105d842c8bec17f24637f15d8
371	5D98975B-85BD-E0AF-F861-56655E32A563	MECPMShortTest	\N	MECPMShortTest		cd73ea8f3d4a84b149204dcac292e71f1
420	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	PL	\N	PL		c12bd559051333352e31302e3231d750adbbbb3b582a
422	BC2BA17D-6CB0-4665-2955-8D96D30679F7	Disparity	\N	Disparity		c12bd559051333352e31302e3231d750adbbbb3b582a
428	119FD8A7-19FF-2267-554C-9E7FCF1965F9	Picante	\N	Picante		c12bd559051333352e31302e3231d750adbbbb3b582a
431	53E12CC1-77A3-10DB-5F6C-F2139C48746A	dnadist	\N	dnadist		c6df41ad321a64622b4e9fa80392f3d6c
\.


--
-- Data for Name: template_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template_group (hid, id, name, description, workspace_id) FROM stdin;
1	g12c7a585ec233352e31302e323112a7ccf18bfd7364	template_grouping		1
12	g5401bd146c144470aedd57b47ea1b979	In Progress	\N	0
13	0A687324-099B-4EEF-A82C-C1A60B970487	Utility Tools and Scripts		0
14	27C377E3-8B4A-4349-B7AE-03E985FA7BFD	Clustering and Network Analyses		0
15	FD0492B1-AF9B-4E01-8C8C-2EFCA55C6802	QTL Mapping and Genome-wide Association Studies		0
16	79B73C1A-E6CC-4875-9186-FAE0B4BC25DE	Sequence Alignments and Phylogenetic Tree Building		0
17	59C8018D-5615-4DB0-8F39-8AC29D55B4F3	Functional Analyses		0
18	88F1F174-91F5-4CB3-958A-AACB291EFFD7	NGS		0
19	2B1E3028-1530-489C-B31B-9A97A099869D	RNAseq Analysis		0
20	76EE53E4-3B1A-465F-BD82-3F21197A8E0F	ChIPseq Analysis		0
21	B0952FBE-0D99-41F8-970B-72B4900B0479	Assembly and Annotation		0
22	BCCDDC8F-9B3B-4F6F-8BF2-03FF3E1D5A24	QC and Processing		0
23	F03E3ADC-6E87-43A4-B643-DF0B910016FA	Variant Analysis		0
24	871C1523-449F-408E-8CB9-9BBF20ABDF75	Aligners		0
25	56DC6CAE-7FEE-4EFD-B115-512346B63ABB	Phylogenetic Comparative Methods and Trait Evolution		0
\.


--
-- Data for Name: template_group_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template_group_group (parent_group_id, subgroup_id, hid) FROM stdin;
1	12	0
1	13	1
1	14	2
1	15	3
1	16	4
1	17	5
1	18	6
18	19	0
18	20	1
18	21	2
18	22	3
18	23	4
18	24	5
1	25	7
\.


--
-- Data for Name: template_group_template; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template_group_template (template_group_id, template_id, hid) FROM stdin;
13	57	0
13	58	1
13	59	2
13	64	3
13	67	4
13	68	5
13	69	6
13	26	7
13	92	8
14	62	0
15	40	0
15	42	1
15	46	2
15	47	3
16	81	0
16	78	1
16	73	2
16	82	3
16	83	4
16	99	5
16	32	6
16	19	7
16	79	8
16	18	9
16	41	10
19	147	0
19	146	1
19	131	2
20	66	0
21	133	0
21	141	1
21	142	2
21	143	3
21	144	4
22	22	0
22	13	1
22	16	2
22	15	3
22	12	4
24	72	0
24	77	1
24	76	2
24	75	3
24	84	4
24	85	5
25	100	0
25	113	1
25	116	2
25	86	3
25	152	4
12	24	0
12	29	1
12	30	2
12	33	3
12	34	4
12	35	5
12	36	6
12	37	7
12	38	8
12	43	9
12	44	10
12	45	11
12	87	12
12	88	13
12	89	14
12	90	15
12	91	16
12	94	17
12	95	18
12	96	19
12	101	20
12	102	21
12	103	22
12	104	23
12	98	24
12	106	25
12	107	26
12	108	27
12	109	28
12	111	29
12	112	30
12	114	31
12	115	32
12	117	33
12	121	34
12	27	35
12	23	36
12	125	37
12	127	38
12	128	39
12	129	40
12	130	41
12	132	42
12	135	43
12	136	44
12	137	45
12	138	46
12	151	47
12	153	48
12	155	49
12	17	50
12	17	51
12	14	52
12	14	53
12	2	54
12	25	55
12	71	56
12	21	57
12	20	58
12	97	59
12	31	60
12	56	61
12	63	62
12	65	63
12	51	64
12	55	65
12	60	66
12	28	67
12	74	68
12	48	69
12	49	70
12	39	71
12	80	72
12	93	73
\.


--
-- Data for Name: template_input; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template_input (template_id, input_id, hid) FROM stdin;
1	1	0
1	2	1
2	5	0
2	6	1
2	7	2
3	10	0
3	11	1
4	14	0
5	16	0
6	18	0
7	20	0
7	21	1
8	23	0
8	24	1
9	26	0
9	27	1
10	29	0
10	30	1
10	31	2
13	41	0
13	42	1
15	45	0
15	46	1
16	52	0
16	53	1
17	59	0
18	62	0
237	522	0
23	70	0
24	72	0
25	74	0
26	78	0
27	79	0
28	81	0
29	83	0
30	85	0
30	86	1
31	87	0
32	88	0
32	89	1
34	94	0
34	95	1
34	96	2
35	97	0
36	99	0
36	100	1
36	101	2
36	102	3
36	103	4
239	526	0
244	536	0
245	537	0
245	538	1
40	113	0
248	541	0
192	421	0
192	422	1
192	423	2
194	425	0
46	127	0
46	128	1
260	561	0
128	309	0
262	564	0
51	138	0
129	310	0
56	141	0
129	311	1
265	572	0
58	144	0
58	145	1
265	573	1
60	148	0
62	152	0
63	154	0
63	155	1
64	156	0
65	158	0
66	160	0
66	161	1
66	162	2
66	163	3
67	164	0
67	165	1
67	166	2
67	167	3
68	168	0
68	169	1
68	170	2
69	171	0
69	172	1
267	576	0
72	177	0
72	178	1
145	344	0
145	345	1
145	346	2
146	347	0
146	348	1
202	454	0
204	458	0
205	460	0
158	360	0
206	462	0
207	466	0
92	225	0
94	229	0
98	236	0
99	238	0
211	473	0
212	474	0
101	243	0
101	244	1
214	477	0
103	252	0
104	254	0
105	256	0
107	262	0
215	479	0
221	486	0
223	489	0
226	493	0
229	496	0
230	497	0
180	396	0
180	397	1
184	401	0
185	402	0
241	530	0
243	534	0
243	535	1
254	551	0
255	552	0
255	553	1
257	555	0
258	557	0
263	568	0
270	582	0
270	583	1
270	584	2
271	585	0
272	587	0
272	588	1
384	895	0
277	595	0
277	596	1
283	601	0
286	608	0
291	618	0
292	621	0
393	918	0
393	919	1
334	771	0
334	772	1
334	773	2
334	774	3
300	640	0
334	775	4
302	642	0
334	776	5
395	924	0
395	925	1
395	926	2
395	927	3
396	928	0
339	786	0
340	787	0
340	788	1
398	932	0
399	934	0
399	935	1
399	936	2
406	954	0
406	955	1
350	808	0
350	809	1
406	956	2
406	957	3
411	963	0
412	964	0
315	701	0
414	966	0
415	967	0
415	968	1
415	969	2
420	978	0
323	720	0
323	721	1
420	979	1
356	833	0
356	834	1
356	835	2
356	836	3
356	837	4
358	840	0
422	983	0
422	984	1
422	985	2
367	858	0
368	860	0
370	867	0
370	868	1
370	869	2
370	870	3
371	872	0
428	1004	0
428	1005	1
428	1006	2
428	1007	3
431	1014	0
431	1015	1
431	1016	2
\.


--
-- Data for Name: template_output; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template_output (template_id, output_id, hid) FROM stdin;
1	3	0
1	4	1
2	8	0
2	9	1
3	12	0
3	13	1
4	15	0
5	17	0
6	19	0
7	22	0
8	25	0
9	28	0
10	32	0
13	43	0
14	44	0
15	47	0
15	48	1
15	49	2
15	50	3
15	51	4
16	54	0
16	55	1
16	56	2
16	57	3
16	58	4
17	60	0
17	61	1
18	63	0
23	71	0
24	73	0
25	75	0
25	76	1
25	77	2
27	80	0
28	82	0
29	84	0
32	90	0
35	98	0
40	114	0
46	129	0
49	136	0
50	137	0
51	139	0
60	149	0
62	153	0
64	157	0
65	159	0
92	226	0
98	237	0
99	239	0
101	245	0
103	253	0
104	255	0
105	257	0
107	263	0
107	264	1
107	265	2
129	312	0
202	455	0
204	459	0
205	461	0
206	463	0
206	464	1
206	465	2
207	467	0
207	468	1
207	469	2
214	478	0
215	480	0
223	490	0
237	523	0
239	527	0
241	531	0
257	556	0
258	558	0
262	565	0
262	566	1
262	567	2
263	569	0
267	577	0
271	586	0
291	619	0
291	620	1
292	622	0
334	777	0
340	789	0
358	841	0
367	859	0
368	861	0
370	871	0
371	873	0
396	929	0
398	933	0
\.


--
-- Data for Name: template_property_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY template_property_group (template_id, property_group_id, hid) FROM stdin;
1	1	0
5	5	0
14	14	0
185	223	0
185	224	1
3	3	0
206	249	0
207	250	0
13	13	0
214	257	0
15	15	0
16	16	0
2	2	0
22	22	0
32	32	0
245	292	0
35	35	0
36	36	0
145	151	0
17	17	0
396	427	0
101	93	0
103	96	0
18	18	0
300	339	0
40	40	0
30	30	0
239	285	0
192	231	0
31	31	0
302	341	0
420	450	0
46	45	0
221	265	0
49	46	0
49	47	1
50	48	0
50	49	1
51	50	0
221	266	1
221	267	2
52	51	0
53	52	0
54	53	0
393	422	0
56	55	0
212	255	0
62	59	0
223	269	0
63	60	0
64	61	0
65	62	0
65	63	1
66	64	0
67	65	0
68	66	0
68	67	1
69	68	0
26	26	0
23	23	0
9	9	0
72	71	0
58	57	0
262	303	0
395	425	0
395	426	1
25	25	0
107	99	0
422	452	0
263	304	0
277	316	0
29	29	0
10	10	0
104	97	0
180	212	0
258	300	0
202	245	0
204	247	0
398	429	0
205	248	0
398	430	1
411	441	0
412	442	0
27	27	0
399	431	0
28	28	0
146	152	0
415	445	0
129	128	0
129	129	1
283	317	0
283	318	1
414	444	0
272	310	0
265	306	0
265	307	1
229	275	0
257	299	0
194	235	0
194	236	1
194	237	2
260	302	0
226	272	0
286	325	0
230	276	0
90	80	0
406	436	0
244	291	0
356	384	0
98	89	0
98	90	1
94	83	0
358	386	0
291	330	0
292	331	0
158	177	0
158	178	1
184	221	0
184	222	1
367	395	0
243	289	0
243	290	1
368	396	0
370	398	0
350	378	0
315	354	0
34	34	0
211	254	0
270	309	0
323	362	0
4	4	0
8	8	0
6	6	0
7	7	0
24	24	0
99	91	0
241	287	0
237	283	0
428	458	0
\.


--
-- Data for Name: transformation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation (id, name, description, template_id) FROM stdin;
1	no_name	transformation	tafa3108f6b222163b584cfb5499e4f58
2	no_name	transformation	t0117d106b39d4081909f2cbfefbc4d29
3	no_name	transformation	t259a86b292964cb4bae61400993f2af0
4	no_name	transformation	t2d6ebb74f29a498cbc0ad3d01b80e3a1
5	no_name	transformation	t6cf67a33e016493194be0978e01f47d9
6	no_name	transformation	t5063fc675dc94877bc000eb5633e18aa
7	no_name	transformation	t6cf67a33e016493194be0978e01f47d9
8	no_name	transformation	t2d6ebb74f29a498cbc0ad3d01b80e3a1
9	no_name	transformation	t06132fa100a244878a31b84465a6e243
10	no_name	transformation	td0c69efa6ee5440c83c3168c6a8030c3
11	no_name	transformation	t3e5fa5b431a74a1390eca8c870ee6690
12	no_name	transformation	tb584cfb5499e4f58afa3108f6b222163
13	no_name	transformation	t67151b1dea3a4aee84bfea14015c11a8
17	no_name	transformation	t319b9ca5e639468d800aee51b95b998c
18	no_name	transformation	t12bd045b75933352e31302e3231d0429321818ccf8c
19	no_name	transformation	ta2eed78a0e924e6ba4fec03d929d905b
20	no_name	transformation	t152be766a851453491e220ff7bea12de
21	no_name	transformation	td44b92b00cec4881ac49b4edad05c158
22	no_name	transformation	t12094c41c22e4e02aa0d4240d7a855d5
23	no_name	transformation	t2491b03961834651a0c8bdc3b6219e22
24	no_name	transformation	t12af368916d33352e31302e3231d01170012afe3c9oldr
25			t649789b6669d43d09afbc4ba3f789e5d
26			6C87D62D-236A-C9F7-1DF3-3B7E22926B1F
27			A491D1C1-CE61-56DA-8458-2C603F3B48EF
28			EF64AD00-9A14-EE88-1BD1-27E90ABDE244
29			E85D0F0E-1923-92A5-5D3C-7EDA880220DE
30			37A7E123-A7FA-7B91-9C44-0D96289FB6AC
31			E8C72058-3156-0690-F11B-237E91AA01C2
32			4385F2B5-D091-E6BC-CB04-671CE13E2936
33			7203F97D-FD9A-BFE3-D9DE-9411524F70E3
34			C43EB684-46C8-5A3B-137A-3B52F695958D
35			EDB07330-4871-FA7C-64A2-0F69ADC02CBD
36			068355FC-ACFA-99A3-58E3-9998608B4BC8
37			0992A5E7-BF4E-C0FD-9054-F2A982F5D07B
38			A3B3B14A-005A-9A59-41B2-5591936B1F6B
39			2A6B165E-416C-2EDD-1DF4-036EB7D0684F
40			A6D171BB-94E6-8AA3-35AC-AD0DDEB7D0BB
41			BCED723B-327F-D529-76F7-E6F8F0111FA2
42			C14FB8BA-8ED6-B9DE-656C-F33C1105AFE6
43			8818FEFA-74E8-093A-1AE5-2889EB435383
44			4C826C07-F26D-ADF3-5213-18CA9A70F937
45			855C90C0-9C39-9FA0-858B-26054635AF1E
46			AC65068A-A661-98E7-EE34-61AD25E1BA0C
47			9C96CB2C-88E8-DE76-80B2-691CFF1564AA
48			7E05FD3D-F994-A6CD-D08A-027EE9BDECFA
49			5B0E9A59-14D8-10AC-6C67-21BD27D3D0F6
50			DDBF4A0B-D335-0C0E-E49C-DDAD7F095A80
51			051136E4-BD8F-9BC9-0CF6-F83DF1F7B66E
52			C8F915A8-0A00-CFDB-23A1-569EA888386B
53			F0FA2431-0A88-AE19-0837-6F4B4685F7A5
54			1F6C7150-DB15-8582-32FD-EE4F63C47A95
55			C39CBD8F-6A5A-627D-037B-D704254F0FC9
56			CBBCD24B-27FD-8F97-B453-C2737318E465
58			B34B6EDB-F14F-1D28-98B8-D44236CC556B
75		\N	t0e37dd97b4b94f9a9dd9c88c2efe0139
77		\N	teae2adb239a84d1bb6cca43f1e494cda
79		\N	t7dcff8499d824c569144bc100228297e
83		\N	tf9703adf82f14a4f99a7ff98bf9f76af
84		\N	ta2774fbd5b4c4d43b3f44ec4e9efd15c
86		\N	tae6dd93b3fcd4a3490380e0b7421f21b
88		\N	t8a63f3aa20ed4e918b7aedfe0590e7f3
89		\N	t5806f4b361cc49a99ff98fccfb8023a1
90		\N	t672268ed7e7349c6a966dd198daa46f1
92		\N	t87d15852a38643388e256ac147e918eb
103			C720C42D-531A-164B-38CC-D2D6A337C5A5
105		\N	ta15e19e7954d44809fccfa2462b74ce9
106		\N	t2eecc3d5175a4bbcb97aca530c92990d
117		\N	td99cfb23561847eba56b55f1f4653cfc
118		\N	t3fef43103bfb4e4d9e35168ecfb99240
119			429C704E-6A2D-B706-6740-F23C4B3EAFA6
120			F8A1039E-AC9C-F4AE-D9E5-FF314F30388E
121			89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55
122			C4935B91-869E-A301-0EFE-6F891C62C771
123			0FC359D7-DBD1-1E93-6A6F-187E9D6709AF
124			5D23F468-C979-4E3E-268C-691D2BD79510
130		\N	t31dd48ac7726471ead302c69302a0ba5
135		\N	t9b5355bb78c84009bdfb64b5985405d7
136			119FD8A7-19FF-2267-554C-9E7FCF1965F9
137			90E731C3-4395-DB74-FE23-8DF7AEAA8959
138			3771F7F6-C8A5-75EA-1135-0C4F526A9E63
139			592BC439-1515-A0B2-44F7-155529377743
140		\N	t8f2746d0b43b45ccbedafff067d10a70
141		\N	tf718f5d9e59d4569a6f5eb15d2cc19fd
142			t916a6973a97f45c990ab4706fd8efa9f
143			6A5AB0D5-9300-DAE6-05FF-43F1A202CCA6
144			A35C4F9D-A126-EA96-1765-E196F73247CF
145			868A33E5-216D-9DB2-8AEB-EB0A6E3621AD
146			F8EB9061-060A-08AB-A4E1-12D8EEDE97B0
147			3D8B6BB1-BC60-4853-C335-4816FCCCD1F7
148			D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F
149			76BB8EC5-B1A0-C988-7837-6E38081E2086
150			4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406
151		\N	t304f47b348cf4c808d0d24b6a65e1bf2
152			30633EFA-2847-A261-930B-124E89EF49B3
153			57AC5561-52BA-4A98-EA3B-B22B64E44F2E
154			12F489C2-1E93-F342-8457-7882D8690554
155			E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB
157			3B35E87C-83FA-39BA-B746-F9BEC66F666B
158			DF367222-2ADF-B4FF-BB50-62077694E17F
160		\N	t67fd136727964441a9f337109eda6a07
161		\N	t3dcd2557a48e4d4586f9272554d26804
162			35F0EF83-AD2C-46CE-B812-3AE170C7D9A3
163			F50FE07D-91AA-AA36-1D47-BB2E7FDC7BB4
165			20FCA18E-379C-ADDA-CD91-14D4ED780563
166			00E7EE6B-F837-772C-5E7E-1A5E7FD6F4B9
167			6D9741BF-E608-FCC8-02E9-7AB485B3475C
168			764E3C9C-33F4-1339-0FA4-148F34F4E66C
170		\N	t30ebbba18f2c4b2980802cba7e9659d1
171			6211AFE4-2F7B-F850-127F-658521B30521
172			21F54682-5D2A-1B3C-BC5C-EDEA0CED1C1B
173			73DF09FE-002E-26D0-CFF1-2F7AD0A50F02
174		\N	tb5bce6416e824ae09cbd990397bf3c72
178			F400AC2B-82B4-3146-1738-3554471E8124
182			8684F0BB-D355-EDF2-F140-F00E7E9113EE
184			58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A
185			9C5F8373-0B21-21EF-0836-1AD566DA5937
187			048EE3AC-A18B-B0FD-517E-DB03C7A3C124
188			F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B
189			8C5AFCC1-BC0F-1E24-38D4-B44D979F3FB6
192		\N	tc24a97fbea45437891de6fa17b86b4aa
193		\N	tf4ccb7fc1191468e99ba530c1d65c656
195			E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D
196			D1C1258F-47B8-6149-EEDC-817F6F9CEDA1
197			C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D
198			5D98975B-85BD-E0AF-F861-56655E32A563
202			C8FEA992-336B-2149-FEAA-AB211262B1C5
203		\N	t59f7d38c7a714ea5a619166217b54ee4
204			FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9
205		\N	tb352ef7873354d5ca5fc33cb168ba4f1
207		\N	t39b8b781e2bd472790a3c3f4a5f97ad7
208		\N	tcfd2eccda56f4039a7da61b5fddabbc9
213		\N	t30a4373655ea4d25988df49fa8388cf7
215			ADEE47E5-F60A-01D6-E012-AC54BEE21128
216			2F56CFBC-C158-9378-7A51-190EDB5FB9BF
217			BC2BA17D-6CB0-4665-2955-8D96D30679F7
219			53E12CC1-77A3-10DB-5F6C-F2139C48746A
\.


--
-- Data for Name: transformation_activity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation_activity (hid, name, id, description, workspace_id, type, deleted) FROM stdin;
31	GetSeq	A3B3B14A-005A-9A59-41B2-5591936B1F6B	none	0		f
6	Burrows-Wheeler Aligner Paired End Reads	a7c0b6f5ee44b409a8498c37383dbbef1	help/user_manual/lessons/Burrows-Wheeler_Aligner__analysis_.html	0	bwa	f
2	Find SNPs	a12ab10b2006e4a65aefa404f0af3c802	help/user_manual/lessons/Find_SNPs.html	0		f
3	Samtools Filtering	a4c264b30c2a54ee39df72ee4312606f2		0	samtools	f
4	Samtools Base Calling	acb1a1efc21be479c89248a60d153dd51		0	samtools	f
7	TopHat Single End for Illumina	aea24bd53fa4e430e93fd2b7f10f6453d	help/user_manual/lessons/TopHat.html 	0	aligner	f
12	FASTX Trimmer	a65fa62bcebc0418cbb947485a63b30cd	help/user_manual/lessons/FASTX_Trimmer__all_versions_.html	0		f
13	FASTX Barcode Splitter (Single End)	adc2cec84781645899a6ccd4d025b0443	help/user_manual/lessons/FASTX_Barcode_Splitter__all_versions_.html	0		f
10	Continuous Ancestral Character Estimation	ac6c8e153504c438ea462b41d8f8e98b0	help/user_manual/lessons/Continuous_Ancestral_Character_Estimation.html	0	cace	f
11	Discrete Ancestral Character Estimation	a4068abfb78af40f496917cc4916383f1	help/user_manual/lessons/Discrete_Ancestral_Character__Estimation_.html	0	dace	f
14	FASTQ Quality Rescaler	af8ac873952e549e4869f862d59e98e48	help/user_manual/lessons/FASTQ_Quality_Rescaler.html	0		f
15	FASTX Clipper	ad042f00f8cf24143a9ce71820d691b2a	help/user_manual/lessons/FASTX_Clipper__all_versions_.html	0		f
16	FASTX Quality Filter	a4ce6a7961e1f4aafabfce922fd00810f	help/user_manual/lessons/FASTX_Quality_Filter__all_versions_.html	0		f
5	Burrows-Wheeler Aligner Single End Reads	adb0cc4e638184808b1f24212ca2e806f	help/user_manual/lessons/Burrows-Wheeler_Aligner__analysis_.html	0	bwa	f
8	Phylogenetic Independent Contrasts	a35f5afa532454d5c900ba40b1a04d83c	help/user_manual/lessons/Independent_Contrasts_Overview.html	0	contrast	f
20	fastx_nt_distribution	A491D1C1-CE61-56DA-8458-2C603F3B48EF	none	0		f
21	fastx_qchart	EF64AD00-9A14-EE88-1BD1-27E90ABDE244	none	0		f
22	fastx_qstats_67	E85D0F0E-1923-92A5-5D3C-7EDA880220DE	none	0		f
23	Find Lambda and run PL	37A7E123-A7FA-7B91-9C44-0D96289FB6AC	none	0		f
24	Borda_Jason	E8C72058-3156-0690-F11B-237E91AA01C2	none	0		f
25	cuffcompare	4385F2B5-D091-E6BC-CB04-671CE13E2936	none	0		f
26	lopper	7203F97D-FD9A-BFE3-D9DE-9411524F70E3	none	0		f
27	ouch	C43EB684-46C8-5A3B-137A-3B52F695958D	none	0		f
28	vcf_to_gff_4	EDB07330-4871-FA7C-64A2-0F69ADC02CBD	none	0		f
29	ontologizer_v4	068355FC-ACFA-99A3-58E3-9998608B4BC8	none	0		f
32	Ninja	2A6B165E-416C-2EDD-1DF4-036EB7D0684F	none	0		f
40	QTLC_LRmapqtl	9C96CB2C-88E8-DE76-80B2-691CFF1564AA	none	0		f
41	progressiveMauve	7E05FD3D-F994-A6CD-D08A-027EE9BDECFA	none	0		f
42	QTLC_SRmapqtl	5B0E9A59-14D8-10AC-6C67-21BD27D3D0F6	none	0		f
46	QTLC_Zmapqtl	F0FA2431-0A88-AE19-0837-6F4B4685F7A5	none	0		f
47	QTLC_JZmapqtl	1F6C7150-DB15-8582-32FD-EE4F63C47A95	none	0		f
48	QTLC_MImapqtl	C39CBD8F-6A5A-627D-037B-D704254F0FC9	none	0		f
49	QTLC_Eqtl	CBBCD24B-27FD-8F97-B453-C2737318E465	none	0		f
51	Import into viewer	B34B6EDB-F14F-1D28-98B8-D44236CC556B	none	0		f
55	NCBI SRA Import	acba707c42ff54809896a3fafb827fe2b	Use Aspera ascp to fetch sequence archive from NCBI SRA.	0	Data Sources	f
56	GNU awk	a14ca47a19372410992a83784e462dfe4	Run the UNIX awk command on the selected file.	0	Text Manipulation	f
57	Concatenate Files	a95e4e92fdc8c4d0cb75881735c28299f	Concatenate files head-to-tail.	0	Text Manipulation	f
58	Change Case	aa33390c746b04ed6896936e990fbbb9d	Change the case of specific columns in a delimited-text file.	0	Text Manipulation	f
59	Cut Columns	a6d3c47fef68b4f80b215ca0105d7a76c	Extract data columns from a plain-text, delimited data table	0	Text Manipulation	f
60	NCBI SRA Toolkit fastq-dump	af3108d64f08648418f9ff677c1516852	Convert SRA format to FASTQ using fastq-dump.	0	Data Conversion	f
33	Kathleen's test tool for testing 1808	A6D171BB-94E6-8AA3-35AC-AD0DDEB7D0BB	none	0		t
34	Kathleen's test tool for testing 1808 EDITED	BCED723B-327F-D529-76F7-E6F8F0111FA2	none	0		t
35	please	C14FB8BA-8ED6-B9DE-656C-F33C1105AFE6	none	0		t
36	Some Tool	8818FEFA-74E8-093A-1AE5-2889EB435383	none	0		t
37	Some Other Tool	4C826C07-F26D-ADF3-5213-18CA9A70F937	none	0		t
38	Testing 1766	855C90C0-9C39-9FA0-858B-26054635AF1E	none	0		t
43	Fantastico	DDBF4A0B-D335-0C0E-E49C-DDAD7F095A80	none	0		t
44	My New Analysis	051136E4-BD8F-9BC9-0CF6-F83DF1F7B66E	none	0		t
45	My new Analysis	C8F915A8-0A00-CFDB-23A1-569EA888386B	none	0		t
87	test	90E731C3-4395-DB74-FE23-8DF7AEAA8959	none	0		t
18	MUSCLE	t649789b6669d43d09afbc4ba3f789e5d	none	0		f
19	PhyML	6C87D62D-236A-C9F7-1DF3-3B7E22926B1F	none	0		f
62	GeneMania Query Runner	ac12eb6c54cd74ecaacaac8ee0174f44d	Run a gene network prediction and write the results to a file.	0	Gene Annotation	f
63	Find Lines Matching An Expression	a3f98560d70404175b64b930ba6d2935a	Use GNU 'grep' to find lines in a plain text document matching a regular expression.	0	Text Manipulation	f
64	Extract First Lines From a File	aa54b4fd9b56545db978fff4398c5ce81	Use GNU 'head' to extract the beginning a plain text file.	0	Text Manipulation	f
65	Merge Two Files By Key Columns	ac22d6523ef6446a39910016f90dfa5ea	On simple tabular data, this can perform a SQL-like JOIN.	0	Text Manipulation	f
66	PeakRanger	ae6618c03199f434d94aaceb9313d1e66	ChIP-Seq peak caller	0	ChIPseq Analysis	f
67	Extract Last Lines From a File	ae633f2b23f904b5994d49539f7d1a673	Use GNU 'tail' to extract the end of a plain text file.	0	Text Manipulation	f
68	Find Unique Values	acd2f67d73edd41249b3d8a4c40e582a3	Find and report unique values in a text file.	0	Text Manipulation	f
69	Word Count	ac37ced41d82346f68d1b27b56830526c	Count words, lines, and characters in a file	0	Text Manipulation	f
39	dnaml	AC65068A-A661-98E7-EE34-61AD25E1BA0C	none	0		t
71	FastQC	acaf66b31a7d940779d5d3da88c740320	FastQC is an application which takes a FastQ file and runs a series of tests on it to generate a comprehensive QC report.	0	Quality Control and Manipulation	f
72	BWA Aligner for Single-End Illumina Reads	ab60ca93cec4f453287e86529c9f8adcd	Use BWA to align next-gen data to a reference sequence.	0	Transcriptomics and Genomics	f
73	DNAML	C720C42D-531A-164B-38CC-D2D6A337C5A5	none	0		f
74	Create BAM from SAM file	a7909c999d97347dca20d6aba44fe5294	Create sorted, indexed BAM from SAM using SAMtools.	0	Utility Tools	f
75	TopHat Aligner for Paired-End Illumina Reads	a034c7638dc8445e5af6ad580c3cb0f3f	Use TopHat to align next-gen RNAseq to a reference sequence.	0	Transcriptomics and Genomics	f
76	TopHat Aligner for Single-End Illumina Reads	a765f327258fb445a88bfc24c26788e33	Use TopHat to align next-gen RNAseq to a reference sequence.	0	Transcriptomics and Genomics	f
77	BWA Aligner for Paired-End Illumina Reads	a8540c5e9df044e789650d1f9d4d7c15f	Use BWA to align next-gen data to a reference sequence.	0	Transcriptomics and Genomics	f
78	DNAPARS	429C704E-6A2D-B706-6740-F23C4B3EAFA6	none	0		f
106	QTLC_Rmap2	3B35E87C-83FA-39BA-B746-F9BEC66F666B	none	0		f
79	FastTree2	F8A1039E-AC9C-F4AE-D9E5-FF314F30388E	none	0		f
80	PROML	89078CC8-1AB5-A4C1-0ED7-BB4C4C6B3B55	none	0		f
81	PROTPARS	C4935B91-869E-A301-0EFE-6F891C62C771	none	0		f
82	PROTNJ	0FC359D7-DBD1-1E93-6A6F-187E9D6709AF	none	0		f
83	DNANJ	5D23F468-C979-4E3E-268C-691D2BD79510	none	0		f
84	SOAP2 Aligner for Single-End Illumina Reads	aa98aa2205fec4cd195185b74fcd222cc	Use SOAP2 to align next-gen data to a reference sequence.	0	Transcriptomics and Genomics	f
85	SOAP2 Aligner for Paired-End Illumina Reads	ac0a5fbb86a3f4c3c89a37b29ad8854a4	Use SOAP2 to align next-gen data to a reference sequence.	0	Transcriptomics and Genomics	f
86	Picante	119FD8A7-19FF-2267-554C-9E7FCF1965F9	none	0		f
92	TreeView	t916a6973a97f45c990ab4706fd8efa9f	none	0		f
93	RAxML	6A5AB0D5-9300-DAE6-05FF-43F1A202CCA6	none	0		f
1	TopHat Paired End for Illumina	ad4fbbe44ff06445445882d8d2132a1e148ef4	help/user_manual/lessons/TopHat.html	0	aligner	f
97	Get sequences	3D8B6BB1-BC60-4853-C335-4816FCCCD1F7	none	0		f
98	RAxML - Proteins	D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F	none	0		f
99	RAxML - Nucleotides	76BB8EC5-B1A0-C988-7837-6E38081E2086	none	0		f
100	CACE	4BA117B1-0BFB-F4B2-C5B0-AABE56CF8406	none	0		f
101	QTLC_Rcross	30633EFA-2847-A261-930B-124E89EF49B3	none	0		f
102	QTLC_Rmap	57AC5561-52BA-4A98-EA3B-B22B64E44F2E	none	0		f
103	QTLC_Rqtl	12F489C2-1E93-F342-8457-7882D8690554	none	0		f
104	QTLC_Prune	E7F8F6EF-C95F-D23A-9683-EFCAB5474EAB	none	0		f
107	QTLC_Prune2	DF367222-2ADF-B4FF-BB50-62077694E17F	none	0		f
109	Muscle v5	F50FE07D-91AA-AA36-1D47-BB2E7FDC7BB4	none	0		f
113	DACE	6D9741BF-E608-FCC8-02E9-7AB485B3475C	none	0		f
116	CONTRAST	21F54682-5D2A-1B3C-BC5C-EDEA0CED1C1B	none	0		f
30	naim_RAxML110608	0992A5E7-BF4E-C0FD-9054-F2A982F5D07B	none	0		t
88	FastX Trimmer Nicole test 070411(2)	3771F7F6-C8A5-75EA-1135-0C4F526A9E63	none	0		t
89	Nicole test for quality filter	592BC439-1515-A0B2-44F7-155529377743	none	0		t
91	Muscle-Blah (Invalid JSON)	add5a95c07fe74746820e8de4101f4eb8	This should not be imported, it's invalid JSON.  Extra commas	0	Mutliple Sequence Alignment	t
94	dhanesh_trimmer_New	A35C4F9D-A126-EA96-1765-E196F73247CF	none	0		t
95	PerlTest Eric Lyons	868A33E5-216D-9DB2-8AEB-EB0A6E3621AD	none	0		t
96	K Testing Trimmer on staging 7-6	F8EB9061-060A-08AB-A4E1-12D8EEDE97B0	none	0		t
108	Storme's Tool	35F0EF83-AD2C-46CE-B812-3AE170C7D9A3	none	0		t
111	Muscle-Test	20FCA18E-379C-ADDA-CD91-14D4ED780563	none	0		t
112	1_trimmer_tito	00E7EE6B-F837-772C-5E7E-1A5E7FD6F4B9	none	0		t
114	PerlTest2	764E3C9C-33F4-1339-0FA4-148F34F4E66C	none	0		t
115	perltest3	6211AFE4-2F7B-F850-127F-658521B30521	none	0		t
117	BordaTest	73DF09FE-002E-26D0-CFF1-2F7AD0A50F02	none	0		t
90	Muscle-QA (QA Testing)	a747fffc4e72f4909a2647525bfaa11f6	Muscle: Multiple Sequence Alignment	0	Mutliple Sequence Alignment	t
121	Muscle-BSA	F400AC2B-82B4-3146-1738-3554471E8124	none	0		f
125	CanberraTest	8684F0BB-D355-EDF2-F140-F00E7E9113EE	none	0		f
127	BBC biclustering	58F3D01E-4FAE-40D4-F4CB-2ECBB237AF0A	none	0		f
128	Ontologizer	9C5F8373-0B21-21EF-0836-1AD566DA5937	none	0		f
129	iPlantQxpakTest	048EE3AC-A18B-B0FD-517E-DB03C7A3C124	none	0		f
130	qtlConvert	F560CBD7-69A7-EFA5-CAF4-8F20FF0BF67B	none	0		f
131	Brutnell Lab RNAseq Pipeline	8C5AFCC1-BC0F-1E24-38D4-B44D979F3FB6	none	0		f
132	Sequence Statistics	a6ad920c05b884d3da6b857b2f866624b	Compute on sequence statistics on a contigs file.	0	NGS	f
133	Interlace Paired FASTQ files	ac09eede4b40d45af81d249b547edc1ea	Interlace paired-end sequences into a single file.	0	NGS	f
135	run_Vbay.shTest	E1CF17CE-CF75-0B25-F6CD-7C4E1CA8580D	none	0		f
136	RandomJungleTest	D1C1258F-47B8-6149-EEDC-817F6F9CEDA1	none	0		f
137	RandomJungleParseTest	C533CB1E-DF26-A3B7-5E17-BD8205CBCB0D	none	0		f
17	TNRS Demo	a730680b27daf41b4b32991b9fe14aee9	help/user_manual/lessons/Taxonomic_Name_Resolution_Service_Demo.html	0	TNRS	t
138	MECPMShortTest	5D98975B-85BD-E0AF-F861-56655E32A563	none	0		f
141	FASTA Minimum Size Filter	a5ece6d08975b4f8dbc7f7b0b549e4444	Extract sequences from a FASTA file larger than a specified size.	0	FASTA Manipulation	f
143	ABySS-Bundle Sequences	ac36a87a2d78c4a75994dcb5b40418b44	Bundle related sequences into a library for Abyss assembler.	0	NGS	f
144	ABySS Short Read Assembler	FEBCAE18-4F9B-1A22-5E20-B4F4D74C57B9	none	0		f
146	Cuffcompare	a21206ad98d4f4f3aacc9db5fdc8a3808	Compare your assembled transcripts to a reference annotation and track Cufflinks transcripts across multiple experiments.	0	NGS	f
147	CuffDiff	af615bf214d9c4253828a20d5868b2ec4	Find significant changes in transcript expression, splicing, and promoter use.	0	NGS	f
142	BLASTX Contig Annotation (Stage 1)	C8FEA992-336B-2149-FEAA-AB211262B1C5	none	0		f
151	BLASTX Contig Annotation (Stage 2)	ADEE47E5-F60A-01D6-E012-AC54BEE21128	none	0		f
152	PL	2F56CFBC-C158-9378-7A51-190EDB5FB9BF	none	0		f
153	Disparity	BC2BA17D-6CB0-4665-2955-8D96D30679F7	none	0		f
155	dnadist	53E12CC1-77A3-10DB-5F6C-F2139C48746A	none	0		f
\.


--
-- Data for Name: transformation_activity_mappings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation_activity_mappings (transformation_activity_id, mapping_id, hid) FROM stdin;
2	1	0
2	2	1
2	3	2
2	4	3
2	5	4
5	6	0
\.


--
-- Data for Name: transformation_step; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation_step (hid, name, id, description, transformation_id) FROM stdin;
1	alignment	s4544586b222163b584cd45445882d8d	Aligns sequences using tophat	1
2	merge	s0fdf1bdd1959485180a8558a7b03facc	Merges a set of reads for input to samtools	2
3	convertToBam	s1d7d1f27ebe7402f95412416e20fb41e	converts a sam file to bam format	3
4	bcalling	s9bd99b34623e4f55ba628e29db67be8c	Samtools Base Calling	4
5	filtering	s59fab872b0964204bdd812920a48fb00	Samtools filterig	5
6	convertovcf	s2334528f2f5147c8974b6ab26a9f29be	Convert to VCF	6
7	filterStep	sc581195cb48941928e24d797b79ae73e		7
8	callingStep	sc5a5ba4891f84b7086fc016298d83198		8
9	mergefastq	s8a4dbf8bbdc94186add29c0ac55e0dc3	Merge fastq Files	9
10	bwa	s8a4dbf8bbdc94186add29c0ac55e0dc3	Burrows Wheeler Aligner	10
11	alignment	s26a5412a58d04a0bb9dc36ec73c12ed8	 	11
12	alignment	s0b95dce328da449aba52012f5734c23e		12
13	contrastStep	s4cc35bf915904b7185da920cc639b68c	Accepts a list of names and checks them against a database of canonical names to return both exact and possible matches.	13
17	cace	sdf67e43d9aee496fa92a3c27cf6b9367	Continuous Ancestral Character Estimation	17
18	dace	s92c9f43c48f24f46adbbd94b4a70364a	Discrete Anacestral Character Estimation	18
19	FastxTrimmer	s99b7195053c1435ebce0886cc9494d95	Trims (cuts) barcodes or noise from FASTQ sequences.	19
20	FastxBarcodeSplitter	s2eadb27364cb4129bc043b8b695392ce	Splits a FASTQ file containing multiple samples.	20
21	FASTQQualityRescaler	sed9771830c994acb975662e1853624db	Converts FASTQ files from Illumina 1.3+ and Solexa formats to Sanger PHRED format	21
22	FastxClipper	s4dd23e56687f402f90e0d1efec0c7d17	Removes sequencing adapters / linkers from FASTQ files.	22
23	FastxQualityFilter	s39e30fcffe07414ba944fca3eb67159e	Filters FASTQ formatted sequences based on quality.	23
24	TnrsStep	s69860c905a0749a8afc14539b9ae6448	Accepts a list of names and checks them against a database of canonical names to return both exact and possible matches.	24
25	MUSCLE-V4	s78b4131d4ad54ba5a95f663cd973f405	\N	25
26	PhyML-3	s11f87b3da23c452ea067ced4bdbcee6f	\N	26
27	fastx_nt_distribution	s1718b644c4a6415ea8684a156bfe2220	\N	27
28	fastx_qchart	s391f2041208049248e44300c20d85dd7	\N	28
29	fastx_qstats_67	sa3a41a12499248bea15be88461131e00	\N	29
30	Find Lambda and run PL	s327c23ce85f143c29f46101f4abdf786	\N	30
31	Borda_Jason	s057f39e12f8245adab12b99d97c90d87	\N	31
32	cuffcompare	s3ea162e72a544401883d14234f580428	\N	32
33	lopper	s1792a165710647149534f9d059569a7d	\N	33
34	ouch	s2b0282338c01493c819ce997f8869309	\N	34
35	vcf_to_gff_4	s46e97bc4ec5541c5977f55aff5023f64	\N	35
36	ontologizer_v4	s8a607a9e82174efb993cc0dc12c06a8f	\N	36
37	naim_RAxML110608	sf07d276e2ce94b409371c255293bb636	\N	37
38	GetSeq	s5aedd0649f4d410397f57c01a0bd3d9c	\N	38
39	Ninja	sc003134dc3a341238e933f5d661defbb	\N	39
40	Kathleen's test tool for testing 1808	s1ddb77fdf83a4b8bafc6c31ef1431337	\N	40
41	Kathleen's test tool for testing 1808 EDITED	s578cfc78de9f4c259659ab26216e45d3	\N	41
42	please	s6cb403e2785642eaa73d581955b5ba65	\N	42
43	Some Tool	s7efed6c133a4458dbd4050f9ced6182c	\N	43
44	Some Other Tool	s7208edcc36934644a80671ad9ffad574	\N	44
45	Testing 1766	s2ca7002f80994025a13c8fb73338eb15	\N	45
46	dnaml	scf42c07bbbd54a418c1f1e4612a341b2	\N	46
47	QTLC_LRmapqtl	s5a6a5818d8fa4abe987d0eebbde67e83	\N	47
48	progressiveMauve	sfbb2f9e4c479408cba6a0862ec56fb29	\N	48
49	QTLC_SRmapqtl	s64b2aa819a1a4d538a88b816b482a2ee	\N	49
50	Fantastico	sb336a3e4f36148a9926b5dcf0a8bca7d	\N	50
51	My New Analysis	sb1dc25f41beb4ed2ac2d33ecacd3ff8a	\N	51
52	My new Analysis	sc2840ef93d7745808ecabaca212f4657	\N	52
53	QTLC_Zmapqtl	s91697400d1924bf89bb7f4a18f73a00c	\N	53
54	QTLC_JZmapqtl	sf05e12574de54ea3b6a2b4b30e071053	\N	54
55	QTLC_MImapqtl	se97c56a0c0c24d3f94d12e8a6574a197	\N	55
56	QTLC_Eqtl	s7c7c0943f1f74c049c4c76d363a10048	\N	56
58	Import into viewer	s8af709c90fb84088aee3dc6661cec7ea	\N	58
75	step_1	s3791d1e2cdba46e1941f64ef523344c0		75
77	step_1	s9cc1b4dfba864938af99eeea8240d234		77
79	step_1	sad70bd7f3d8440b49ff2d0dad0791124		79
83	step_1	s0d1c8df68c7d45cb9f84c0893020dd58		83
84	step_1	s09e83fced2e2495dba890a1987f1ea6e		84
86	step_1	s1650b4a75602484783c2d7b1fce20c5f		86
88	step_1	s80d51ca09cd4401b9621039a96ec29c4		88
89	step_1	s2bbce3ac0fc94f5c80c86a2902df78e9		89
90	step_1	s06b11dd0a90744a1a39144a413535a7a		90
92	step_1	sa6bf598dd0be494cb219b0f2ebba2aa7		92
103	DNAML	s9a4c8e7715ec4dd09618cc29135d20a9	\N	103
105	step_1	sa0616f96cba3456c91f179fc5bef69d0		105
106	step_1	s25eec772a649452f8f75ecdb8d395f10	Identify enrichment regions in ChIPseq data using a the PeakRanger algorithm.	106
117	step_1	s5a17880b27f345a68bdef4d3180b8af4		117
118	step_1	s71061535374b4457b6b0216ba93505bd		118
119	DNAPARS	saff3a7c4855040498afdcc1ddd05b130	\N	119
120	FastTree2	sb89b1ae8f43b494ea5b09dd6818e6d96	\N	120
121	PROML	s9f2f69959474416fad2bfe1844f7e6f1	\N	121
122	PROTPARS	s61c8f46da36543abb943d209fb69e11c	\N	122
123	PROTNJ	sd1fea80bcf374ffd80e0edcaba3b1175	\N	123
124	DNANJ	s71ed5ce6ea3f42ca82409337e37a655c	\N	124
130	step_1	s9532f67198444cf3b7a3b33a7129bab6		130
135	step_1	s9d27d8fd554e44ceab063e4956a809ad		135
136	Picante	s0058ba556129415aae62241fac25dff7	\N	136
137	test	s4bfff4b47e7045c9b03fe9a9a9261062	\N	137
138	FastX Trimmer Nicole test 070411	s3f7f987332774fe5b8c70093a9a53845	\N	138
139	Nicole test for quality filter	s722601ed5b664c3382d1de20c2d23bd1	\N	139
140	step_1	sd9a512695d374954b7cbe2b47081d552		140
141	step_1	sf0dba2de9f024133ab232784481008d1		141
142	TreeView	s5555afa79517495cac0274c984505fc9	\N	142
143	RAxML	s2f9c16b79265499383c38689d1933cbc	\N	143
144	dhanesh_trimmer	s57c8e89a16ef4720b5ed43af69cf7539	\N	144
145	PerlTest Eric Lyons	s08784ca779914f5c8fe81d63ee1194c7	\N	145
146	K Testing Trimmer on staging 7-6	s387bf54b1a8f4fb999316b86eff269c9	\N	146
147	Get sequences	s114f75f54ce84a999b3c4fc31450af43	\N	147
148	RAxML - Proteins	s623ac677bfcb4662afc7cd7c7b5a1d35	\N	148
149	RAxML - Nucleotides	s4209d61a5adb4fe29c2d1476b1e3917d	\N	149
150	CACE	s1a93d5a1b52746808afc0601b3df2c64	\N	150
151	step_1	sa198a1e4b86943a8befd995b915dbda1		151
152	QTLC_Rcross	s8fad9c02dba04ca199ef95f075a94515	\N	152
153	QTLC_Rmap	sc9ef883b06584508a6a99b13b18fc475	\N	153
154	QTLC_Rqtl	sb3b0b8035f344f429152603e7ab10125	\N	154
155	QTLC_Prune	s3a2119c23f6b4e66be63d3caf078bae8	\N	155
157	QTLC_Rmap2	s478718c656c048bf896db9b55e3cc208	\N	157
158	QTLC_Prune2	s265bd46691314723aba3630e0f9b81ae	\N	158
160	step_1	s217ba036d9d44b229802c9da0180c4ec		160
161	step_1	sa61d873850e8413eb2f2c28bda97b849		161
162	Storme's Tool	sbca1f5b85a2d4a29ba4dda9fced88de9	\N	162
163	Muscle v5	s1775e596fb024168a4f93db7d938d060	\N	163
165	Muscle-Test	sffea61627b5d475b92d25dca011893e7	\N	165
166	1_trimmer_tito	s6fd4761bd34b480eb057a6c0e9b8694d	\N	166
167	DACE	sa8b299ad2a9c4605adaa4f4aa4a67e85	\N	167
168	PerlTest2	s89cbb09d5c114752a99eee37aeaa6334	\N	168
170	step_1	s4aebfb6fedbe45969bf4b3169d01faca		170
171	perltest3	s0c9e9599091a453e8c08854b89793dc9	\N	171
172	CONTRAST	s62de0d00a2834e27afde90f3e62e37a8	\N	172
173	iPlantBordaTest	s3ae914fc671849e8a2dd0dae7b95be1e	\N	173
174	step_1	sdc4f370f19c7494fb2a8c63c8fb5898e		174
178	Muscle-BSA	s048d6ad01d0444e7a026df70602c5c12	\N	178
182	CanberraTest	s695bb3a1377a43229524231a22b024a5	\N	182
184	BBC biclustering	s653c94a56b24408bb2a6d6c571801b1b	\N	184
185	Ontologizer	sb72ad1f96840460699774aa7fad56b7c	\N	185
187	iPlantQxpakTest	s43db86875c314cb094220bcf38bef280	\N	187
188	qtlConvert	s102eda5191f94f2cb60c3c7c01b114ed	\N	188
189	Brutnell Lab RNAseq Pipeline	se9649bb44f0a4bc7894633e60a27b2ce	\N	189
192	step_1	sa90d505b615b4005a9e181e37eaf34f4		192
193	step_1	s5fdfd433df2d44e0a67d8a9b84315dbc		193
195	run_Vbay.shTest	saf20f396b2594412b4219396005b8bcd	\N	195
196	RandonJungleTest	sff6fe9b59b544e898c94055558f62395	\N	196
197	RandomJungleParseTest	s6b1c06c2ce6f41ad959c1437a5c6d472	\N	197
198	MECPMShortTest	s8c791eb5430e455fb9c9d99edd222681	\N	198
202	BLASTX Contig Annotation	sfdfcbf6e188342a99cf2a7dbd31f0940	\N	202
203	step_1	s8878da45990945c5b1fd71c17bdac264		203
204	ABySS Short Read Assembler	s75aa3deb464448aebea2a43b9c30fe6e	\N	204
205	step_1	s3fbc0c070a3e40c5a304fa955db9e4eb		205
207	step_1	s4bc287cc0b1b478f936c4e67739d2702		207
208	step_1	s11b0bb9106a14d398fa0d7c827919f3c		208
213	step_1	s4e403ba7f71448988db6316f374d97c7		213
215	BLASTX Contig Annotation (Step 2)	sdf985411d5784237a51d22fba6d919f9	\N	215
216	PL	se3226877a3044ab586a5c96aee6da63b	\N	216
217	Disparity	s3734575976664b0882449ae939e61e11	\N	217
219	dnadist	sfbde14ad80934056bce1b423dc19ed0c	\N	219
\.


--
-- Data for Name: transformation_task_step_precedence; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation_task_step_precedence (transformation_task_id, step_precedence_id, hid) FROM stdin;
\.


--
-- Data for Name: transformation_task_steps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation_task_steps (transformation_task_id, transformation_step_id, hid) FROM stdin;
1	1	0
2	2	0
2	3	1
2	4	2
2	5	3
2	6	4
3	7	0
4	8	0
5	9	0
5	10	1
6	11	0
7	12	0
8	13	0
10	17	0
11	18	0
12	19	0
13	20	0
14	21	0
15	22	0
16	23	0
17	24	0
18	25	0
19	26	0
20	27	0
21	28	0
22	29	0
23	30	0
24	31	0
25	32	0
26	33	0
27	34	0
28	35	0
29	36	0
30	37	0
31	38	0
32	39	0
33	40	0
34	41	0
35	42	0
36	43	0
37	44	0
38	45	0
39	46	0
40	47	0
41	48	0
42	49	0
43	50	0
44	51	0
45	52	0
46	53	0
47	54	0
48	55	0
49	56	0
51	58	0
95	145	0
96	146	0
97	147	0
98	148	0
99	149	0
100	150	0
60	151	0
101	152	0
102	153	0
103	154	0
104	155	0
55	75	0
57	77	0
59	79	0
63	83	0
64	84	0
65	86	0
67	88	0
68	89	0
69	90	0
71	92	0
106	157	0
107	158	0
58	160	0
56	161	0
108	162	0
109	163	0
73	103	0
74	105	0
66	106	0
111	165	0
112	166	0
113	167	0
114	168	0
75	117	0
76	118	0
78	119	0
79	120	0
80	121	0
81	122	0
82	123	0
83	124	0
77	170	0
115	171	0
116	172	0
117	173	0
84	130	0
72	174	0
85	135	0
86	136	0
87	137	0
88	138	0
89	139	0
90	140	0
91	141	0
92	142	0
93	143	0
94	144	0
121	178	0
125	182	0
127	184	0
128	185	0
146	208	0
129	187	0
130	188	0
131	189	0
135	195	0
132	192	0
133	193	0
136	196	0
137	197	0
138	198	0
142	202	0
143	203	0
144	204	0
141	205	0
62	207	0
147	213	0
151	215	0
152	216	0
153	217	0
155	219	0
\.


--
-- Data for Name: transformation_value; Type: TABLE DATA; Schema: public; Owner: -
--

COPY transformation_value (transformation_id, value, property) FROM stdin;
20	BC	prefix
20	/usr/local2/bin/fastx_barcode_splitter.sh	script
\.


--
-- Data for Name: validator; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validator (hid, id, name, description, label) FROM stdin;
1			\N	
2			\N	
3			\N	
4			\N	
5			\N	
6			\N	
7			\N	
8			\N	
9			\N	
10			\N	
11			\N	
12			\N	
13			\N	
14			\N	
15			\N	
16			\N	
17			\N	
18			\N	
19			\N	
20			\N	
21			\N	
22			\N	
23			\N	
24			\N	
25			\N	
26			\N	
27			\N	
28			\N	
29			\N	
30			\N	
31			\N	
32			\N	
33			\N	
34			\N	
35			\N	
36			\N	
37			\N	
38			\N	
39			\N	
40			\N	
41			\N	
42			\N	
43			\N	
44			\N	
45			\N	
46			\N	
47			\N	
48		Minimum read depth field	\N	
49		Maximum read depth field	\N	
50		SNPs around a gap field	\N	
51		Window size for filtering dense SNPs field	\N	
52		Max SNPs in a window field	\N	
53		Window size field	\N	
54			\N	
55			\N	
56		Theta parameter field	\N	
57		Number of haplotypes field	\N	
58		Expected fraction of differences between a pair of haplotypes	\N	
59			\N	
60			\N	
61			\N	
62			\N	
63			\N	
64			\N	
65			\N	
66			\N	
67			\N	
68			\N	
69			\N	
70			\N	
71			\N	
72			\N	
73			\N	
74			\N	
75			\N	
76			\N	
77			\N	
78			\N	
79			\N	
80			\N	
81			\N	
82			\N	
83			\N	
84			\N	
85			\N	
86			\N	
87			\N	
88			\N	
89			\N	
102			\N	
103			\N	
104		Allowed mismatches field	\N	
105			\N	
112	v7658a99fcf0d41438e786e4848df8f33		\N	
113	v33c93439920646f0b01d769e9ed95ee1		\N	
114	v2f6af8415f454ee8b15b5fb56e07f436		\N	
115	vc2437787a9944648a9120c07fbe53589		\N	
118	vde13f3ca3749434fbbfa4c8b41353ef3		\N	
119	v30f556281f1b49538989be6a9bcc7afa		\N	
120	vac77449fe1894428b65007a8937e8ae7		\N	
124	vb5815f6c517d41489a345be3a78a963c		\N	
125	va8905688ad2a4b869a4a0836d577c2cb		\N	
126	va0e0c3e908a4422fb2f21f41ffc7e97a		\N	
327	ve2fae771fed449bfa71dd32535b2fa38		\N	
132	v1fffe94127bb4ab49de133dcbe801a94		\N	
133	va1b564a1089944bf9e90901a010e7ef4		\N	
134	v2baa04e187b84be5800e45825c4c8045		\N	
135	v7f1c15d5a26f4c9c8cb066ebbc1a7bd5		\N	
136	v95c28ef853bd4ac0acc971bc02b4afc1		\N	
140	v632ff28470044b038a10d57912e4b7f0		\N	
141	v61e1238e816e49f5ba451b79befa83ed		\N	
142	vcee1dd0a6c7e47768c996575f46221d7		\N	
143	v5a0e6791abb84400a43edc5937f5c5ad		\N	
144	v504c390a16ed46efb198b9edcf8e7f37		\N	
145	v810590995cbe465db9ccffe7481257c3		\N	
146	v0bdcb3d600484f518210330597bf7290		\N	
147	v307041a24cc040878ea0c9b8f49f4d86		\N	
148	v52bd0eae9da74336839baccd379ff942		\N	
149	v2c0ee111f4d0442185efd14476fedaf4		\N	
150	v09fcc5d585b44798a857e3bd43d36f50		\N	
151	v981e7e4d0d2a4e9883764918368f833f		\N	
334	v3961958d697842259a722824f677cc82		\N	
324	v99632db621c9489cb24a91889cc4873a		\N	
326	vda13c6e198a74ca1a2b2d51fa155716f		\N	
172	vf325e172bd4e428cb6e64733fd1c9618		\N	
173	vb1b95deb7db048a8a3c9d0235b0fda94		\N	
180	v1a23f55dc32440fe91830458ad53a698		\N	
181	v9dfc852843c840c991f8d12d8424f485		\N	
186	v6d9dd3436acf457589ce7da24a717758		\N	
187	va8743812dbd14712b636dd37d70d61c1		\N	
192	vaa63a5a4926047929f1e6243e4b2c408		\N	
193	v7bf4b4ef7b234e579615273ee7173be8		\N	
194	v1d2dc3650ffb47ecb9950698339f1d79		\N	
195	v223dc57125d84293b017c07ba973949c		\N	
198	vfdde50ec10c44fbcbc1dec09b4d86ce3		\N	
199	v2775536e08c84025b7455fd9d5f59bdc		\N	
200	v9997511ba5504589be71cc64bcc89cc1		\N	
201	v78c7aab7884f48d7a33fc508f63bc6c4		\N	
202	v3771ad872ac44bd49403b7f8c0457688		\N	
203	v3443f6ba5beb46bda845756583344447		\N	
351	v1ac2fb313ae14d4fbe2f65563d949545		\N	
352	v181542392ffc48f890247b2cb817ad87		\N	
353	v544537d8623246309849bf6043100308		\N	
354	v14fa1080e9644f2284b79a9d6aefc8dd		\N	
355	v5b8c76dd8aea43eca270d95a12bdaeb2		\N	
356	vd75679e38b5c402887c2986d22ab1c64		\N	
357	v07b2f8239e0f4ac982b5ace0035313cb		\N	
358	vc7a95df178df4d20a512c5426b220966		\N	
361	veebeaf4fbf3246e3a23c32dcdf5bcb36		\N	
362	v7b7a141490294f77890b2aedf4c8adca		\N	
254	v1b8ed644522d4e4fb9aef2ab29f1dad4		\N	
255	v77a4287b649e48d4a1d9bb8186aeb9de		\N	
371	v1c6d4e84aff940348c00649e0ffdabd2		\N	
372	v4104dae6bcdf4e83813dbc1c0c79ff77		\N	
373	v4f6e11e93929452c84170f03daa97395		\N	
374	vbe28b79b6c844b68bd87b7e9e5ead1c4		\N	
376	v14397dfbaf254674b63889edc3297fd4		\N	
377	vff899ce7498f403db4c1a40a52c328e1		\N	
380	v89c3ba2b4cc8470f9fe23de3511d38ea		\N	
386	v9c008f44cb5a446a9347cc06d783083b		\N	
387	vcfd59e845d5f45ddbda37eb84d2fa2f1		\N	
388	vb983ac8447c74a00934f366874121c17		\N	
389	vae8a5b26b6c84f5d9e42b45630009f77		\N	
390	v39d3a9afa2d24facaf440c5082b10771		\N	
288	v917ae40f0fda43518cf6cc8280713a8e		\N	
289	vedd0eb57722f4a13a4f148fb13a8871e		\N	
290	v07af88e4173040659de64ffb85f7d40e		\N	
291	v4010b220674e4eff9e7f69c0a3f0edd7		\N	
292	ve76437a5611a445d85448ce5680dff19		\N	
293	v65afeef64b944928998746b125bd338c		\N	
294	vd1bdf9a890ac440f98544b305e236097		\N	
295	v58b0756e35c040808baba3ee0fd85657		\N	
403	vfb3f3477eb744232acfdd36ce9c85860		\N	
404	v4861f81fd0cc4609b780b109ba03d56b		\N	
407	vf276d98b7fe2471c8b5e9436a59ae91f		\N	
408	vb7e50285aaf3449daa5b2ad1c89e0191		\N	
411	v85702e5d7260452794ad6dd94d485f9d		\N	
412	vefebdcc02de747fd862cfbcfce5f485f		\N	
413	v03d0d35b06dc4848a6bce57303201640		\N	
414	ve80ea7c66190435893b0e52d308052a2		\N	
415	va7663c8a2bea4b55b92f57e3005e5d96		\N	
416	va2b241f7045f4bbfa44bc61d93d20a5b		\N	
417	v2126d63d632a4c3e9e01d3b9f9adac1e		\N	
418	v7151ed93c4ba4475922d4072ab6ec0fd		\N	
422	v1203434faf064e0ba3ff2c157ebf80db		\N	
423	v219f4a55feb6430bbb3a53a4eb436638		\N	
424	v03c8e9f5040f48e6bbcf0dadfd7bc053		\N	
425	v7e23b051f7b447d99666703e3eb7c610		\N	
426	v5edc9a4b30d142588dd8a047777a0bda		\N	
427	v5da0c7498c494189be69dcd71fecfd91		\N	
429	v44b4ef21f7a54815a7d60ab1fec85a0e		\N	
430	v987fe84f55f345be8686c39a5a8051ac		\N	
431	v4a233fbd035e4dc59676be7f82d4e6f1		\N	
432	v24b666a0a19b4c10aad1820e9a0e8afe		\N	
433	vd77c142ffbe2461c9f35172db7d7799d		\N	
687	v7f1f9e69e99b4059bb365733f0c97eac		\N	
688	v50811219fd754f849d9a085aa2b5cae9		\N	
689	vdcc112f9216240a0888b4ecfcbc3157e		\N	
690	v21f2295e164f4d2e900b59b491ad4916		\N	
691	v974bae9a44f14790a2197b3f32b2ed28		\N	
463	v49747cf844874489b0c33997e2d1e0d2		\N	
467	v3cb4cb1787204f26be8a4bfee6055f06		\N	
468	v07a7a3f5fe654243b09b0f75d157cc01		\N	
692	v9bd23015371e4b868ea978153757897f		\N	
693	v652441efda614f77979b114fb3528bd8		\N	
489	v1c8addb3d9194dafa1f0560e05cd52cc		\N	
696	vc09477c108c24b99a7c29cdd86b76702		\N	
697	vb72648d5e41c47b993b25349301e5bc3		\N	
642	v083831884528478490aceac75fa5195e		\N	
643	vc0e1880a307149659125f1c7a33c7c22		\N	
644	vfbd80f840ff64b84b75a4f836a55444f		\N	
645	vac916a161e6f413995c13963a45e43db		\N	
646	v27bfd0520cf34c31956bb4f719f66d05		\N	
647	v0c7cf789c3e24eaf8133a9c6996f9a77		\N	
648	v97e756f1141d48a294edf8c0a802990b		\N	
649	v2e795869a5b249b09718c8a43e4c7a22		\N	
650	v492328b22e7140e1b0bbe3b6077c4474		\N	
655	v0402765082d141f5ae55e1dcc633d31d		\N	
656	v13bd039995e04bdc83bce20f0f0cc5fd		\N	
657	vf90e82a941bd43119460eff6ad654894		\N	
658	vd6bcf6ed6a554917ab451df3c22b768b		\N	
739	v72e2f427d48743c2803550a8f0f2e6af		\N	
740	vfb091cd32c77421db73a3a0a39418c70		\N	
741	v6e315b168fb84500a6fff7fb4f6f1ccd		\N	
742	vb10b34fda363449dbe3faf9a7f75e705		\N	
743	v64af325e37e84f8abe192f15b0e4bb3e		\N	
744	v6a2a3e8a7985421bb268b8e3f7a014e1		\N	
745	vd6789b7c1acb442abd6b02da8f795bf5		\N	
746	v47894a3018314ecb8fdd834d05a3f9f3		\N	
747	vf87009596b334414b58a2c4f26be01bf		\N	
748	v6028fbe7e79b42989b8d9c338cbdf46f		\N	
749	vc8e5ec056b554cbe9868f7a266b2ba66		\N	
750	vdcc800a4aa234f3cbcbfcd9c849a38e3		\N	
751	v25253aea338b47d8b54b092f058ccb23		\N	
752	v28338f86a49f44d2924699d491b5854f		\N	
765	vc51c0dd25d474efc9aa398887e1c7d75		\N	
766	v6b9339290bed4acc9da82618659dad51		\N	
767	v48b59883cc174b6e917bd3893071087c		\N	
774	v22769ce7c601464ea582f36801b7bb3c		\N	
775	vecb95cc4875c44b8b1aba989cd3c01f2		\N	
776	vb83d420d46c34331810bd9c188b31ef3		\N	
779	v7d4dfcd80f1a43609954e65c050872c4		\N	
780	va221312252cb43458319b449e54cb6d2		\N	
781	v5947bf9f00da41d291e0df8e92fbe190		\N	
782	v697a854e92aa4394971bc399283baa53		\N	
783	v3e479b0627d94e919d8f2c3af1d12a66		\N	
784	vf18d0c9af3464c7d822dca9c88879578		\N	
785	vc1b8f35cc09f49198aa390ee6333998b		\N	
790	va5723d69ce9c4300882068ea4068bf3e		\N	
\.


--
-- Data for Name: validator_rule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY validator_rule (validator_id, rule_id, id) FROM stdin;
361	286	0
362	287	0
430	341	0
418	332	0
750	482	0
751	483	0
752	484	0
376	295	0
113	73	0
377	296	0
426	337	0
427	338	0
254	189	0
353	278	0
354	279	0
355	280	0
356	281	0
255	190	0
56	46	0
357	282	0
358	283	0
57	47	0
58	48	0
103	61	0
59	49	0
48	39	0
49	40	0
50	41	0
51	42	0
52	43	0
433	344	0
53	44	0
54	45	0
119	77	0
120	78	0
386	304	0
324	249	0
387	305	0
115	74	0
467	374	0
334	259	0
124	82	0
125	83	0
126	84	0
194	139	0
195	140	0
198	143	0
411	326	0
132	90	0
133	91	0
134	92	0
135	93	0
136	94	0
141	98	0
142	99	0
143	100	0
144	101	0
145	102	0
146	103	0
147	104	0
148	105	0
149	106	0
150	107	0
151	108	0
25	20	0
26	21	0
27	22	0
28	23	0
29	24	0
30	25	0
31	26	0
32	27	0
33	28	0
36	29	0
37	30	0
38	31	0
39	32	0
40	33	0
41	34	0
42	35	0
43	36	0
44	37	0
412	327	0
45	38	0
1	1	0
2	2	0
3	3	0
4	4	0
5	5	0
6	6	0
7	7	0
327	252	0
8	8	0
9	9	0
12	10	0
13	11	0
14	12	0
15	13	0
16	14	0
17	15	0
18	16	0
19	17	0
20	18	0
21	19	0
351	276	0
352	277	0
403	319	0
468	375	0
404	320	0
373	293	0
431	342	0
432	343	0
692	431	0
693	432	0
696	435	0
697	436	0
765	501	0
766	502	0
766	503	1
767	504	0
181	133	0
292	227	0
112	72	0
293	228	0
294	229	0
295	230	0
774	508	0
775	509	0
776	510	0
779	512	0
423	335	0
424	336	0
429	340	0
380	299	0
463	372	0
389	306	0
187	136	0
413	328	0
414	329	0
415	330	0
416	331	0
326	251	0
749	481	0
288	223	0
289	224	0
290	225	0
291	226	0
104	62	0
105	63	0
408	323	0
739	471	0
740	472	0
741	473	0
742	474	0
743	475	0
744	476	0
745	477	0
746	478	0
747	479	0
748	480	0
\.


--
-- Data for Name: value_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY value_type (hid, id, name, description) FROM stdin;
1	0115898A-F81A-4598-B1A8-06E538F1D774	String	Arbitrary text
2	E8E05E6C-5002-48C0-9167-C9733F0A9716	Boolean	True or false value
3	BCB81292-F01D-45B1-8598-3D6CD745D2E9	Number	Numeric value
\.

--------------------------------------------------
--
--
--------------------------------------------------


--
-- Name: annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- Name: block_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY block
    ADD CONSTRAINT block_pkey PRIMARY KEY (id);


--
-- Name: block_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY block_type
    ADD CONSTRAINT block_type_pkey PRIMARY KEY (id);


--
-- Name: classification_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (classificationid);


--
-- Name: contract_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contract
    ADD CONSTRAINT contract_pkey PRIMARY KEY (hid);


--
-- Name: contract_property_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contract_property
    ADD CONSTRAINT contract_property_pkey PRIMARY KEY (contract_id, id);


--
-- Name: contrast_job_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contrast_job
    ADD CONSTRAINT contrast_job_pkey PRIMARY KEY (id);


--
-- Name: data_format_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_format
    ADD CONSTRAINT data_format_pkey PRIMARY KEY (hid);


--
-- Name: dataelementpreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataelementpreservation
    ADD CONSTRAINT dataelementpreservation_pkey PRIMARY KEY (hid);


--
-- Name: dataobject_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataobject_mapping
    ADD CONSTRAINT dataobject_mapping_pkey PRIMARY KEY (mapping_id, output);


--
-- Name: dataobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_pkey PRIMARY KEY (hid);


--
-- Name: deployed_components_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY deployed_components
    ADD CONSTRAINT deployed_components_pkey PRIMARY KEY (hid);


--
-- Name: file_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_pkey PRIMARY KEY (id);


--
-- Name: file_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY file_type
    ADD CONSTRAINT file_type_pkey PRIMARY KEY (id);


--
-- Name: folder_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY folder
    ADD CONSTRAINT folder_pkey PRIMARY KEY (id);


--
-- Name: graph_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY graph
    ADD CONSTRAINT graph_pkey PRIMARY KEY (id);


--
-- Name: importedworkflow_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY importedworkflow
    ADD CONSTRAINT importedworkflow_pkey PRIMARY KEY (hid);


--
-- Name: info_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY info_type
    ADD CONSTRAINT info_type_pkey PRIMARY KEY (hid);


--
-- Name: input_output_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_pkey PRIMARY KEY (hid);


--
-- Name: job_information_new_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY job_information_new
    ADD CONSTRAINT job_information_new_pkey PRIMARY KEY (hid);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: multiplicity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY multiplicity
    ADD CONSTRAINT multiplicity_pkey PRIMARY KEY (hid);


--
-- Name: name_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY name
    ADD CONSTRAINT name_pkey PRIMARY KEY (nameid);


--
-- Name: nameparsed_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nameparsed
    ADD CONSTRAINT nameparsed_pkey PRIMARY KEY (nameid);


--
-- Name: namesource_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY namesource
    ADD CONSTRAINT namesource_pkey PRIMARY KEY (namesourceid);


--
-- Name: notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (hid);


--
-- Name: notification_set_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_pkey PRIMARY KEY (notification_set_id, hid);


--
-- Name: notification_set_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notification_set
    ADD CONSTRAINT notification_set_pkey PRIMARY KEY (hid);


--
-- Name: notifications_receivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notifications_receivers
    ADD CONSTRAINT notifications_receivers_pkey PRIMARY KEY (notification_id, hid);


--
-- Name: parent_template_child_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY parent_template_child_template
    ADD CONSTRAINT parent_template_child_template_pkey PRIMARY KEY (parent_id, hid);


--
-- Name: precedence_constraint_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY precedence_constraint
    ADD CONSTRAINT precedence_constraint_pkey PRIMARY KEY (hid);


--
-- Name: predicate_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY predicate_lookup
    ADD CONSTRAINT predicate_lookup_pkey PRIMARY KEY (id);


--
-- Name: property_group_contract_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY property_group_contract
    ADD CONSTRAINT property_group_contract_pkey PRIMARY KEY (property_group_id, id);


--
-- Name: property_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY property_group
    ADD CONSTRAINT property_group_pkey PRIMARY KEY (hid);


--
-- Name: property_group_property_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY property_group_property
    ADD CONSTRAINT property_group_property_pkey PRIMARY KEY (property_group_id, hid);


--
-- Name: property_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_pkey PRIMARY KEY (hid);


--
-- Name: property_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY property_type
    ADD CONSTRAINT property_type_pkey PRIMARY KEY (hid);


--
-- Name: provenance_action_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_action
    ADD CONSTRAINT provenance_action_pkey PRIMARY KEY (id);


--
-- Name: provenance_agent_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_agent_role
    ADD CONSTRAINT provenance_agent_role_pkey PRIMARY KEY (id);


--
-- Name: provenance_device_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_device
    ADD CONSTRAINT provenance_device_pkey PRIMARY KEY (id);


--
-- Name: provenance_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_event
    ADD CONSTRAINT provenance_event_pkey PRIMARY KEY (id);


--
-- Name: provenance_job_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_job
    ADD CONSTRAINT provenance_job_pkey PRIMARY KEY (id);


--
-- Name: provenance_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_location
    ADD CONSTRAINT provenance_location_pkey PRIMARY KEY (id);


--
-- Name: provenance_param_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance_param
    ADD CONSTRAINT provenance_param_pkey PRIMARY KEY (id);


--
-- Name: provenance_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provenance
    ADD CONSTRAINT provenance_pkey PRIMARY KEY (event_id, index);


--
-- Name: recordtable_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recordtable
    ADD CONSTRAINT recordtable_pkey PRIMARY KEY (id);


--
-- Name: recordtablefield_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recordtablefield
    ADD CONSTRAINT recordtablefield_pkey PRIMARY KEY (id);


--
-- Name: recordtablerecord_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recordtablerecord
    ADD CONSTRAINT recordtablerecord_pkey PRIMARY KEY (id);


--
-- Name: recordtablevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recordtablevalue
    ADD CONSTRAINT recordtablevalue_pkey PRIMARY KEY (id);


--
-- Name: rule_argument_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rule_argument
    ADD CONSTRAINT rule_argument_pkey PRIMARY KEY (rule_id, hid);


--
-- Name: rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_pkey PRIMARY KEY (hid);


--
-- Name: rule_subtype_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rule_subtype
    ADD CONSTRAINT rule_subtype_pkey PRIMARY KEY (hid);


--
-- Name: rule_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rule_type
    ADD CONSTRAINT rule_type_pkey PRIMARY KEY (hid);


--
-- Name: source_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY source
    ADD CONSTRAINT source_pkey PRIMARY KEY (sourceid);


--
-- Name: statement_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY statement
    ADD CONSTRAINT statement_pkey PRIMARY KEY (id);


--
-- Name: statement_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY statement_type
    ADD CONSTRAINT statement_type_pkey PRIMARY KEY (id);


--
-- Name: step_precedence_constraints_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY step_precedence_constraints
    ADD CONSTRAINT step_precedence_constraints_pkey PRIMARY KEY (step_precedence_id, hid);


--
-- Name: step_precedence_inbound_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY step_precedence_inbound
    ADD CONSTRAINT step_precedence_inbound_pkey PRIMARY KEY (step_precedence_id, hid);


--
-- Name: step_precedence_outbound_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY step_precedence_outbound
    ADD CONSTRAINT step_precedence_outbound_pkey PRIMARY KEY (step_precedence_id, hid);


--
-- Name: step_precedence_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY step_precedence
    ADD CONSTRAINT step_precedence_pkey PRIMARY KEY (hid);


--
-- Name: template_group_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template_group_group
    ADD CONSTRAINT template_group_group_pkey PRIMARY KEY (parent_group_id, hid);


--
-- Name: template_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template_group
    ADD CONSTRAINT template_group_pkey PRIMARY KEY (hid);


--
-- Name: template_group_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template_group_template
    ADD CONSTRAINT template_group_template_pkey PRIMARY KEY (template_group_id, hid);


--
-- Name: template_input_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template_input
    ADD CONSTRAINT template_input_pkey PRIMARY KEY (template_id, hid);


--
-- Name: template_output_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template_output
    ADD CONSTRAINT template_output_pkey PRIMARY KEY (template_id, hid);


--
-- Name: template_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template
    ADD CONSTRAINT template_pkey PRIMARY KEY (hid);


--
-- Name: template_property_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY template_property_group
    ADD CONSTRAINT template_property_group_pkey PRIMARY KEY (template_id, hid);


--
-- Name: thing_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY thing
    ADD CONSTRAINT thing_pkey PRIMARY KEY (id);


--
-- Name: thing_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY thing_type_code
    ADD CONSTRAINT thing_type_code_pkey PRIMARY KEY (id);


--
-- Name: transformation_activity_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation_activity_mappings
    ADD CONSTRAINT transformation_activity_mappings_pkey PRIMARY KEY (transformation_activity_id, hid);


--
-- Name: transformation_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation_activity
    ADD CONSTRAINT transformation_activity_pkey PRIMARY KEY (hid);


--
-- Name: transformation_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation
    ADD CONSTRAINT transformation_pkey PRIMARY KEY (id);


--
-- Name: transformation_step_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation_step
    ADD CONSTRAINT transformation_step_pkey PRIMARY KEY (hid);


--
-- Name: transformation_task_step_precedence_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation_task_step_precedence
    ADD CONSTRAINT transformation_task_step_precedence_pkey PRIMARY KEY (transformation_task_id, hid);


--
-- Name: transformation_task_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation_task_steps
    ADD CONSTRAINT transformation_task_steps_pkey PRIMARY KEY (transformation_task_id, hid);


--
-- Name: transformation_value_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transformation_value
    ADD CONSTRAINT transformation_value_pkey PRIMARY KEY (transformation_id, property);


--
-- Name: triple_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY triple
    ADD CONSTRAINT triple_pkey PRIMARY KEY (id);


--
-- Name: tropicosrawdata1_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tropicosrawdata1
    ADD CONSTRAINT tropicosrawdata1_pkey PRIMARY KEY (id);


--
-- Name: tropicosrawdata2_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tropicosrawdata2
    ADD CONSTRAINT tropicosrawdata2_pkey PRIMARY KEY (id);


--
-- Name: user_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_jobs
    ADD CONSTRAINT user_jobs_pkey PRIMARY KEY (id);


--
-- Name: validator_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validator
    ADD CONSTRAINT validator_pkey PRIMARY KEY (hid);


--
-- Name: validator_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY validator_rule
    ADD CONSTRAINT validator_rule_pkey PRIMARY KEY (validator_id, id);


--
-- Name: value_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY value_type
    ADD CONSTRAINT value_type_pkey PRIMARY KEY (hid);


--
-- Name: workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_pkey PRIMARY KEY (id);


--
-- Name: block_file_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY block
    ADD CONSTRAINT block_file_fkey FOREIGN KEY (file) REFERENCES file(id);


--
-- Name: block_graph_block_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY block_graph
    ADD CONSTRAINT block_graph_block_id_fkey FOREIGN KEY (block_id) REFERENCES block(id);


--
-- Name: block_graph_graph_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY block_graph
    ADD CONSTRAINT block_graph_graph_id_fkey FOREIGN KEY (graph_id) REFERENCES graph(id);


--
-- Name: block_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY block
    ADD CONSTRAINT block_type_fkey FOREIGN KEY (type) REFERENCES block_type(id);


--
-- Name: contract_property_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contract_property
    ADD CONSTRAINT contract_property_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(hid);


--
-- Name: contract_property_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contract_property
    ADD CONSTRAINT contract_property_property_id_fkey FOREIGN KEY (property_id) REFERENCES property(hid);


--
-- Name: contrast_job_workspace_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrast_job
    ADD CONSTRAINT contrast_job_workspace_id_fkey FOREIGN KEY (workspace_id) REFERENCES workspace(id);


--
-- Name: dataobject_mapping_mapping_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataobject_mapping
    ADD CONSTRAINT dataobject_mapping_mapping_id_fkey FOREIGN KEY (mapping_id) REFERENCES input_output_mapping(hid);


--
-- Name: dataobjects_data_format_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_data_format_fkey FOREIGN KEY (data_format) REFERENCES data_format(hid);


--
-- Name: dataobjects_info_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_info_type_fkey FOREIGN KEY (info_type) REFERENCES info_type(hid);


--
-- Name: dataobjects_multiplicity_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dataobjects
    ADD CONSTRAINT dataobjects_multiplicity_fkey FOREIGN KEY (multiplicity) REFERENCES multiplicity(hid);


--
-- Name: defaultclassification_nameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY defaultclassification
    ADD CONSTRAINT defaultclassification_nameid_fkey FOREIGN KEY (nameid) REFERENCES name(nameid);


--
-- Name: file_matrix_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY file_matrix
    ADD CONSTRAINT file_matrix_file_id_fkey FOREIGN KEY (file_id) REFERENCES file(id);


--
-- Name: file_matrix_matrix_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY file_matrix
    ADD CONSTRAINT file_matrix_matrix_id_fkey FOREIGN KEY (matrix_id) REFERENCES graph(id);


--
-- Name: file_taxa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_taxa_id_fkey FOREIGN KEY (taxa_id) REFERENCES graph(id);


--
-- Name: file_tree_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY file_tree
    ADD CONSTRAINT file_tree_file_id_fkey FOREIGN KEY (file_id) REFERENCES file(id);


--
-- Name: file_tree_tree_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY file_tree
    ADD CONSTRAINT file_tree_tree_id_fkey FOREIGN KEY (tree_id) REFERENCES graph(id);


--
-- Name: file_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_type_fkey FOREIGN KEY (type) REFERENCES file_type(id);


--
-- Name: folder_file_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY folder_file
    ADD CONSTRAINT folder_file_file_id_fkey FOREIGN KEY (file_id) REFERENCES file(id);


--
-- Name: folder_file_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY folder_file
    ADD CONSTRAINT folder_file_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES folder(id);


--
-- Name: folder_folder_child_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY folder_folder
    ADD CONSTRAINT folder_folder_child_folder_id_fkey FOREIGN KEY (child_folder_id) REFERENCES folder(id);


--
-- Name: folder_folder_parent_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY folder_folder
    ADD CONSTRAINT folder_folder_parent_folder_id_fkey FOREIGN KEY (parent_folder_id) REFERENCES folder(id);


--
-- Name: graph_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY graph
    ADD CONSTRAINT graph_file_id_fkey FOREIGN KEY (file_id) REFERENCES file(id);


--
-- Name: graph_root_thing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY graph
    ADD CONSTRAINT graph_root_thing_id_fkey FOREIGN KEY (root_thing_id) REFERENCES thing(id);


--
-- Name: graph_thing_graph_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY graph_thing
    ADD CONSTRAINT graph_thing_graph_id_fkey FOREIGN KEY (graph_id) REFERENCES graph(id);


--
-- Name: graph_thing_thing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY graph_thing
    ADD CONSTRAINT graph_thing_thing_id_fkey FOREIGN KEY (thing_id) REFERENCES thing(id);


--
-- Name: graph_triple_graph_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY graph_triple
    ADD CONSTRAINT graph_triple_graph_id_fkey FOREIGN KEY (graph_id) REFERENCES graph(id);


--
-- Name: graph_triple_triple_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY graph_triple
    ADD CONSTRAINT graph_triple_triple_id_fkey FOREIGN KEY (triple_id) REFERENCES triple(id);


--
-- Name: input_output_mapping_source_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_source_fkey FOREIGN KEY (source) REFERENCES transformation_step(hid);


--
-- Name: input_output_mapping_target_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY input_output_mapping
    ADD CONSTRAINT input_output_mapping_target_fkey FOREIGN KEY (target) REFERENCES transformation_step(hid);


--
-- Name: nameparsed_nameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nameparsed
    ADD CONSTRAINT nameparsed_nameid_fkey FOREIGN KEY (nameid) REFERENCES name(nameid);


--
-- Name: namesource_nameid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY namesource
    ADD CONSTRAINT namesource_nameid_fkey FOREIGN KEY (nameid) REFERENCES name(nameid);


--
-- Name: namesource_sourceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY namesource
    ADD CONSTRAINT namesource_sourceid_fkey FOREIGN KEY (sourceid) REFERENCES source(sourceid);


--
-- Name: notification_set_notification_notification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_notification_id_fkey FOREIGN KEY (notification_id) REFERENCES notification(hid);


--
-- Name: notification_set_notification_notification_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification_set_notification
    ADD CONSTRAINT notification_set_notification_notification_set_id_fkey FOREIGN KEY (notification_set_id) REFERENCES notification_set(hid);


--
-- Name: notifications_receivers_notification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications_receivers
    ADD CONSTRAINT notifications_receivers_notification_id_fkey FOREIGN KEY (notification_id) REFERENCES notification(hid);


--
-- Name: parent_template_child_template_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parent_template_child_template
    ADD CONSTRAINT parent_template_child_template_child_id_fkey FOREIGN KEY (child_id) REFERENCES template(hid);


--
-- Name: parent_template_child_template_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY parent_template_child_template
    ADD CONSTRAINT parent_template_child_template_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES template(hid);


--
-- Name: property_group_contract_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY property_group_contract
    ADD CONSTRAINT property_group_contract_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES contract(hid);


--
-- Name: property_group_contract_property_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY property_group_contract
    ADD CONSTRAINT property_group_contract_property_group_id_fkey FOREIGN KEY (property_group_id) REFERENCES property_group(hid);


--
-- Name: property_group_property_property_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY property_group_property
    ADD CONSTRAINT property_group_property_property_group_id_fkey FOREIGN KEY (property_group_id) REFERENCES property_group(hid);


--
-- Name: property_group_property_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY property_group_property
    ADD CONSTRAINT property_group_property_property_id_fkey FOREIGN KEY (property_id) REFERENCES property(hid);


--
-- Name: property_property_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_property_type_fkey FOREIGN KEY (property_type) REFERENCES property_type(hid);


--
-- Name: property_validator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY property
    ADD CONSTRAINT property_validator_fkey FOREIGN KEY (validator) REFERENCES validator(hid);


--
-- Name: provenance_agent_role_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance_agent_role
    ADD CONSTRAINT provenance_agent_role_event_id_fkey FOREIGN KEY (event_id) REFERENCES provenance_event(id);


--
-- Name: provenance_event_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance_event
    ADD CONSTRAINT provenance_event_action_id_fkey FOREIGN KEY (action_id) REFERENCES provenance_action(id);


--
-- Name: provenance_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance
    ADD CONSTRAINT provenance_event_id_fkey FOREIGN KEY (event_id) REFERENCES provenance_event(id);


--
-- Name: provenance_event_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance_event
    ADD CONSTRAINT provenance_event_job_id_fkey FOREIGN KEY (job_id) REFERENCES provenance_job(id);


--
-- Name: provenance_job_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance_job
    ADD CONSTRAINT provenance_job_device_id_fkey FOREIGN KEY (device_id) REFERENCES provenance_device(id);


--
-- Name: provenance_location_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance_location
    ADD CONSTRAINT provenance_location_event_id_fkey FOREIGN KEY (event_id) REFERENCES provenance_event(id);


--
-- Name: provenance_param_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY provenance_param
    ADD CONSTRAINT provenance_param_job_id_fkey FOREIGN KEY (job_id) REFERENCES provenance_job(id);


--
-- Name: recordtable_file_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recordtable
    ADD CONSTRAINT recordtable_file_fkey FOREIGN KEY (file) REFERENCES file(id);


--
-- Name: recordtablefield_recordtable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recordtablefield
    ADD CONSTRAINT recordtablefield_recordtable_id_fkey FOREIGN KEY (recordtable_id) REFERENCES recordtable(id);


--
-- Name: recordtablerecord_recordtable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recordtablerecord
    ADD CONSTRAINT recordtablerecord_recordtable_id_fkey FOREIGN KEY (recordtable_id) REFERENCES recordtable(id);


--
-- Name: recordtablevalue_recordtablefield_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recordtablevalue
    ADD CONSTRAINT recordtablevalue_recordtablefield_fkey FOREIGN KEY (recordtablefield) REFERENCES recordtablefield(id);


--
-- Name: recordtablevalue_recordtablerecord_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY recordtablevalue
    ADD CONSTRAINT recordtablevalue_recordtablerecord_fkey FOREIGN KEY (recordtablerecord) REFERENCES recordtablerecord(id);


--
-- Name: rule_argument_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule_argument
    ADD CONSTRAINT rule_argument_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rule(hid);


--
-- Name: rule_rule_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule
    ADD CONSTRAINT rule_rule_type_fkey FOREIGN KEY (rule_type) REFERENCES rule_type(hid);


--
-- Name: rule_type_value_type_rule_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_rule_type_id_fkey FOREIGN KEY (rule_type_id) REFERENCES rule_type(hid);


--
-- Name: rule_type_value_type_value_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rule_type_value_type
    ADD CONSTRAINT rule_type_value_type_value_type_id_fkey FOREIGN KEY (value_type_id) REFERENCES value_type(hid);


--
-- Name: statement_block_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statement
    ADD CONSTRAINT statement_block_fkey FOREIGN KEY (block) REFERENCES block(id);


--
-- Name: statement_graph_graph_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statement_graph
    ADD CONSTRAINT statement_graph_graph_id_fkey FOREIGN KEY (graph_id) REFERENCES graph(id);


--
-- Name: statement_graph_statement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statement_graph
    ADD CONSTRAINT statement_graph_statement_id_fkey FOREIGN KEY (statement_id) REFERENCES statement(id);


--
-- Name: statement_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY statement
    ADD CONSTRAINT statement_type_fkey FOREIGN KEY (type) REFERENCES statement_type(id);


--
-- Name: step_precedence_constraints_precedence_constraint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY step_precedence_constraints
    ADD CONSTRAINT step_precedence_constraints_precedence_constraint_id_fkey FOREIGN KEY (precedence_constraint_id) REFERENCES precedence_constraint(hid);


--
-- Name: step_precedence_constraints_step_precedence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY step_precedence_constraints
    ADD CONSTRAINT step_precedence_constraints_step_precedence_id_fkey FOREIGN KEY (step_precedence_id) REFERENCES step_precedence(hid);


--
-- Name: step_precedence_inbound_step_precedence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY step_precedence_inbound
    ADD CONSTRAINT step_precedence_inbound_step_precedence_id_fkey FOREIGN KEY (step_precedence_id) REFERENCES step_precedence(hid);


--
-- Name: step_precedence_inbound_transformation_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY step_precedence_inbound
    ADD CONSTRAINT step_precedence_inbound_transformation_step_id_fkey FOREIGN KEY (transformation_step_id) REFERENCES transformation_step(hid);


--
-- Name: step_precedence_outbound_step_precedence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY step_precedence_outbound
    ADD CONSTRAINT step_precedence_outbound_step_precedence_id_fkey FOREIGN KEY (step_precedence_id) REFERENCES step_precedence(hid);


--
-- Name: step_precedence_outbound_transformation_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY step_precedence_outbound
    ADD CONSTRAINT step_precedence_outbound_transformation_step_id_fkey FOREIGN KEY (transformation_step_id) REFERENCES transformation_step(hid);


--
-- Name: template_group_group_parent_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_group_group
    ADD CONSTRAINT template_group_group_parent_group_id_fkey FOREIGN KEY (parent_group_id) REFERENCES template_group(hid);


--
-- Name: template_group_group_subgroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_group_group
    ADD CONSTRAINT template_group_group_subgroup_id_fkey FOREIGN KEY (subgroup_id) REFERENCES template_group(hid);


--
-- Name: template_group_template_template_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_group_template
    ADD CONSTRAINT template_group_template_template_group_id_fkey FOREIGN KEY (template_group_id) REFERENCES template_group(hid);


--
-- Name: template_group_template_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_group_template
    ADD CONSTRAINT template_group_template_template_id_fkey FOREIGN KEY (template_id) REFERENCES transformation_activity(hid);


--
-- Name: template_input_input_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_input
    ADD CONSTRAINT template_input_input_id_fkey FOREIGN KEY (input_id) REFERENCES dataobjects(hid);


--
-- Name: template_input_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_input
    ADD CONSTRAINT template_input_template_id_fkey FOREIGN KEY (template_id) REFERENCES template(hid);


--
-- Name: template_output_output_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_output
    ADD CONSTRAINT template_output_output_id_fkey FOREIGN KEY (output_id) REFERENCES dataobjects(hid);


--
-- Name: template_output_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_output
    ADD CONSTRAINT template_output_template_id_fkey FOREIGN KEY (template_id) REFERENCES template(hid);


--
-- Name: template_property_group_property_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_property_group
    ADD CONSTRAINT template_property_group_property_group_id_fkey FOREIGN KEY (property_group_id) REFERENCES property_group(hid);


--
-- Name: template_property_group_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY template_property_group
    ADD CONSTRAINT template_property_group_template_id_fkey FOREIGN KEY (template_id) REFERENCES template(hid);


--
-- Name: thing_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY thing
    ADD CONSTRAINT thing_type_fkey FOREIGN KEY (type) REFERENCES thing_type_code(id);


--
-- Name: transformation_activity_mapping_transformation_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_activity_mappings
    ADD CONSTRAINT transformation_activity_mapping_transformation_activity_id_fkey FOREIGN KEY (transformation_activity_id) REFERENCES transformation_activity(hid);


--
-- Name: transformation_activity_mappings_mapping_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_activity_mappings
    ADD CONSTRAINT transformation_activity_mappings_mapping_id_fkey FOREIGN KEY (mapping_id) REFERENCES input_output_mapping(hid);


--
-- Name: transformation_step_transformation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_step
    ADD CONSTRAINT transformation_step_transformation_id_fkey FOREIGN KEY (transformation_id) REFERENCES transformation(id);


--
-- Name: transformation_task_step_precedence_step_precedence_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_task_step_precedence
    ADD CONSTRAINT transformation_task_step_precedence_step_precedence_id_fkey FOREIGN KEY (step_precedence_id) REFERENCES step_precedence(hid);


--
-- Name: transformation_task_step_precedence_transformation_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_task_step_precedence
    ADD CONSTRAINT transformation_task_step_precedence_transformation_task_id_fkey FOREIGN KEY (transformation_task_id) REFERENCES transformation_activity(hid);


--
-- Name: transformation_task_steps_transformation_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_task_steps
    ADD CONSTRAINT transformation_task_steps_transformation_step_id_fkey FOREIGN KEY (transformation_step_id) REFERENCES transformation_step(hid);


--
-- Name: transformation_task_steps_transformation_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_task_steps
    ADD CONSTRAINT transformation_task_steps_transformation_task_id_fkey FOREIGN KEY (transformation_task_id) REFERENCES transformation_activity(hid);


--
-- Name: transformation_value_transformation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY transformation_value
    ADD CONSTRAINT transformation_value_transformation_id_fkey FOREIGN KEY (transformation_id) REFERENCES transformation(id);


--
-- Name: triple_object_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY triple
    ADD CONSTRAINT triple_object_fkey FOREIGN KEY (object) REFERENCES thing(id);


--
-- Name: triple_predicate_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY triple
    ADD CONSTRAINT triple_predicate_fkey FOREIGN KEY (predicate) REFERENCES predicate_lookup(id);


--
-- Name: triple_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY triple
    ADD CONSTRAINT triple_subject_fkey FOREIGN KEY (subject) REFERENCES thing(id);


--
-- Name: validator_rule_rule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validator_rule
    ADD CONSTRAINT validator_rule_rule_id_fkey FOREIGN KEY (rule_id) REFERENCES rule(hid);


--
-- Name: validator_rule_validator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY validator_rule
    ADD CONSTRAINT validator_rule_validator_id_fkey FOREIGN KEY (validator_id) REFERENCES validator(hid);


--
-- Name: workspace_home_folder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY workspace
    ADD CONSTRAINT workspace_home_folder_fkey FOREIGN KEY (home_folder) REFERENCES folder(id);

--------------------------------------------------
-- NOW IT'S TIME TO COMMIT -----------------------
--------------------------------------------------

COMMIT;

--------------------------------------------------
-- END OF SCRIPT ---------------------------------
--------------------------------------------------