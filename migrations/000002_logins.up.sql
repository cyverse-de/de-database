SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS logins (
    user_id uuid NOT NULL,
    ip_address varchar(15),
    user_agent text,
    login_time timestamp NOT NULL DEFAULT now(),
    logout_time timestamp
);

-- this part probably isn't idempotent, don't think there's an IF NOT EXISTS for ALTER TABLE ADD CONSTRAINT though

ALTER TABLE ONLY logins
    ADD CONSTRAINT logins_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);
