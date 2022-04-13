BEGIN;

SET search_path = public, pg_catalog;

UPDATE container_images
    SET name = 'discoenv/url-import'
    WHERE id = '15959300-b972-4571-ace2-081af0909599';

COMMIT;
