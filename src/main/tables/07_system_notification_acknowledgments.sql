--
-- ID sequence for the system_notification_acknowledgments table.
--
CREATE SEQUENCE system_notification_acknowledgments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Stores acknowledgments of system notifications.
--
CREATE TABLE system_notification_acknowledgments (
    id BIGINT DEFAULT nextval('system_notification_acknowledgments_id_seq'::regclass) NOT NULL,
    user_id BIGINT REFERENCES users(id) NOT NULL,
    system_notification_id BIGINT REFERENCES system_notifications(id) NOT NULL,
    deleted BOOLEAN DEFAULT FALSE NOT NULL,
    date_acknowledged TIMESTAMP DEFAULT now() NOT NULL,
    PRIMARY KEY(id)
);

--
-- Each system notification can be acknowledged at most once by each user.
--
CREATE UNIQUE INDEX system_notification_acknowledgments_for_user_index
ON system_notification_acknowledgments(user_id, system_notification_id);
