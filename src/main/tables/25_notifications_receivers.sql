SET search_path = public, pg_catalog;

--
-- Name: notifications_receivers; Type: TABLE; Schema: public; Owner: de; Tablespace: 
--
CREATE TABLE notifications_receivers (
    notification_id bigint NOT NULL,
    receiver character varying(255),
    hid integer NOT NULL
);
