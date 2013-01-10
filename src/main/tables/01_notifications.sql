--
-- ID sequence for the notifications table.
--
CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Stores notification information.
--
CREATE TABLE notifications (
    id BIGINT DEFAULT nextval('notifications_id_seq'::regclass) NOT NULL,
    uuid UUID NOT NULL,
    type VARCHAR(32),
    username VARCHAR(512),
    subject VARCHAR(255),
    seen BOOLEAN,
    deleted BOOLEAN,
    date_created TIMESTAMP DEFAULT now(),
    message TEXT,
    PRIMARY KEY(id)
);
