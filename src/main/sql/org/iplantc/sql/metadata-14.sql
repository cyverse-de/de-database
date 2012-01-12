\set ON_ERROR_STOP ON

BEGIN;

-- Delete analyses for which users have requested deletion.  At the time these
-- statements were generated there was only one analysis with each name.  These
-- analyses are only being marked as deleted, so we can easily restore them if
-- analyses that should not have been deleted are deleted.
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'BBC biclustering';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Borda_Jason';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'CanberraTest';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Compute FASTX Quality Stats';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'cuffcompare';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'DACE';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Disparity';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Disparity-110916';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'dnadist';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'FaST-LMMC';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'FASTA/Q Nucleotide Distribution Chart';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'FASTQ Quality Chart';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Find Lamda and run PL';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Get sequences';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'GetSeq';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Import into viewer';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'iPlantQxpakTest';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'MECPMShortTest';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'MUSCLE';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Muscle-BSA';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Ontologizer';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'ontologizer_v4';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'ouch';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'P_19_DP_TITO_1';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'Picante';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'PL';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'RandomJungleParseTest';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'RandomJungleTest';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'RAxML';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'run_Vbay.shTest';

-- Decategorize any analyses that are being recategorized.
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Bayesian BiClustering tool'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'eFP Batch Tool'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'ontologizer_v5'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'page'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'GeneMania Query Runner'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'NAMD '
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Cuffcompare'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'CuffDiff'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Cufflinks Transcript Quantification and Assembly'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'RNAfold'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QC and Processing'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'BWA Aligner for Paired-End Illumina Reads'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QC and Processing'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'SOAP2 Aligner for Paired-End Illumina Reads'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QC and Processing'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'SOAP2 Aligner for Single-End Illumina Reads'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QC and Processing'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'TopHat Aligner for Paired-End Illumina Reads'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QC and Processing'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'TopHat Aligner for Single-End Illumina Reads'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Utility'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Create BAM FROM SAM file'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Utility'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'NCBI SRA Toolkit fastq-dump'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Picante-110916'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Phylogenetic Comparative Methods and Trait Evolution'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'CACE'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Phylogenetic Comparative Methods and Trait Evolution'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'CONTRAST'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'DACE-bugfix'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Disparity through time-110916'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Molecular Dating with Penalized Likelihood'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'OUCH'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'DNAML'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'DNANJ'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'DNAPARS'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'FastTree2'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Ninja'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'PhyML'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'PROML'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'PROTNJ'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'PROTPARS'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'RAxML - Nucleotides'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'RAxML - Proteins'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Utility Tools and Scripts'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'lopper'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Utility Tools and Scripts'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'TreeView'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Eqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QTL Mapping and Genome-wide Association Studies'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_JZmapqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QTL Mapping and Genome-wide Association Studies'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_LRmapqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_MImapqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Prune2'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Rcross'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Rmap'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Rmap2'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Rqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QTL Mapping and Genome-wide Association Studies'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_SRmapqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'QTL Mapping and Genome-wide Association Studies'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Zmapqtl'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'QTLC_Prune'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'qtlConvert'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'Sequence Alignments and Phylogenetic Tree Building'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'progressiveMauve'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'GFFRead: Convert GFF to GTF'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Muscle v5'
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE name = 'In Progress'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity WHERE name = 'Numeric Evaluation of a Data Column'
    );

