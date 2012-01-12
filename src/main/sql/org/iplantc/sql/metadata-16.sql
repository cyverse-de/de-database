\set ON_ERROR_STOP ON

BEGIN;

-- The NCBI GenBank Import tool should not have been deleted.
UPDATE transformation_activity SET deleted = FALSE WHERE "name" = 'NCBI GenBank Import';

-- Copy all analyses from the Functional Analyses group to the Functional Analysis group.
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT tg.hid, tgt.template_id
    FROM template_group tg, template_group_template tgt
    WHERE tg."name" = 'Functional Analysis'
    AND tgt.template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Functional Analyses'
    );

-- Remove old categories.
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Clustering and Network Analyses'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'Clustering and Network Analyses'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'QTL Mapping and Genome-wide Association Studies'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'QTL Mapping and Genome-wide Association Studies'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Sequence Alignments and Phylogenetic Tree Building'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'Sequence Alignments and Phylogenetic Tree Building'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Utility'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'Utility'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Phylogenetic Comparative Methods and Trait Evolution'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'Phylogenetic Comparative Methods and Trait Evolution'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Functional Analyses'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'Functional Analyses'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Variant Analysis'
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = 'Variant Analysis'
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = ''
    );
DELETE FROM template_group_group
    WHERE subgroup_id = (
        SELECT hid FROM template_group WHERE "name" = ''
    );
UPDATE template_group_group SET hid = hid - 1
    WHERE parent_group_id = (
        SELECT parent_group_id FROM template_group_group tgg2
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg3
            WHERE tgg3.parent_group_id = tgg2.parent_group_id
            AND tgg3.hid = tgg2.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg4
            WHERE tgg4.parent_group_id = tgg2.parent_group_id
            AND tgg4.hid = tgg2.hid + 1
        )
    )
    AND hid > (
        SELECT hid FROM template_group_group tgg5
        WHERE EXISTS (
            SELECT * FROM template_group_group tgg6
            WHERE tgg6.parent_group_id = tgg5.parent_group_id
            AND tgg6.hid = tgg5.hid + 2
        )
        AND NOT EXISTS (
            SELECT * FROM template_group_group tgg7
            WHERE tgg7.parent_group_id = tgg5.parent_group_id
            AND tgg7.hid = tgg5.hid + 1
        )
    );

-- Remove the TopHat analyses from the Beta category.
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group WHERE "name" = 'Beta'
    )
    AND template_id IN (
        SELECT hid FROM transformation_activity WHERE "name" LIKE 'TopHat Aligner%'
    );

-- Add the remaining TopHat analyses to the Aligners category.
INSERT INTO template_group_template (template_group_id, template_id)
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g."name" = 'Aligners'
    AND t."name" LIKE 'TopHat Aligner%'
    AND t.deleted IS FALSE;

-- Remove Lopper and TreeView from the existing Utility Tools and Scripts category.
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group
        WHERE "name" = 'Utility Tools and Scripts'
    )
    AND template_id IN (
        SELECT hid FROM transformation_activity
        WHERE "name" = 'Lopper'
        OR "name" = 'TreeView'
    );

-- Create a new Utility Tools and Scripts category under Phylogenetics.
INSERT INTO template_group (id, "name", description, workspace_id)
    VALUES ('B05B3248-02B5-47D1-8445-A8D6D78F00BF', 'Utility Tools and Scripts', 'phylogenetics', 0);
INSERT INTO template_group_group
    SELECT parent.hid, child.hid, (
        SELECT COALESCE(MAX(hid) + 1, 0)
        FROM template_group_group tgg
        WHERE tgg.parent_group_id = (
            SELECT hid FROM template_group
            WHERE "name" = 'Phylogenetics'
        )
    )
    FROM template_group parent, template_group child
    WHERE parent."name" = 'Phylogenetics'
    AND child."name" = 'Utility Tools and Scripts'
    AND child.description = 'phylogenetics';

-- Add Lopper and TreeView to the new Utility Tools and Scripts category under Phylogenetics.
INSERT INTO template_group_template
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g."name" = 'Utility Tools and Scripts'
    AND g.description = 'phylogenetics'
    AND (t."name" = 'Lopper' OR t."name" = 'TreeView');

-- Move the new grep utility from Beta to Utility Tools and Scripts.
DELETE FROM template_group_template
    WHERE "template_id" = (
        SELECT hid FROM transformation_activity
        WHERE "name" = 'Find Lines Matching a Regular Expression'
    );
