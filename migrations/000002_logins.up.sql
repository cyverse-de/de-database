BEGIN;

SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS logins (
    user_id uuid NOT NULL,
    ip_address varchar(15),
    user_agent text,
    login_time timestamp NOT NULL DEFAULT now(),
    logout_time timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

COMMIT;
