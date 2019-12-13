SET search_path = public, pg_catalog;

ALTER TABLE ONLY app_publication_request_status_codes
    ADD CONSTRAINT app_publication_request_status_codes_pkey
    PRIMARY KEY(id);

ALTER TABLE ONLY app_publication_requests
    ADD CONSTRAINT app_publication_requests_pkey
    PRIMARY KEY(id);

ALTER TABLE ONLY app_publication_request_statuses
    ADD CONSTRAINT app_publication_request_statuses_pkey
    PRIMARY KEY(id);
