SET search_path = public, pg_catalog;

--
-- Name: notification_set_notification; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE notification_set_notification (
    notification_set_id bigint NOT NULL,
    notification_id bigint NOT NULL,
    hid integer NOT NULL
);
