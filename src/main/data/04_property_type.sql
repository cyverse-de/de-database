SET search_path = public, pg_catalog;

--
-- Data for Name: property_type; Type: TABLE DATA; Schema: public; Owner: de
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
17	C00ED92F-5399-490C-A6E5-AAD0E140D7FE	Input	Input file or folder	\N	f	999	4
18	F7007237-040D-4253-9323-CAA4F71E9795	Output	Output file or folder	\N	f	999	5
\.
