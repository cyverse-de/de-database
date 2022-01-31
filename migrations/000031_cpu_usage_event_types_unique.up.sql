BEGIN;

SET search_path = public, pg_catalog;

-- Update the events to reference the original event type with the corresponding name.
-- Fixes issues where an event references an event type that was added to the 
-- database multiple times.
UPDATE ONLY cpu_usage_events 
    SET event_type_id = (
        SELECT id FROM cpu_usage_event_types 
        WHERE name = 'cpu.hours.add' 
        ORDER BY last_modified ASC 
        LIMIT 1
    ) 
    WHERE event_type_id in (
        SELECT id FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.add'
        AND last_modified != (
            SELECT last_modified FROM cpu_usage_event_types
            WHERE name = 'cpu.hours.add'
            ORDER BY last_modified ASC
            LIMIT 1
        )
    );

UPDATE ONLY cpu_usage_events 
    SET event_type_id = (
        SELECT id FROM cpu_usage_event_types 
        WHERE name = 'cpu.hours.subtract' 
        ORDER BY last_modified ASC 
        LIMIT 1
    ) 
    WHERE event_type_id in (
        SELECT id FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.subtract'
        AND last_modified != (
            SELECT last_modified FROM cpu_usage_event_types
            WHERE name = 'cpu.hours.subtract'
            ORDER BY last_modified ASC
            LIMIT 1
        )
    );

UPDATE ONLY cpu_usage_events 
    SET event_type_id = (
        SELECT id FROM cpu_usage_event_types 
        WHERE name = 'cpu.hours.reset' 
        ORDER BY last_modified ASC 
        LIMIT 1
    ) 
    WHERE event_type_id in (
        SELECT id FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.reset'
        AND last_modified != (
            SELECT last_modified FROM cpu_usage_event_types
            WHERE name = 'cpu.hours.reset'
            ORDER BY last_modified ASC
            LIMIT 1
        )
    );

UPDATE ONLY cpu_usage_events 
    SET event_type_id = (
        SELECT id FROM cpu_usage_event_types 
        WHERE name = 'cpu.hours.calculate' 
        ORDER BY last_modified ASC 
        LIMIT 1
    ) 
    WHERE event_type_id in (
        SELECT id FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.calculate'
        AND last_modified != (
            SELECT last_modified FROM cpu_usage_event_types
            WHERE name = 'cpu.hours.calculate'
            ORDER BY last_modified ASC
            LIMIT 1
        )
    );

-- Remove extra 'cpu.hours.add' event types
DELETE FROM cpu_usage_event_types 
    WHERE name = 'cpu.hours.add'
    AND last_modified != (
        SELECT last_modified FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.add'
        ORDER BY last_modified ASC
        LIMIT 1
    );

-- Remove extra 'cpu.hours.subtract' event types
DELETE FROM cpu_usage_event_types 
    WHERE name = 'cpu.hours.subtract'
    AND last_modified != (
        SELECT last_modified FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.subtract'
        ORDER BY last_modified ASC
        LIMIT 1
    );

-- Remove extra 'cpu.hours.reset' event types
DELETE FROM cpu_usage_event_types 
    WHERE name = 'cpu.hours.reset'
    AND last_modified != (
        SELECT last_modified FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.reset'
        ORDER BY last_modified ASC
        LIMIT 1
    );

-- Remove extra 'cpu.hours.calculate event types
DELETE FROM cpu_usage_event_types 
    WHERE name = 'cpu.hours.calculate'
    AND last_modified != (
        SELECT last_modified FROM cpu_usage_event_types
        WHERE name = 'cpu.hours.calculate'
        ORDER BY last_modified ASC
        LIMIT 1
    );

-- Make sure that the name field is unique from now on.
ALTER TABLE IF EXISTS cpu_usage_event_types ADD UNIQUE (name);