-- Insert the new analysis categories.
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('0AEF9E94-7E55-490F-9579-3F569F7B3A75', 'Functional Analysis', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
        )
    )
    FROM template_group p, template_group c
    WHERE p.id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
    AND c.id = '0AEF9E94-7E55-490F-9579-3F569F7B3A75'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('6221599D-7423-4C03-BB45-26515BC53410', 'Molecular Structure', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
        )
    )
    FROM template_group p, template_group c
    WHERE p.id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
    AND c.id = '6221599D-7423-4C03-BB45-26515BC53410'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('FCA7A71A-7B55-42D3-81E7-8F121C929125', 'Phylogenetics', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
        )
    )
    FROM template_group p, template_group c
    WHERE p.id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
    AND c.id = 'FCA7A71A-7B55-42D3-81E7-8F121C929125'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('25C7CAA8-EFA4-4D61-B461-236D1A650006', 'QTL and GWAS', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
        )
    )
    FROM template_group p, template_group c
    WHERE p.id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
    AND c.id = '25C7CAA8-EFA4-4D61-B461-236D1A650006'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('DE5FB3F5-843E-4302-AD50-784DED2DDD9C', 'Sequence Alignments', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
        )
    )
    FROM template_group p, template_group c
    WHERE p.id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
    AND c.id = 'DE5FB3F5-843E-4302-AD50-784DED2DDD9C'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('9F379746-B92B-406A-837B-E04994424C54', '', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
        )
    )
    FROM template_group p, template_group c
    WHERE p.id = 'g12c7a585ec233352e31302e323112a7ccf18bfd7364'
    AND c.id = '9F379746-B92B-406A-837B-E04994424C54'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('D90B5B32-4AD3-47EE-BBF3-B09F8DFFB346', 'Utilities', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'NGS'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'NGS'
    AND c.id = 'D90B5B32-4AD3-47EE-BBF3-B09F8DFFB346'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('5D3C7256-80DD-43D8-B022-F92E4B9DBCD8', 'Community Ecology', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'Phylogenetics'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'Phylogenetics'
    AND c.id = '5D3C7256-80DD-43D8-B022-F92E4B9DBCD8'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('FBF99767-24BF-4298-B27D-3069A402D844', 'Comparative Methods', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'Phylogenetics'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'Phylogenetics'
    AND c.id = 'FBF99767-24BF-4298-B27D-3069A402D844'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('53214A69-7867-4EE8-919A-12204160739E', 'Evolutionary Models', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'Phylogenetics'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'Phylogenetics'
    AND c.id = '53214A69-7867-4EE8-919A-12204160739E'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('5EF3E0A4-470C-4EC3-8B28-5691FB26F4DC', 'Tree Building', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'Phylogenetics'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'Phylogenetics'
    AND c.id = '5EF3E0A4-470C-4EC3-8B28-5691FB26F4DC'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('961722E4-5996-47F2-A53B-B9D8B2CF12EE', 'Hierarchical', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'Sequence Alignments'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'Sequence Alignments'
    AND c.id = '961722E4-5996-47F2-A53B-B9D8B2CF12EE'
    GROUP BY p.hid, c.hid;
INSERT INTO template_group (id, name, description, workspace_id)
    VALUES ('BE729DD1-4A04-4CFA-A168-AAD0ECA290F2', 'Simple', '', 0);
INSERT INTO template_group_group (parent_group_id, subgroup_id, hid)
    SELECT p.hid, c.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE name = 'Sequence Alignments'
        )
    )
    FROM template_group p, template_group c
    WHERE p.name = 'Sequence Alignments'
    AND c.id = 'BE729DD1-4A04-4CFA-A168-AAD0ECA290F2'
    GROUP BY p.hid, c.hid;

-- Recategorize some analyses.
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Functional Analyses'
    AND t.name = 'Bayesian BiClustering tool'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Functional Analyses'
    AND t.name = 'eFP Batch Tool'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Functional Analyses'
    AND t.name = 'ontologizer_v5'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Functional Analysis'
    AND t.name = 'page'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'RNAseq Analysis'
    AND t.name = 'Cuffcompare'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'RNAseq Analysis'
    AND t.name = 'CuffDiff'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'RNAseq Analysis'
    AND t.name = 'Cufflinks Transcript Quantification and Assembly'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Functional Analysis'
    AND t.name = 'GeneMania Query Runner'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Molecular Structure'
    AND t.name = 'NAMD '
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Molecular Structure'
    AND t.name = 'RNAfold'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Aligners'
    AND t.name = 'BWA Aligner for Paired-End Illumina Reads'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Aligners'
    AND t.name = 'SOAP2 Aligner for Paired-End Illumina Reads'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Aligners'
    AND t.name = 'SOAP2 Aligner for Single-End Illumina Reads'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Aligners'
    AND t.name = 'TopHat Aligner for Paired-End Illumina Reads'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Aligners'
    AND t.name = 'TopHat Aligner for Single-End Illumina Reads'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Utilities'
    AND t.name = 'Create BAM from SAM file'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Utilities'
    AND t.name = 'NCBI SRA Toolkit fastq-dump'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Community Ecology'
    AND t.name = 'Picante-110916'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Comparative Methods'
    AND t.name = 'CACE'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Comparative Methods'
    AND t.name = 'CONTRAST'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Comparative Methods'
    AND t.name = 'DACE-bugfix'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Comparative Methods'
    AND t.name = 'Disparity through time-110916'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Evolutionary Models'
    AND t.name = 'Molecular Dating with Penalized Likelihood'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Evolutionary Models'
    AND t.name = 'OUCH'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'DNAML'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'DNANJ'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'DNAPARS'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'FastTree2'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'Ninja'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'PhyML'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'PROML'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'PROTNJ'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'PROTPARS'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'RAxML - Nucleotides'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Tree Building'
    AND t.name = 'RAxML - Proteins'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Utility Tools and Scripts'
    AND t.name = 'lopper'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Utility Tools and Scripts'
    AND t.name = 'TreeView'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Eqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_JZmapqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_LRmapqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_MImapqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Prune2'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Rcross'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Rmap'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Rmap2'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Rqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_SRmapqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Zmapqtl'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'QTLC_Prune'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'QTL and GWAS'
    AND t.name = 'qtlConvert'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Hierarchical'
    AND t.name = 'progressiveMauve'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Utility Tools and Scripts'
    AND t.name = 'GFFRead: Convert GFF to GTF'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Simple'
    AND t.name = 'Muscle v5'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g.name = 'Utility Tools and Scripts'
    AND t.name = 'Numeric Evaluation of a Data Column'
    AND NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE tgt.template_group_id = g.hid
        AND tgt.template_id = t.hid
    );

-- Add descriptions to some analyses.
UPDATE transformation_activity
    SET description = 'Retrieves DNA and protein sequences from NCBI''s GenBank database'
    WHERE name = 'Get sequences';
UPDATE transformation_activity
    SET description = 'Import data from the NCBI Sequence Read Archive by FTP URL using the ultra-fast Aspera protocol'
    WHERE name = 'NCBI SRA Import';
UPDATE transformation_activity
    SET description = 'A robust model-based biclustering method that can discover biologically significant gene-condition clusters in microarray data.'
    WHERE name = 'Bayesian BiClustering tool';
UPDATE transformation_activity
    SET description = 'Fetch gene expression images from BAR eFP Browser given a list of genes'
    WHERE name = 'eFP Batch Tool';
UPDATE transformation_activity
    SET description = 'Performs ontology category enrichment on a gene list'
    WHERE name = 'ontologizer_v5';
UPDATE transformation_activity
    SET description = 'Calculates functional enrichment on a gene list using Parametric Geneset'
    WHERE name = 'page';
UPDATE transformation_activity
    SET description = 'Predicts gene interaction network given a list of seed genes'
    WHERE name = 'GeneMania Query Runner';
UPDATE transformation_activity
    SET description = 'Performs de novo assembly of short reads using the ABySS assembler. Please see documentation.'
    WHERE name = 'ABySS Short Read Assembler';
UPDATE transformation_activity
    SET description = 'Bundles FASTQ sequence files into archives for the ABySS assembler running at iPlant'
    WHERE name = 'ABySS-Bundle Sequences';
UPDATE transformation_activity
    SET description = 'Uses BLASTX against plant RefSeq to begin annotating a collection of FASTA contigs'
    WHERE name = 'BLASTX Contig Annotation (Stage 1)';
UPDATE transformation_activity
    SET description = 'Compile results from BLASTX Contig Annotation (Stage 1) into human-readable reports'
    WHERE name = 'BLASTX Contig Annotation (Stage 2)';
UPDATE transformation_activity
    SET description = 'Filters a multi-FASTA file by minimum sequence size'
    WHERE name = 'FASTA Minimum Size Filter';
UPDATE transformation_activity
    SET description = 'Weaves Read1 and Read2 files from paired-end sequencing into a single FASTQ file'
    WHERE name = 'Interlace Paired FASTQ files';
UPDATE transformation_activity
    SET description = 'Compiles N50, maximum contig length, etc on a multi-FASTA file'
    WHERE name = 'Sequence Statistics';
UPDATE transformation_activity
    SET description = 'A multi-purpose, ultrafast ChIP Seq peak caller co-developed by modENCODE and iPlant'
    WHERE name = 'PeakRanger';
UPDATE transformation_activity
    SET description = 'Change the quality scale for a FASTQ file to Sanger (PHRED33)'
    WHERE name = 'FASTQ Quality Rescaler';
UPDATE transformation_activity
    SET description = 'Provides a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines'
    WHERE name = 'FastQC';
UPDATE transformation_activity
    SET description = 'De-multiplexes a FASTQ file given a barcodes file'
    WHERE name = 'FASTX Barcode Splitter (Single End)';
UPDATE transformation_activity
    SET description = 'Analyze the transfrags assembled using Cufflinks'
    WHERE name = 'Cuffcompare';
UPDATE transformation_activity
    SET description = 'Find significant changes in transcript expression, splicing, and promoter use across RNAseq alignment data files'
    WHERE name = 'CuffDiff';
UPDATE transformation_activity
    SET description = 'Assembles RNAseq alignments into a parsimonious set of transcripts, then estimates the relative abundances of these transcripts based on how many reads support each one, taking into account biases in library preparation protocols.'
    WHERE name = 'Cufflinks Transcript Quantification and Assembly';
UPDATE transformation_activity
    SET description = 'Creates a position-sorted BAM file from a SAM alignment file'
    WHERE name = 'Create BAM from SAM file';
UPDATE transformation_activity
    SET description = 'Converts .sra and .sralite formats to FASTQ'
    WHERE name = 'NCBI SRA Toolkit fastq-dump';
UPDATE transformation_activity
    SET description = 'Version 1.0 Samtools reference pipeline for SNP calling'
    WHERE name = 'Find SNPs';
UPDATE transformation_activity
    SET description = 'Convert VCF files to GFF3 (suitable for viewing in Gbrowse or IGV)'
    WHERE name = 'VCF to GFF3';
UPDATE transformation_activity
    SET description = 'Tools for integrating phylogenies and ecology (based on the R package Picante by Steven Kembel)'
    WHERE name = 'Picante-110916';
UPDATE transformation_activity
    SET description = 'Maximum likelihood ancestral character estimation for continuous traits'
    WHERE name = 'CACE';
UPDATE transformation_activity
    SET description = 'Phylogenetic Independent Contrasts from the PHYLIP package'
    WHERE name = 'CONTRAST';
UPDATE transformation_activity
    SET description = 'Maximum likelihood ancestral character estimation for discrete traits'
    WHERE name = 'DACE-bugfix';
UPDATE transformation_activity
    SET description = 'Calculates disparity at each node of the tree, creates disparity-through time plots, and tests the significance of observed values'
    WHERE name = 'Disparity through time-110916';
UPDATE transformation_activity
    SET description = 'Estimates the node ages of a tree and finds the best smoothing value (lambda) through maximum likelihood (based on the R package ape by Emmanuel Paradis) '
    WHERE name = 'Molecular Dating with Penalized Likelihood';
UPDATE transformation_activity
    SET description = 'Ornstein-Uhlenbeck models for phylogenetic comparative hypotheses'
    WHERE name = 'OUCH';
UPDATE transformation_activity
    SET description = 'DNA maximum likelihood from the PHYLIP package'
    WHERE name = 'DNAML';
UPDATE transformation_activity
    SET description = 'DNA neighbor-joining from the PHYLIP package'
    WHERE name = 'DNANJ';
UPDATE transformation_activity
    SET description = 'DNA parsimony from the PHYLIP package'
    WHERE name = 'DNAPARS';
UPDATE transformation_activity
    SET description = 'Approximate maximum likelihood for DNA or protein sequences'
    WHERE name = 'FastTree2';
UPDATE transformation_activity
    SET description = 'Large-scale neighbor-joining phylogeny inference'
    WHERE name = 'Ninja';
UPDATE transformation_activity
    SET description = 'Protein maximum likelihood from the PHYLIP package'
    WHERE name = 'PROML';
UPDATE transformation_activity
    SET description = 'Protein neighbor-joining from the PHYLIP package'
    WHERE name = 'PROTNJ';
UPDATE transformation_activity
    SET description = 'Protein parsimony from the PHYLIP package'
    WHERE name = 'PROTPARS';
UPDATE transformation_activity
    SET description = 'Rapid maximum likelihood-based inference of large phylogenetic trees for nucleotide sequences'
    WHERE name = 'RAxML - Nucleotides';
UPDATE transformation_activity
    SET description = 'Rapid maximum likelihood-based inference of large phylogenetic trees for amino acid sequences'
    WHERE name = 'RAxML - Proteins';
UPDATE transformation_activity
    SET description = 'Reduces pairs of phylogenetic datasets to the common set of taxa'
    WHERE name = 'lopper';
UPDATE transformation_activity
    SET description = 'Uploads trees to the on-line Tree Viewer with support for newick, nexus and nexML'
    WHERE name = 'TreeView';
UPDATE transformation_activity
    SET description = 'MUltiple Sequence Comparison by Log- Expectation for DNA or protein sequences'
    WHERE name = 'Muscle v5';
UPDATE transformation_activity
    SET description = 'Changes the case of selected columns in a file'
    WHERE name = 'Change Case';
UPDATE transformation_activity
    SET description = 'Joins files together head to tail'
    WHERE name = 'Concatenate Multiple Files';
UPDATE transformation_activity
    SET description = 'Extracts selected columns from a file'
    WHERE name = 'Cut Columns';
UPDATE transformation_activity
    SET description = 'Extracts a specified number of lines from the beginning of file'
    WHERE name = 'Extract First Lines From a File';
UPDATE transformation_activity
    SET description = 'Extracts a specified number of lines from the end of file'
    WHERE name = 'Extract Last Lines From a File';
UPDATE transformation_activity
    SET description = 'Identify and extract matching lines from a file'
    WHERE name = 'Find Lines Matching A Regular Expression';
UPDATE transformation_activity
    SET description = 'Find and extract lines from a text file matching a simple string or regular expression'
    WHERE name = 'Find Lines Matching An Expression';
UPDATE transformation_activity
    SET description = 'Finds the unique values in a file'
    WHERE name = 'Find Unique Values';
UPDATE transformation_activity
    SET description = 'Use the gffread application bundled with Cufflinks to convert GFF to GTF'
    WHERE name = 'GFFRead: Convert GFF to GTF';
UPDATE transformation_activity
    SET description = 'Make changes in a text file wherever certain patterns appear, or extract data from parts of certain lines while discarding the rest'
    WHERE name = 'GNU awk';
UPDATE transformation_activity
    SET description = 'Performs a merge on two files based on values in a selected column'
    WHERE name = 'Merge Two Files By Key Columns';
UPDATE transformation_activity
    SET description = 'Counts the number of words, characters, and bytes in a file'
    WHERE name = 'Word Count';
UPDATE transformation_activity
    SET description = 'fits mixed models to genotype and phenotype data, supports environmental covariates'
    WHERE name = 'QXPak';
UPDATE transformation_activity
    SET description = 'selects genotype markers important for phenotype'
    WHERE name = 'Random Jungle';
UPDATE transformation_activity
    SET description = 'selects genotype markers important for phenotype'
    WHERE name = 'Random Jungle Parse';
UPDATE transformation_activity
    SET description = 'selects genotype markers important for phenotype'
    WHERE name = 'vbay';
UPDATE transformation_activity
    SET description = 'combines lists of important markers, genes, etc using a voting method to generate the best combined list'
    WHERE name = 'iPlantBorda';
UPDATE transformation_activity
    SET description = 'selects sets of genotype markers important for phenotype (only yes-no phenotypes)'
    WHERE name = 'MECPM';

-- Add entries for known integrators.
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Naim Matasci', 'nmatasci@iplantcollaborative.org');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Matt Vaughn', 'vaughn@iplantcollaborative.org');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Elijah Meyers', 'esm2310@vt.edu');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Kuan Yang', 'yangkuan81@gmail.com');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Akshay Kakumanu', 'kaksh89@vt.edu');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Juan Raygoza', 'raygoza@iplantcollaborative.org');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Jerry Lu', 'luj@cshl.edu');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Jeremy Beaulieu', 'jeremy.beaulieu@yale.edu');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Sheldon McKay', 'smckay@iplantcollaborative.org');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Barb Banbury', 'bbanbury@utk.edu');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Eric Lyons', 'elyons@iplantcollaborative.org');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Liya Wang', 'wangli@cshl.edu');
INSERT INTO integration_data (integrator_name, integrator_email)
    VALUES ('Ann Stapleton/Jason Vandeventer', 'wangli@cshl.edu');

