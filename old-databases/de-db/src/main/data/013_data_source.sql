-- Populates the data_source table.

INSERT INTO data_source (id, name, label, description, display_order) VALUES
    ('8D6B8247-F1E7-49DB-9FFE-13EAD7C1AED6', 'file', 'File',
     'A regular file.', 1),
    ('1EEECF26-367A-4038-8D19-93EA80741DF2', 'stdout', 'Standard Output',
     'Redirected standard output from a job.', 2),
    ('BC4CF23F-18B9-4466-AF54-9D40F0E2F6B5', 'stderr', 'Standard Error Output',
     'Redirected error output from a job.', 3);