INSERT INTO template_group_template
    SELECT g.hid, t.hid
    FROM template_group g, transformation_activity t
    WHERE g."name" = 'Utility Tools and Scripts'
    AND g.description <> 'phylogenetics'
    AND t."name" = 'Find Lines Matching a Regular Expression';

-- Remove NCBI GenBank Import from the Utility Tools and Scripts category.
DELETE FROM template_group_template
    WHERE template_group_id = (
        SELECT hid FROM template_group
        WHERE "name" = 'Utility Tools and Scripts'
        AND description <> 'phylogenetics'
    )
    AND template_id = (
        SELECT hid FROM transformation_activity
        WHERE "name" = 'NCBI GenBank Import'
    );

-- Delete all analyses that are currently in Beta.
UPDATE transformation_activity t
    SET deleted = TRUE
    WHERE deleted IS FALSE
    AND EXISTS (
        SELECT * FROM template_group tg
        JOIN template_group_template tgt ON tg.hid = tgt.template_group_id
        WHERE tg."name" = 'Beta'
        AND tgt.template_id = t.hid
    );

-- Rename some analyses.
UPDATE transformation_activity SET "name" = 'Eqtl' WHERE "name" = 'QTLC_Eqtl';
UPDATE transformation_activity SET "name" = 'Mimapqtl' WHERE "name" = 'QTLC_MImapqtl';
UPDATE transformation_activity SET "name" = 'Rcross' WHERE "name" = 'QTLC_Rcross';
UPDATE transformation_activity SET "name" = 'Rmap' WHERE "name" = 'QTLC_Rmap';
UPDATE transformation_activity SET "name" = 'Rqtl' WHERE "name" = 'QTLC_Rqtl';
UPDATE transformation_activity SET "name" = 'Prune' WHERE "name" = 'QTLC_Prune';
UPDATE transformation_activity SET "name" = 'JZmapqtl' WHERE "name" = 'QTLC_JZmapqtl';
UPDATE transformation_activity SET "name" = 'LRmapqtl' WHERE "name" = 'QTLC_LRmapqtl';
UPDATE transformation_activity SET "name" = 'SRmapqtl' WHERE "name" = 'QTLC_SRmapqtl';
UPDATE transformation_activity SET "name" = 'Zmapqtl' WHERE "name" = 'QTLC_Zmapqtl';

-- Mark some additional analyses as deleted
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'QTLC_Prune2';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'QTLC_Rmap2';
UPDATE transformation_activity SET deleted = TRUE WHERE name = 'qtlConvert';

-- Mark all analyses that are not associated with an analysis group as deleted.
UPDATE transformation_activity t SET deleted = TRUE
    WHERE NOT EXISTS (
        SELECT * FROM template_group_template tgt
        WHERE t.hid = tgt.template_id
    );

-- Delete perl and bash for security reasons
DELETE FROM deployed_components WHERE id='c25d1206fbd2543fd90f8ce76d363087b';
DELETE FROM deployed_components WHERE id='c4b3ebdd32137419b820ba3ddbd7d141e';

-- Modify NCBI GenBank Import so that it no longer calls perl directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT 'C815F3C5-DA36-49D9-BB34-D62365A6F7EB', 'GetSeq.pl', '/usr/local2/bin', 'executable',
           'Retrieves sequences from GenBank given a list of ids or accessions.', '0.1.1', 'Naim Matasci',
           id
    FROM integration_data WHERE integrator_email = 'nmatasci@iplantcollaborative.org';
UPDATE template SET component_id = 'C815F3C5-DA36-49D9-BB34-D62365A6F7EB'
    WHERE id = '3D8B6BB1-BC60-4853-C335-4816FCCCD1F7';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/GetSeq.pl'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/GetSeq.pl';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- Modify Muscle v5 so that it no longer calls perl directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT 'C1D46AFE-02EC-4AB7-B6BE-D190A08B026E', 'run_muscle.pl', '/usr/local2/bin', 'executable',
           '', '', 'Naim Matasci', id
    FROM integration_data WHERE integrator_email = 'nmatasci@iplantcollaborative.org';
UPDATE template SET component_id = 'C1D46AFE-02EC-4AB7-B6BE-D190A08B026E'
    WHERE id = 'F50FE07D-91AA-AA36-1D47-BB2E7FDC7BB4';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/run_muscle.pl'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/run_muscle.pl';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- Modify TreeView so that it no longer calls perl directly. (CORE-2133)
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT 'DCBD3EF3-70C8-427C-92BC-90CF83D1D4F7', 'treeview.pl', '/usr/local2/bin', 'executable',
           'A phylogenetic tree importer for iPlant tree viewer', '', 'Naim Matasci', id
    FROM integration_data WHERE integrator_email = 'nmatasci@iplantcollaborative.org';
