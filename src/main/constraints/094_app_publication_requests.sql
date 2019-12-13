SET search_path = public, pg_catalog;

ALTER TABLE app_publication_requests
    ADD CONSTRAINT app_publication_requests_requestor_id_fkey
    FOREIGN KEY (requestor_id)
    REFERENCES users(id);

ALTER TABLE app_publication_request_statuses
    ADD CONSTRAINT app_publication_request_statuses_app_publication_request_id_fkey
    FOREIGN KEY (app_publication_request_id)
    REFERENCES app_publication_requests(id);

ALTER TABLE app_publication_request_statuses
    ADD CONSTRAINT app_publication_request_statuses_app_publication_request_status_code_id_fkey
    FOREIGN KEY (app_publication_request_status_code_id)
    REFERENCES app_publication_request_status_codes(id);