-- Associate analyses with integrators.
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'Get sequences';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'NCBI SRA Import';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Elijah Meyers'
        AND integrator_email = 'esm2310@vt.edu'
    )
    WHERE name = 'Bayesian BiClustering tool';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'eFP Batch Tool';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Kuan Yang'
        AND integrator_email = 'yangkuan81@gmail.com'
    )
    WHERE name = 'ontologizer_v5';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Akshay Kakumanu'
        AND integrator_email = 'kaksh89@vt.edu'
    )
    WHERE name = 'page';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'GeneMania Query Runner';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Juan Raygoza'
        AND integrator_email = 'raygoza@iplantcollaborative.org'
    )
    WHERE name = 'NAMD ';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Juan Raygoza'
        AND integrator_email = 'raygoza@iplantcollaborative.org'
    )
    WHERE name = 'RNAfold';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'BWA Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'BWA Aligner for Single-End Illumina Reads';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'SOAP2 Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'SOAP2 Aligner for Single-End Illumina Reads';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'TopHat Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'TopHat Aligner for Paired-End Illumina Reads (Fixed)';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'TopHat Aligner for Single-End Illumina Reads';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'TopHat Aligner for Single-End Illumina Reads (Fixed)';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'ABySS Short Read Assembler';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'ABySS-Bundle Sequences';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'BLASTX Contig Annotation (Stage 1)';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'BLASTX Contig Annotation (Stage 2)';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FASTA Minimum Size Filter';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Interlace Paired FASTQ files';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Sequence Statistics';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'PeakRanger';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FASTQ Quality Rescaler';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FastQC';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FASTX Barcode Splitter (Single End)';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FASTX Clipper';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FASTX Quality Filter';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'FASTX Trimmer';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Cuffcompare';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'CuffDiff';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Cufflinks Transcript Quantification and Assembly';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Create BAM from SAM file';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'NCBI SRA Toolkit fastq-dump';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Find SNPs';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Jerry Lu'
        AND integrator_email = 'luj@cshl.edu'
    )
    WHERE name = 'VCF to GFF3';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Jeremy Beaulieu'
        AND integrator_email = 'jeremy.beaulieu@yale.edu'
    )
    WHERE name = 'Picante-110916';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'CACE';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'CONTRAST';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'DACE-bugfix';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Barb Banbury'
        AND integrator_email = 'bbanbury@utk.edu'
    )
    WHERE name = 'Disparity through time-110916';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Barb Banbury'
        AND integrator_email = 'bbanbury@utk.edu'
    )
    WHERE name = 'Molecular Dating with Penalized Likelihood';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Jeremy Beaulieu'
        AND integrator_email = 'jeremy.beaulieu@yale.edu'
    )
    WHERE name = 'OUCH';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'DNAML';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'DNANJ';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'DNAPARS';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'FastTree2';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'Ninja';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Eric Lyons'
        AND integrator_email = 'elyons@iplantcollaborative.org'
    )
    WHERE name = 'PhyML';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'PROML';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'PROTNJ';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'PROTPARS';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'RAxML - Nucleotides';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'RAxML - Proteins';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'lopper';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Naim Matasci'
        AND integrator_email = 'nmatasci@iplantcollaborative.org'
    )
    WHERE name = 'TreeView';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Eqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_JZmapqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_LRmapqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_MImapqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Prune2';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Rcross';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Rmap';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Rmap2';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Rqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_SRmapqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Zmapqtl';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QTLC_Prune';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Liya Wang'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'qtlConvert';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Eric Lyons'
        AND integrator_email = 'elyons@iplantcollaborative.org'
    )
    WHERE name = 'progressiveMauve';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Sheldon McKay'
        AND integrator_email = 'smckay@iplantcollaborative.org'
    )
    WHERE name = 'Muscle v5';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Change Case';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Concatenate Multiple Files';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Cut Columns';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Extract First Lines From a File';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Extract Last Lines From a File';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Find Lines Matching A Regular Expression';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Find Lines Matching An Expression';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Find Unique Values';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'GFFRead: Convert GFF to GTF';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'GNU awk';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Merge Two Files By Key Columns';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Numeric Evaluation of a Data Column';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Matt Vaughn'
        AND integrator_email = 'vaughn@iplantcollaborative.org'
    )
    WHERE name = 'Word Count';
