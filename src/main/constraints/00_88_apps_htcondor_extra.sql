SET search_path = public, pg_catalog;

ALTER TABLE ONLY apps_htcondor_extra
    ADD CONSTRAINT apps_htcondor_extra_apps_id_pkey
    PRIMARY KEY(apps_id);
