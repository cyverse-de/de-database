SET search_path = public, pg_catalog;

--
-- Data for Name: rule_type; Type: TABLE DATA; Schema: public; Owner: de
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
