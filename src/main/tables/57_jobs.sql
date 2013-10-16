SET search_path = public, pg_catalog;

--
-- ID sequence for the jobs table.
--
CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Records jobs that the user has submitted.
--
CREATE TABLE jobs (
    id bigint DEFAULT nextval('jobs_id_seq'::regclass) NOT NULL,
    external_id character varying(40) NOT NULL,
    job_name character varying(255) NOT NULL,
    app_name character varying(255),
    start_date timestamp,
    end_date timestamp,
    status character varying(64) NOT NULL,
    deleted boolean DEFAULT FALSE NOT NULL,
    job_type_id bigint REFERENCES job_types(id) NOT NULL,
    user_id bigint NOT NULL,
    PRIMARY KEY (id)
);