UPDATE transformation_activity
    SET integration_data_id = (
        SELECT id FROM integration_data
        WHERE integrator_name = 'Ann Stapleton/Jason Vandeventer'
        AND integrator_email = 'wangli@cshl.edu'
    )
    WHERE name = 'QXPak';

-- Add documentation links to the analyses that have them.
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Get+Sequences'
    WHERE name = 'Get sequences';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/NCBI+SRA+Import'
    WHERE name = 'NCBI SRA Import';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/BBC+biclustering'
    WHERE name = 'Bayesian BiClustering tool';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/eFP+Batch+Retrieve'
    WHERE name = 'eFP Batch Tool';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Ontologize'
    WHERE name = 'ontologizer_v5';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/PAGE'
    WHERE name = 'page';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/GeneMania+Query+Runner'
    WHERE name = 'GeneMania Query Runner';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/NAMD'
    WHERE name = 'NAMD ';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/RNAfold'
    WHERE name = 'RNAfold';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/BWA'
    WHERE name = 'BWA Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/BWA'
    WHERE name = 'BWA Aligner for Single-End Illumina Reads';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/SOAP2+Aligner'
    WHERE name = 'SOAP2 Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/SOAP2+Aligner'
    WHERE name = 'SOAP2 Aligner for Single-End Illumina Reads';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/TopHat'
    WHERE name = 'TopHat Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/TopHat'
    WHERE name = 'TopHat Aligner for Paired-End Illumina Reads (Fixed)';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/TopHat'
    WHERE name = 'TopHat Aligner for Single-End Illumina Reads';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/TopHat'
    WHERE name = 'TopHat Aligner for Single-End Illumina Reads (Fixed)';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/ABySS+Short+Read+Assembler'
    WHERE name = 'ABySS Short Read Assembler';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/ABySS-Bundle+Sequences'
    WHERE name = 'ABySS-Bundle Sequences';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/BLASTX+Contig+Annotation+%28Stage+1%29'
    WHERE name = 'BLASTX Contig Annotation (Stage 1)';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/BLASTX+Contig+Annotation+%28Stage+2%29'
    WHERE name = 'BLASTX Contig Annotation (Stage 2)';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FASTA+Minimum+Size+Filter'
    WHERE name = 'FASTA Minimum Size Filter';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Interlace+Paired+FASTQ+files'
    WHERE name = 'Interlace Paired FASTQ files';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Sequence+Statistics'
    WHERE name = 'Sequence Statistics';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/PeakRanger'
    WHERE name = 'PeakRanger';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FASTQ+Quality+Rescaler'
    WHERE name = 'FASTQ Quality Rescaler';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FastQC'
    WHERE name = 'FastQC';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FASTX+Clipper'
    WHERE name = 'FASTX Clipper';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FASTX+Quality+Filter'
    WHERE name = 'FASTX Quality Filter';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FASTX+Trimmer'
    WHERE name = 'FASTX Trimmer';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/CuffCompare'
    WHERE name = 'Cuffcompare';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/CuffDiff'
    WHERE name = 'CuffDiff';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Cufflinks'
    WHERE name = 'Cufflinks Transcript Quantification and Assembly';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Create+BAM+from+SAM+file'
    WHERE name = 'Create BAM from SAM file';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/fastq-dump'
    WHERE name = 'NCBI SRA Toolkit fastq-dump';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p4/FindSNPs'
    WHERE name = 'Find SNPs';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/vcf_to_gff_4'
    WHERE name = 'VCF to GFF3';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Picante'
    WHERE name = 'Picante-110916';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/CACE'
    WHERE name = 'CACE';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/CONTRAST'
    WHERE name = 'CONTRAST';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/DACE'
    WHERE name = 'DACE-bugfix';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Disparity'
    WHERE name = 'Disparity through time-110916';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Molecular+Dating+with+Penalized+Likelihood'
    WHERE name = 'Molecular Dating with Penalized Likelihood';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/OUCH'
    WHERE name = 'OUCH';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/DNAML'
    WHERE name = 'DNAML';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/DNANJ'
    WHERE name = 'DNANJ';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/DNAPARS'
    WHERE name = 'DNAPARS';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/FastTree2'
    WHERE name = 'FastTree2';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Ninja'
    WHERE name = 'Ninja';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/PhyMl'
    WHERE name = 'PhyML';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/PROML'
    WHERE name = 'PROML';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/PROTNJ'
    WHERE name = 'PROTNJ';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/PROTPARS'
    WHERE name = 'PROTPARS';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/RAxML'
    WHERE name = 'RAxML - Nucleotides';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/RAxML-+Proteins'
    WHERE name = 'RAxML - Proteins';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/lopper'
    WHERE name = 'lopper';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/TreeView'
    WHERE name = 'TreeView';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Eqtl'
    WHERE name = 'QTLC_Eqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_JZmapqtl'
    WHERE name = 'QTLC_JZmapqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_LRmapqtl'
    WHERE name = 'QTLC_LRmapqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_MImapqtl'
    WHERE name = 'QTLC_MImapqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Prune2'
    WHERE name = 'QTLC_Prune2';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Rcross'
    WHERE name = 'QTLC_Rcross';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Rmap'
    WHERE name = 'QTLC_Rmap';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Rmap2'
    WHERE name = 'QTLC_Rmap2';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Rqtl'
    WHERE name = 'QTLC_Rqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_SRmapqtl'
    WHERE name = 'QTLC_SRmapqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Zmapqtl'
    WHERE name = 'QTLC_Zmapqtl';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/QTLC_Prune'
    WHERE name = 'QTLC_Prune';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/qtlConvert'
    WHERE name = 'qtlConvert';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/progressiveMauve'
    WHERE name = 'progressiveMauve';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/MUSCLE'
    WHERE name = 'Muscle v5';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Change+Case'
    WHERE name = 'Change Case';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Concatenate+Multiple+Files'
    WHERE name = 'Concatenate Multiple Files';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Cut+Columns'
    WHERE name = 'Cut Columns';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Extract+First+Lines+From+a+File'
    WHERE name = 'Extract First Lines From a File';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Extract+Last+Lines+From+a+File'
    WHERE name = 'Extract Last Lines From a File';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Find+Lines+Matching+a+Regular+Expression'
    WHERE name = 'Find Lines Matching A Regular Expression';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Finding+Lines+Matching'
    WHERE name = 'Find Lines Matching An Expression';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Find+Unique+Values'
    WHERE name = 'Find Unique Values';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Convert+GFF+to+GTF'
    WHERE name = 'GFFRead: Convert GFF to GTF';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/GNU+awk'
    WHERE name = 'GNU awk';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Merge+Two+Files+By+Key+Columns'
    WHERE name = 'Merge Two Files By Key Columns';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Numeric+Evaluation+of+a+Data+Column'
    WHERE name = 'Numeric Evaluation of a Data Column';