UPDATE template SET component_id = 'DCBD3EF3-70C8-427C-92BC-90CF83D1D4F7'
    WHERE id = 't916a6973a97f45c990ab4706fd8efa9f';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/treeview.pl'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/treeview.pl';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- CORE-2133 - re-target the deployed components for analyses previously targetting BASH
INSERT INTO deployed_components(id, name, location, type, description, version, attribution, integration_data_id) 
       VALUES ('B6F167B2-9460-4A79-AAB9-AC383714F575', 'fastx_barcode_splitter.sh', '/usr/local2/bin', 'executable', 
               'FASTX Barcode Splitter', '', 'Hannon Lab', 3);
INSERT INTO deployed_components(id, name, location, type, description, version, attribution, integration_data_id) 
       VALUES ('310717DC-7C2A-4D1C-A2D2-4CBF017C5D06', 'run_scaler.sh', '/usr/local2/bin', 'executable', 
               'FASTQ Quality Rescaler', '', 'Hannon Lab', 3);
INSERT INTO deployed_components(id, name, location, type, description, version, attribution, integration_data_id) 
       VALUES ('9BFD8F52-9D29-4A26-B2EF-3C9B5D45F066', 'run_raxml_prot.sh', '/usr/local2/bin', 'executable', 
               'RAxML - Proteins', '', '', 2);
INSERT INTO deployed_components(id, name, location, type, description, version, attribution, integration_data_id) 
       VALUES ('3A848CAF-C362-487C-8B34-51B518173FDA', 'ninja', '/usr/local2/bin', 'executable', 
               'NINJA', '', 'Travis Wheeler', 2);

-- Replace BASH target with shell script for ``FASTX Barcode Splitter (Single End)``
UPDATE template SET component_id = 'B6F167B2-9460-4A79-AAB9-AC383714F575' where id = 't152be766a851453491e220ff7bea12de';
-- Filter out the property that defines the script 
UPDATE property SET ordering = -86 WHERE hid = 131;

-- Replace BASH target with shell script for ``FASTQ Quality Rescaler``
UPDATE template SET component_id = '310717DC-7C2A-4D1C-A2D2-4CBF017C5D06' where id = 'td44b92b00cec4881ac49b4edad05c158';
-- Filter out the property that defines the script 
UPDATE property SET ordering = -86 WHERE hid = 136;

-- Replace BASH target with shell script for ``RAxML - Proteins``
UPDATE template SET component_id = '9BFD8F52-9D29-4A26-B2EF-3C9B5D45F066' where id = 'D7F9F44E-1DBE-E6D2-D14B-606C4ADD809F';
-- Filter out the property that defines the script 
UPDATE property SET ordering = -86 WHERE hid = 1215;

-- Replace BASH target with ``Ninja`` for deployed_component.
UPDATE template SET component_id = '3A848CAF-C362-487C-8B34-51B518173FDA' where id = '2A6B165E-416C-2EDD-1DF4-036EB7D0684F';
-- Filter out the property that defines the script 
UPDATE property SET ordering = -86 WHERE hid = 1203;

-- CORE-2469 - re-order the properties and reclassify the ``--bol`` property to be a flag & not omitted.
UPDATE property SET ordering = 5 WHERE hid = 133;
UPDATE property SET ordering = 4 WHERE hid = 130;

UPDATE property SET 
       omit_if_blank = false, 
       ordering = 3,
       property_type = 5,
       defalut_value = 'true'
WHERE hid = 132;

-- Modify Merge Input Files so that it no longer calls bash directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT '1473A573-946B-4355-9C12-5E55F6A80EFF', 'convert_to_bam.sh', '/usr/local2/bin', 'executable',
           'Converts SAM files to BAM format', '', 'Matt Vaughn', id
    FROM integration_data WHERE integrator_email = 'vaughn@iplantcollaborative.org';
UPDATE template SET component_id = '1473A573-946B-4355-9C12-5E55F6A80EFF'
    WHERE id = 't259a86b292964cb4bae61400993f2af0';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/convert_to_bam.sh'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/convert_to_bam.sh';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- Modify Filtering so that it no longer calls bash directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT '79E8B52C-46F2-43E1-917F-A830B1285D20', 'samtools_filtering.sh', '/usr/local2/bin', 'executable',
           '', '', 'Matt Vaughn', id
    FROM integration_data WHERE integrator_email = 'vaughn@iplantcollaborative.org';
