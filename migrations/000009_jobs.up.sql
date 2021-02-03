SET search_path = public, pg_catalog;

-- job_steps
CREATE TABLE job_steps (
    job_id uuid NOT NULL,
    step_number integer NOT NULL,
    external_id character varying(64),
    start_date timestamp,
    end_date timestamp,
    status character varying(64) NOT NULL,
    job_type_id uuid NOT NULL,
    app_step_number integer NOT NULL,

    PRIMARY KEY (job_id, step_number)
);

ALTER TABLE ONLY job_steps
    ADD CONSTRAINT job_steps_job_id_fkey
    FOREIGN KEY (job_id)
    REFERENCES jobs(id);
ALTER TABLE ONLY job_steps
    ADD CONSTRAINT job_steps_job_type_id_fkey
    FOREIGN KEY (job_type_id)
    REFERENCES job_types(id);

-- job_tickets
CREATE TABLE job_tickets(
   job_id uuid NOT NULL,
   ticket varchar(100) NOT NULL,
   irods_path text NOT NULL,
   deleted boolean DEFAULT FALSE,
   primary key (job_id, ticket)
);

ALTER TABLE ONLY job_tickets
    ADD CONSTRAINT job_tickets_job_id_fkey
    FOREIGN KEY (job_id)
    REFERENCES jobs(id)
    ON DELETE CASCADE;

--
-- An index on the job_id field of the job_tickets table.
--
CREATE INDEX IF NOT EXISTS job_tickets_job_id_index
    ON job_tickets (job_id);

-- job_status_updates
CREATE TABLE job_status_updates (
    id uuid NOT NULL DEFAULT uuid_generate_v4(),

    -- corresponds to the external_id field in the job_steps table
    external_id character varying(64) NOT NULL,

    -- the update message. needs to be freeform since we can't guarantee
    -- the length
    message text NOT NULL,

    -- The actual status field associated with this update. again, we can't
    -- guarantee the format from external job sites, so this ends up being
    -- a text field
    status text NOT NULL,

    -- The ip address that the update was sent from. This should be set to the
    -- condor node ip address or to the agave callback source ip.
    sent_from inet NOT NULL,

    -- The hostname provided in the update message.
    sent_from_hostname text NOT NULL,

    -- Send date is the date that the update was actually sent, not the date
    -- that the record was created. Should be in milliseconds since the epoch.
    sent_on bigint NOT NULL,

    -- propagated tells whether or not the status update has been pushed
    -- upstream, from the apps service's perspective.
    propagated boolean NOT NULL DEFAULT 'false',

    -- propagation_attempts contains the number of attempts that were made to
    -- propagate the job status update upstream. Ideally, should always be 1.
    -- Defaults to 0.
    propagation_attempts bigint NOT NULL DEFAULT 0,

    -- last_propagation_attempt contains the number of milliseconds since the
    -- epoch at which time the last propagation attempt was made.
    last_propagation_attempt bigint,

    -- The date that the record was created by whichever service adds the record.
    -- This is not the date that the update was sent.
    created_date timestamp NOT NULL DEFAULT now(),

    PRIMARY KEY (id)
);

---
--- Create some indices on the columns often referenced by queries in job-status-to-apps-adapter
---
CREATE INDEX job_status_updates_propagated
ON job_status_updates (propagated, propagation_attempts);

CREATE INDEX job_status_updates_external_id
ON job_status_updates (external_id);

CREATE INDEX job_status_updates_unpropagated_with_external_id
ON job_status_updates (propagated, propagation_attempts, external_id)
WHERE propagated = false;

-- job_limits
CREATE TABLE job_limits (
    id uuid NOT NULL DEFAULT uuid_generate_v1(),
    launcher text default NULL,
    concurrent_jobs int NOT NULL,

    PRIMARY KEY (id),
    UNIQUE (launcher)
);