UPDATE transformation_activity
    SET wikiurl = 'https://pods.iplantcollaborative.org/wiki/display/DEman0p6/Word+Count'
    WHERE name = 'Word Count';

-- Rename some analyses.
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'NCBI GenBank Import';
UPDATE transformation_activity SET name = 'NCBI GenBank Import'
    WHERE name = 'Get sequences';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Bayesian BiClustering';
UPDATE transformation_activity SET name = 'Bayesian BiClustering'
    WHERE name = 'Bayesian BiClustering tool';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'eFP Batch Retrieve';
UPDATE transformation_activity SET name = 'eFP Batch Retrieve'
    WHERE name = 'eFP Batch Tool';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Ontologizer';
UPDATE transformation_activity SET name = 'Ontologizer'
    WHERE name = 'ontologizer_v5';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'PAGE';
UPDATE transformation_activity SET name = 'PAGE'
    WHERE name = 'page';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'TopHat Aligner for Paired-End Illumina Reads';
UPDATE transformation_activity SET name = 'TopHat Aligner for Paired-End Illumina Reads'
    WHERE name = 'TopHat Aligner for Paired-End Illumina Reads (Fixed)';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'TopHat Aligner for Single-End Illumina Reads';
UPDATE transformation_activity SET name = 'TopHat Aligner for Single-End Illumina Reads'
    WHERE name = 'TopHat Aligner for Single-End Illumina Reads (Fixed)';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'CuffCompare';
