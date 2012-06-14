--This is the reference_genomes.json from metadactly to be autopopulated in the
--postgresDB in the genome_reference table.

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
<<<<<<< HEAD
VALUES ('4bb9856a-43da-4f67-bdf9-f90916b4c11f', ':Arabidopsis lyrata (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Arabidopsis_lyrata.1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('18027404-d09f-41bf-99a4-74197ce0e7bf', ':Rattus norvegicus [Rat] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Rattus_norvegicus.RGSC3.4/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('2b1154f3-6c10-4707-a5ea-50d6eb890582', ':Zea mays [Maize] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Zea_mays.AGPv2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('e38b6fae-2e4b-4217-8c1f-6badea3ff7fc', ':Canis familiaris [Dog] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Canis_familiaris.BROAD2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('72facaa7-ba29-49ee-b184-42ba3c015ca4', ':Equus caballus [Horse] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Equus_caballus.EquCab2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('e21e71f2-219f-4704-a8a6-9ab487a759a6', ':Oryza brachyantha (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_brachyantha.v1.4b/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('9875f6cc-0503-418b-b5cc-8cb8dd44d56d', ':Setaria italica [Foxtail millet] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Setaria_italica.JGIv2.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('46f9d53d-36b6-4bd9-b4f2-ff952833103f', ':Oryza indica (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_indica.ASM465v1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('2d748e14-47f5-4a91-bc67-214787ad0843', ':Chlamydomonas reinhardtii (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Chlamydomonas_reinhardtii.v3.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('ef269f1a-e561-4f0c-92b7-3d9d8e7362f3', ':Drosophila melanogaster [Fruitfly] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Drosophila_melanogaster.BGDP5/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('8af62f2b-15fc-4f36-ae04-c6b801d98c1b', ':Vitis vinifera [Grape] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Vitis_vinifera.IGPP_12x/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('2c967e76-9b8a-4a3b-aa30-2e7de3a0a952', ':Sorghum bicolor [Sorghum] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Sorghum_bicolor.Sorbi1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('58a84f5e-3922-43dc-8414-e42b1513be78', ':Physcomitrella patens (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Physcomitrella_patens.AMS242v1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('c4dadc23-e0d2-481c-a3d1-1f5067e6528e', ':Gallus gallus [Chicken] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Gallus_gallus.WASHUC2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('4fce9ee9-0471-436b-938d-2e1820a71e6c', ':Homo sapiens [Human] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Homo_sapiens.GRCh37/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('f772929d-0ba3-4432-8623-7a74bf2720aa', ':Meleagris gallopavo [Turkey] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Meleagris_gallopavo.UMD2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('ba3d662f-0f71-45fa-83a3-7a80b9bb2b3f', ':Xenopus tropicalis [Xenopus] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Xenopus_tropicalis.JGI_4.2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('41149e71-4328-4391-b1d2-25fdbdca5a54', ':Felis catus [Cat] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Felis_catus.CAT/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('bb5317ce-ad00-466b-8109-432c117c0781', ':Sus scrofa [Pig] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Sus_scrofa.Sscrofa10.2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('eb059ac7-ee82-421a-bbc1-12f117366c4a', ':Danio rerio [Zebrafish] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Danio_rerio.Zv9/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('a55701bc-44e6-4661-bc3a-888ca1febaed', ':Pan troglodytes [Chimp] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Pan_troglodytes.CHIMP2.1.4/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('6149be1b-7aaa-43b4-84df-de2567ab9489', ':Mus musculus [Mouse] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Mus_musculus.NCBIM37/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('ca94864b-b5a3-49a7-9638-0d57715a301d', ':Brassica rapa (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Brassica_rapa.IVFCAASv1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('826f0934-69a5-401d-8b5f-36da33fc520e', ':Glycine max [Soybean] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Glycine_max.V1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('80aa0d1a-f32c-439a-940d-c9a6d629ed43', ':Populus trichocarpa [Poplar] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Populus_trichocarpa.JGI2.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('756adb31-72f4-487f-ba95-c5bcca7b13b5', ':Caenorhabditis elegans [C. elegans] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Caenorhabditis_elegans.WBcel215/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('7f66a989-9bb6-42c4-9db3-0e316304c93e', ':Arabidopsis thaliana (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Arabidopsis_thaliana.TAIR10/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('999a1d22-d2d8-4845-b685-da6403e9016e', ':Cyanidioschyzon merolae (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Cyanidioschyzon_merolae.ASM9120v1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('8683bbe8-c577-42f8-8d9b-1bdd861122ae', ':Brachypodium distachyon (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Brachypodium_distachyon.1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('e4785abc-f1e7-4d71-9ae6-bff4f2b4613b', ':Oreochromis niloticus [Tilapia] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Oreochromis_niloticus.Orenil1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('72de2532-bdf6-46b3-bffa-6c4860d63813', ':Bos taurus [Cow] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Bos_taurus.UMD3.1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('f3197615-747d-44c6-bd5f-293cbde95bab', ':Gadus morhua [Cod] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Gadus_morhua.gadMor1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('bdc96014-9b89-4dbc-9376-bc4805d9c1dd', ':Selaginella moellendorffii (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Selaginella_moellendorffii.v1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('1e1c62e5-bd56-4cfa-b3ab-aa6a1496d3e5', ':Solanum lycopersicum [Tomato] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Solanum_lycopersicum.SL2.40/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('0876c503-9634-488b-9584-ac6c0d565b8d', ':Oryza sativa [Rice] (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_sativa.MSU6/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('ea2e3413-924e-4de3-b012-05d906dd5d4a', ':Caenorhabditis elegans [C. elegans] (Ensembl 66)',
 '/data2/collections/genomeservices/0.2.1/Caenorhabditis_elegans.WS220/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('443befdd-c7ed-4b33-ac67-56a6748d7a48', ':Tursiops truncatus [Dolphin] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Tursiops_truncatus.turTru1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('70a34bd3-a7a4-4c7e-8ff5-36335b3f9b57', ':Saccharomyces cerevisiae [Yeast] (Ensembl 67)',
 '/data2/collections/genomeservices/0.2.1/Saccharomyces_cerevisiae.EF4/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('7e5eff7b-35fa-4635-806c-06ef5ef50db4', ':Oryza glaberrima (Ensembl 14)',
 '/data2/collections/genomeservices/0.2.1/Oryza_glaberrima.AGI1.1/de_support/',0,0);
=======
VALUES ('A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11','Arabidopsis lyrata Araly1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Arabidopsis_lyrata.Araly1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('54DC0C16-226C-458A-B186-5E570228A130','Arabidopsis thaliana TAIR10 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Arabidopsis_thaliana.TAIR10/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('61DC0C16-226C-458A-B186-5E570258A130','Bos taurus UMD3.1 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Bos_taurus.UMD3.1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('ABF7B800-21BE-44EB-84DB-0F87E7094B27','Brachypodium distachyon Brachy1.0 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Brachypodium_distachyon.Brachy1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('FCE82CED-6E9F-4909-B360-AA7FE0072DD7','Brassica rapa IVFCAASv1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Brassica_rapa.IVFCAASv1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('806B6D5A-DF12-448B-BC14-206F1543F13F','Caenorhabditis elegans WS220 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Caenorhabditis_elegans.WS220/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('B46C7DAE-9521-43DA-A7DA-8BDB76BE06FA','Canis familiaris BROADD2 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Canis_familiaris.BROADD2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('B7FE13D8-A9E0-408C-946F-5E3AFB922E7D','Chlamydomonas reinhardtii ENA1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Chlamydomonas_reinhardtii.ENA1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('F1BE1410-9C90-41D1-84DD-04B674E488CF','Cyanidioschyzon merolae ENA1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Cyanidioschyzon_merolae.ENA1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('2EF5D109-BF75-4497-AD82-701852D274A3','Danio rerio Zv9 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Danio_rerio.Zv9/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('0CF5BA6C-9DE6-4D1D-A909-66FC69F6A4E8','Drosophila melanogaster BDGP5 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Drosophila_melanogaster.BDGP5/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('F0F4D4F7-7782-41BF-8986-A161879CF3EC','Felis catus CAT (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Felis_catus.CAT/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('E4C89C48-84E4-487F-BE14-427562EFB5A4','Glycine max 1.0 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Glycine_max.1.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('0D5FD2AC-69E7-4E5C-B0FE-4B7BD2EA9348','Homo sapiens GRCh37 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Homo_sapiens.GRCh37/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('7FFE68A5-70BE-44D6-8A48-236D2E2BAF7A','Mus musculus NCBIM37 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Mus_musculus.NCBIM37/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('D09C1C16-225C-459A-B187-5E570229A130','Oryza glaberrima AGI1.1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Oryza_glaberrima.AGI1.1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('970E8ED8-B65D-46FA-899E-03D6344397DC','Oryza indica Jan_2005 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Oryza_indica.Jan_2005/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('563DF22A-0B33-44EE-A30D-2B5033D8C71E','Oryza sativa MSU6 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Oryza_sativa.MSU6/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('0F1BC02C-7741-4CC5-9936-D4692F412070','Pan troglodytes CHIMP2.1.4 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Pan_troglodytes.CHIMP2.1.4/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('9B5AED20-7882-44AB-BEBC-8DD7B4C7E13F','Physcomitrella patens Phypa1.1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Physcomitrella_patens.Phypa1.1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('710A06B3-FB13-4843-A607-80FD303B555D','Populus trichocarpa JGI2.0 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Populus_trichocarpa.JGI2.0/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('080C3A4A-3566-4C62-9F4D-04F129915761','Rattus norvegicus RGSC3.4 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Rattus_norvegicus.RGSC3.4/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('08D6F8D0-5B93-4607-9159-DC0BBDF3EC70','Saccharomyces cerevisiae EF4 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Saccharomyces_cerevisiae.EF4/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('1CFEAAD6-F5F2-4B2A-BA85-A16A9E8EB35C','Selaginella moellendorffii ENA1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Selaginella_moellendorffii.ENA1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('B533B529-8602-4FBD-B812-A2279CCEE452','Sorghum bicolor Sbi1 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Sorghum_bicolor.Sbi1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('803A7C3D-69A4-46EE-B884-72C2636A2B29','Tursiops truncatus turTru1 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Tursiops_truncatus.turTru1/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('891AD871-8204-4F3E-B296-173511D4B0F3','Vitis vinifera IGGP_12x (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Vitis_vinifera.IGGP_12x/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('E47B2299-BA9C-47C5-9EAF-1CF7A90754BF','Xenopus tropicalis JGI_4.2 (Ensembl 66)',
    '/data2/collections/genomeservices/0.2/Xenopus_tropicalis.JGI_4.2/de_support/',0,0);

INSERT INTO genome_reference (uuid, name, path, created_by, last_modified_by)
VALUES ('0699265D-6F90-4C46-B15C-1E294C76B3D4','Zea mays AGPv2 (Ensembl 13)',
    '/data2/collections/genomeservices/0.2/Zea_mays.AGPv2/de_support/',0,0);
>>>>>>> acb940928884b9ee2a897cef076fa31462028c95
