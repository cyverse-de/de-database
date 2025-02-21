BEGIN;

SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS global_alerts (
    start_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    end_date timestamp without time zone not null,
    alert text not null,

    UNIQUE (end_date, alert)
);

COMMIT;