UPDATE transformation_activity SET name = 'CuffCompare'
    WHERE name = 'Cuffcompare';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Picante';
UPDATE transformation_activity SET name = 'Picante'
    WHERE name = 'Picante-110916';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'DACE';
UPDATE transformation_activity SET name = 'DACE'
    WHERE name = 'DACE-bugfix';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Disparity through Time';
UPDATE transformation_activity SET name = 'Disparity through Time'
    WHERE name = 'Disparity through time-110916';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Ornstein-Uhlenbeck models';
UPDATE transformation_activity SET name = 'Ornstein-Uhlenbeck models'
    WHERE name = 'OUCH';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Lopper';
UPDATE transformation_activity SET name = 'Lopper'
    WHERE name = 'lopper';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'MUSCLE';
UPDATE transformation_activity SET name = 'MUSCLE'
    WHERE name = 'Muscle v5';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Find Lines Matching a Regular Expression';
UPDATE transformation_activity SET name = 'Find Lines Matching a Regular Expression'
    WHERE name = 'Find Lines Matching A Regular Expression';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Convert GFF to GTF';
UPDATE transformation_activity SET name = 'Convert GFF to GTF'
    WHERE name = 'GFFRead: Convert GFF to GTF';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'Convert GFF to GTFMerge Two Files by Key Columns';
UPDATE transformation_activity SET name = 'Merge Two Files by Key Columns'
    WHERE name = 'Merge Two Files By Key Columns';
UPDATE transformation_activity SET deleted = TRUE
    WHERE name = 'NAMD';
UPDATE transformation_activity SET name = 'NAMD'
    WHERE name = 'NAMD ';

-- Rename the In Progress category to Beta.
UPDATE template_group SET name = 'Beta' WHERE name = 'In Progress';

COMMIT;
