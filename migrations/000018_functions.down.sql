BEGIN;

SET search_path = public, pg_catalog;

DROP AGGREGATE IF EXISTS public.last;
DROP AGGREGATE IF EXISTS public.first;

DROP FUNCTION IF EXISTS public.last_agg ( anyelement, anyelement );
DROP FUNCTION IF EXISTS public.first_agg ( anyelement, anyelement );

DROP FUNCTION IF EXISTS app_category_hierarchy(uuid, boolean, anyarray);
DROP FUNCTION IF EXISTS app_category_hierarchy(uuid, boolean);
DROP FUNCTION IF EXISTS app_category_hierarchy(uuid);

DROP FUNCTION IF EXISTS app_count(uuid, boolean, anyarray);
DROP FUNCTION IF EXISTS app_count(uuid, boolean);
DROP FUNCTION IF EXISTS app_count(uuid);

DROP FUNCTION IF EXISTS app_category_hierarchy_ids(uuid);

COMMIT;
