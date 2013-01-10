--
-- ID sequence for the email_notifications table.
--
CREATE SEQUENCE email_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Stores records of notifications that were sent to users via email messages.
--
CREATE TABLE email_notification_messages (
    id BIGINT DEFAULT nextval('email_notifications_id_seq'::regclass) NOT NULL,
    notification_id BIGINT REFERENCES notifications(id) NOT NULL,
    template VARCHAR(256),
    address VARCHAR(1024),
    date_sent TIMESTAMP DEFAULT now(),
    payload TEXT,
    PRIMARY KEY(id)
);
