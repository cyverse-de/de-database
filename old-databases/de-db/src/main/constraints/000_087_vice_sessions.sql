SET search_path = public, pg_catalog;

ALTER TABLE ONLY "session"
    ADD CONSTRAINT "session_pkey"
    PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;