UPDATE template SET component_id = '79E8B52C-46F2-43E1-917F-A830B1285D20'
    WHERE id = 't6cf67a33e016493194be0978e01f47d9';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/samtools_filtering.sh'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/samtools_filtering.sh';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- Modify VCF Converter so that it no longer calls bash directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT '381114AB-14C1-4C8B-A910-A3DE96760891', 'convert_to_vcf.sh', '/usr/local2/bin', 'executable',
           'Converts a SAM file to a VCF file.', '', 'Matt Vaughn', id
    FROM integration_data WHERE integrator_email = 'vaughn@iplantcollaborative.org';
UPDATE template SET component_id = '381114AB-14C1-4C8B-A910-A3DE96760891'
    WHERE id = 't5063fc675dc94877bc000eb5633e18aa';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/convert_to_vcf.sh'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/convert_to_vcf.sh';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- Modify Base Calling so that it no longer calls bash directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT 'A8817C1B-6A68-4D0C-9773-92A6B7EBDCC4', 'samtools_base_calling.sh', '/usr/local2/bin', 'executable',
           '', '', 'Matt Vaughn', id
    FROM integration_data WHERE integrator_email = 'vaughn@iplantcollaborative.org';
UPDATE template SET component_id = 'A8817C1B-6A68-4D0C-9773-92A6B7EBDCC4'
    WHERE id = 't2d6ebb74f29a498cbc0ad3d01b80e3a1';
DELETE FROM property_group_property
    WHERE property_id = (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/samtools_base_calling.sh'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/samtools_base_calling.sh';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- Modify Merge Input Files and Merge Multiple SAM Files so that it no longer calls bash directly.
INSERT INTO deployed_components (id, "name", location, "type", description, version, attribution, integration_data_id)
    SELECT 'D11CA693-ACA0-4533-81F3-AC7193CD21DF', 'merge_sam_files.sh', '/usr/local2/bin', 'executable',
           'Merges multiple SAM files into a single SAM file.', '', 'Matt Vaughn', id
    FROM integration_data WHERE integrator_email = 'vaughn@iplantcollaborative.org';
UPDATE template SET component_id = 'D11CA693-ACA0-4533-81F3-AC7193CD21DF'
    WHERE id = 't35698bf3f770431dac9ec86069ccb2ce';
UPDATE template SET component_id = 'D11CA693-ACA0-4533-81F3-AC7193CD21DF'
    WHERE id = 't0117d106b39d4081909f2cbfefbc4d29';
DELETE FROM property_group_property
    WHERE property_id IN (
        SELECT hid FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/merge_sam_files.sh'
    );
DELETE FROM property WHERE TRIM(BOTH ' ' FROM defalut_value) = '/usr/local2/bin/merge_sam_files.sh';
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- CORE-2223 - correct abbreviation misspell 
UPDATE property SET label = 'Minimum RMS mapping quality for SNPs' where hid = 61 and id = 'minRMSsnp';

-- Fix a couple of arguments in the Base Calling step of Find SNPs.
DELETE FROM property_group_property
    WHERE property_id IN (
        SELECT hid FROM property WHERE hid = 69
    );
DELETE FROM property WHERE hid = 69;
UPDATE property SET "name" = '-I 0,-I 10,-I 20,-I 30,-I 40,-I 50,-I 60' WHERE hid = 70;
UPDATE property_group_property pgp1
    SET hid = hid - 1
    WHERE hid > 0
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp2
        WHERE pgp2.property_group_id = pgp1.property_group_id
        AND pgp2.hid = 0
    );
UPDATE property_group_property pgp1
    SET hid = pgp1.hid - 1
    FROM property_group_property pgp2
    WHERE pgp1.property_group_id = pgp2.property_group_id
    AND pgp1.hid > pgp2.hid
    AND EXISTS (
        SELECT * FROM property_group_property pgp3
        WHERE pgp3.property_group_id = pgp2.property_group_id
        AND pgp3.hid = pgp2.hid + 2
    )
    AND NOT EXISTS (
        SELECT * FROM property_group_property pgp4
        WHERE pgp4.property_group_id = pgp2.property_group_id
        AND pgp4.hid = pgp2.hid + 1
    );

-- CORE-2544 - remove ``Find Lines Matching An Expression`` analysis
UPDATE transformation_activity SET
  deleted = true
WHERE hid = 63 AND "name" = 'Find Lines Matching An Expression';

COMMIT;
