SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS integration_data (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    integrator_name character varying(255) NOT NULL CHECK (integrator_name ~ '\S'),
    integrator_email character varying(255) NOT NULL CHECK (integrator_email ~ '\S'),
    user_id uuid,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY integration_data
    ADD CONSTRAINT integration_data_name_email_unique
    UNIQUE (integrator_name, integrator_email);

ALTER TABLE ONLY integration_data
    ADD CONSTRAINT integration_data_user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users (id);

CREATE TABLE IF NOT EXISTS apps (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    name character varying(255),
    description text,
    deleted boolean DEFAULT false NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    integration_data_id uuid NOT NULL,
    wiki_url character varying(1024),
    integration_date timestamp without time zone,
    edited_date timestamp without time zone,
    PRIMARY KEY (id)
);

ALTER TABLE ONLY apps
    ADD CONSTRAINT app_integration_data_id_fk
    FOREIGN KEY (integration_data_id)
    REFERENCES integration_data(id);
