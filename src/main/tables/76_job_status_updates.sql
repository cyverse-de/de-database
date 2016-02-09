SET search_path = public, pg_catalog;

--
-- Records job status updates
--
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

    -- The date that the record was created by whichever service adds the record.
    -- This is not the date that the update was sent.
    created_date timestamp NOT NULL DEFAULT now()
)
