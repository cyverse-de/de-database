--
-- Our initial resource types are apps and analyses.
--
INSERT INTO resource_types (name, description) VALUES
    ('app', 'A Discovery Environment application.'),
    ('analysis', 'The results of running a Discovery Environment application.'),
    ('tool', 'A Discovery Environment tool run by an application.');
