-- Populates the tool_types table.

INSERT INTO tool_types (id, name, label, description, notification_type)
    VALUES ( 'DE1DBE6A-A2BB-4219-986B-D878C6A9E3E4', 'executable', 'UA', 'Run at the University of Arizona', 'analysis' );

INSERT INTO tool_types (id, name, label, description, notification_type)
    VALUES ( 'FA713BB8-2838-4B63-AB3A-265DBB1D719C', 'fAPI', 'TACC', 'Run at the Texas Advanced Computing Center', 'analysis' );

INSERT INTO tool_types (id, name, label, description, hidden, notification_type)
    VALUES ( '01E14110-1420-4DE0-8A70-B0DD420F6A84', 'internal', 'Internal DE tools.', 'Tools used internally by the Discovery Environment.', true, 'data' );

INSERT INTO tool_types (id, name, label, description, notification_type)
    VALUES ( '4166B913-EAFA-4731-881F-21C3751DFFBB', 'interactive', 'Interactive DE tools.', 'Interactive tools used by the Discovery Environment.', 'analysis' );

INSERT INTO tool_types (id, name, label, description, notification_type)
    VALUES ( '7EC7063B-A96D-4AE5-9815-4548BA7D9C74', 'osg', 'OSG DE tools.', 'DE tools capable of running on the Open Science Grid.', 'analysis' );
