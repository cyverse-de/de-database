BEGIN;

SET search_path = public, pg_catalog;

--
-- A function that obtains the internal app category identifiers for the
-- app category hierarchy rooted at the category with the given identifier.
--
CREATE OR REPLACE FUNCTION app_category_hierarchy_ids(uuid) RETURNS TABLE(id uuid) AS $$
    WITH RECURSIVE subcategories(parent_id) AS
    (
            SELECT acg.parent_category_id AS parent_id, ac.id
            FROM app_category_group acg
            RIGHT JOIN app_categories ac ON acg.child_category_id = ac.id
            WHERE ac.id = $1
        UNION ALL
            SELECT acg.parent_category_id AS parent_id, ac.id
            FROM subcategories sc, app_category_group acg
            JOIN app_categories ac ON acg.child_category_id = ac.id
            WHERE acg.parent_category_id = sc.id
    )
    SELECT id FROM subcategories
$$ LANGUAGE SQL;

--
-- A function that counts the number of apps in an app group hierarchy rooted
-- at the node with the given identifier.
--
CREATE OR REPLACE FUNCTION app_count(uuid) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE NOT a.deleted
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
$$ LANGUAGE SQL;

--
-- Another version of the same function that allows us to exclude apps
-- containing external steps.
--
CREATE OR REPLACE FUNCTION app_count(uuid, boolean) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE NOT a.deleted
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
    AND CASE
        WHEN $2 THEN TRUE
        ELSE NOT EXISTS (
            SELECT * FROM app_steps s
            JOIN tasks t ON t.id = s.task_id
            WHERE s.app_id = a.id
            AND t.external_app_id IS NOT NULL
        )
    END
$$ LANGUAGE SQL;

--
-- Yet another version of the same function that allows us to limit the
-- count to certain app IDs.
--
CREATE OR REPLACE FUNCTION app_count(uuid, boolean, anyarray) RETURNS bigint AS $$
    SELECT COUNT(DISTINCT a.id) FROM apps a
    JOIN app_category_app aca ON a.id = aca.app_id
    WHERE NOT a.deleted
    AND aca.app_category_id IN (SELECT * FROM app_category_hierarchy_ids($1))
    AND a.id = ANY ($3::uuid[])
    AND CASE
        WHEN $2 THEN TRUE
        ELSE NOT EXISTS (
            SELECT * FROM app_steps s
            JOIN tasks t ON t.id = s.task_id
            WHERE s.app_id = a.id
            AND t.external_app_id IS NOT NULL
        )
    END
$$ LANGUAGE SQL;

--
-- A function that returns all of the app categories underneath the one
-- with the given identifier.
--
CREATE OR REPLACE FUNCTION app_category_hierarchy(uuid)
RETURNS
TABLE(
    parent_id uuid,
    id uuid,
    name varchar(255),
    description varchar(255),
    workspace_id uuid,
    is_public boolean,
    app_count bigint
) AS $$
    WITH RECURSIVE subcategories AS
    (
            SELECT acg.parent_category_id AS parent_id, ac.id, ac.name,
                   ac.description, ac.workspace_id, ac.is_public,
                   app_count(ac.id) AS app_count
            FROM app_category_group acg
            RIGHT JOIN app_category_listing ac ON acg.child_category_id = ac.id
            WHERE ac.id = $1
        UNION ALL
            SELECT acg.parent_category_id AS parent_id, ac.id, ac.name,
                   ac.description, ac.workspace_id, ac.is_public,
                   app_count(ac.id) AS app_count
            FROM subcategories sc, app_category_group acg
            JOIN app_category_listing ac ON acg.child_category_id = ac.id
            WHERE acg.parent_category_id = sc.id
    )
    SELECT * FROM subcategories
$$ LANGUAGE SQL;

--
-- Another version of the same function that allows us to indicate whether or
-- not apps containing external steps should be included in the count.
--
CREATE OR REPLACE FUNCTION app_category_hierarchy(uuid, boolean)
RETURNS
TABLE(
    parent_id uuid,
    id uuid,
    name varchar(255),
    description varchar(255),
    workspace_id uuid,
    is_public boolean,
    app_count bigint
) AS $$
    WITH RECURSIVE subcategories AS
    (
            SELECT acg.parent_category_id AS parent_id, ac.id, ac.name,
                   ac.description, ac.workspace_id, ac.is_public,
                   app_count(ac.id, $2) AS app_count
            FROM app_category_group acg
            RIGHT JOIN app_category_listing ac ON acg.child_category_id = ac.id
            WHERE ac.id = $1
        UNION ALL
            SELECT acg.parent_category_id AS parent_id, ac.id, ac.name,
                   ac.description, ac.workspace_id, ac.is_public,
                   app_count(ac.id, $2) AS app_count
            FROM subcategories sc, app_category_group acg
            JOIN app_category_listing ac ON acg.child_category_id = ac.id
            WHERE acg.parent_category_id = sc.id
    )
    SELECT * FROM subcategories
$$ LANGUAGE SQL;

--
-- Yet another version of the same function that allows us to specify the set
-- of app IDs that the user can access.
--
CREATE OR REPLACE FUNCTION app_category_hierarchy(uuid, boolean, anyarray)
RETURNS
TABLE(
    parent_id uuid,
    id uuid,
    name varchar(255),
    description varchar(255),
    workspace_id uuid,
    is_public boolean,
    app_count bigint
) AS $$
    WITH RECURSIVE subcategories AS
    (
            SELECT acg.parent_category_id AS parent_id, ac.id, ac.name,
                   ac.description, ac.workspace_id, ac.is_public,
                   app_count(ac.id, $2, $3) AS app_count
            FROM app_category_group acg
            RIGHT JOIN app_category_listing ac ON acg.child_category_id = ac.id
            WHERE ac.id = $1
        UNION ALL
            SELECT acg.parent_category_id AS parent_id, ac.id, ac.name,
                   ac.description, ac.workspace_id, ac.is_public,
                   app_count(ac.id, $2, $3) AS app_count
            FROM subcategories sc, app_category_group acg
            JOIN app_category_listing ac ON acg.child_category_id = ac.id
            WHERE acg.parent_category_id = sc.id
    )
    SELECT * FROM subcategories
$$ LANGUAGE SQL;

-- These functions were copied from http://wiki.postgresql.org/wiki/First/last_(aggregate).

-- Create a function that always returns the first non-NULL item
CREATE OR REPLACE FUNCTION public.first_agg ( anyelement, anyelement )
RETURNS anyelement LANGUAGE sql IMMUTABLE STRICT AS $$
        SELECT $1
$$;

-- And then wrap an aggregate around it
CREATE OR REPLACE AGGREGATE public.first (
        sfunc    = public.first_agg,
        basetype = anyelement,
        stype    = anyelement
);

-- Create a function that always returns the last non-NULL item
CREATE OR REPLACE FUNCTION public.last_agg ( anyelement, anyelement )
RETURNS anyelement LANGUAGE sql IMMUTABLE STRICT AS $$
        SELECT $2
$$;

-- And then wrap an aggregate around it
CREATE OR REPLACE AGGREGATE public.last (
        sfunc    = public.last_agg,
        basetype = anyelement,
        stype    = anyelement
);

COMMIT;
