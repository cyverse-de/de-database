BEGIN;

SET search_path = public, pg_catalog;

--
-- Migrations 000021, 000048, and 000050 originally wrote their regexes with
-- backslash escapes ('\s+', '\S'). On servers running with
-- standard_conforming_strings = off, those literals were escape-processed
-- before parsing, so the stored definitions lost the backslash: the operators
-- checks became "must contain a capital S" (name ~ 'S') and the permissions
-- name index collapsed runs of the letter "s" instead of whitespace. The
-- source migrations now use bracket expressions, which contain no backslash
-- and parse identically under either setting; this migration rebuilds the
-- affected definitions on databases that already ran the mangled versions.
-- On databases whose definitions are already correct, the rebuild is a no-op
-- re-creation of identical constraints and index.
--
ALTER TABLE IF EXISTS ONLY operators
    DROP CONSTRAINT IF EXISTS operators_name_check,
    DROP CONSTRAINT IF EXISTS operators_url_check,
    DROP CONSTRAINT IF EXISTS operators_base_url_check,
    ADD CONSTRAINT operators_name_check CHECK (name ~ '[^[:space:]]'),
    ADD CONSTRAINT operators_url_check CHECK (url ~ '[^[:space:]]'),
    ADD CONSTRAINT operators_base_url_check CHECK (base_url ~ '[^[:space:]]');

--
-- Rebuilding the unique index re-validates existing rows: resource type
-- names that differ only in whitespace runs would now collide and abort the
-- migration, which is the intended uniqueness rule finally being enforced.
--
DROP INDEX IF EXISTS permissions.resource_types_name_unique;
CREATE UNIQUE INDEX resource_types_name_unique
    ON permissions.resource_types
    (lower(trim(regexp_replace(name, '[[:space:]]+', ' ', 'g'))));

COMMIT;
