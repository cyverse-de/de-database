SET search_path = public, pg_catalog;

--
-- A table containing user preferences.
--
CREATE TABLE IF NOT EXISTS user_preferences (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    user_id UUID NOT NULL,
    preferences TEXT NOT NULL,
    PRIMARY KEY (id)
);

---
--- A table containing user sessions
---
CREATE TABLE IF NOT EXISTS user_sessions (
    id UUID DEFAULT uuid_generate_v1(),
    user_id UUID NOT NULL,
    session TEXT NOT NULL,
    PRIMARY KEY (id)
);

---
--- A table for storing a user's saved searches
---
CREATE TABLE IF NOT EXISTS user_saved_searches (
    id UUID DEFAULT uuid_generate_v1(),
    user_id UUID NOT NULL,
    saved_searches TEXT NOT NULL,
    PRIMARY KEY (id)
);

---
--- A table for storing OAuth 2.0 access tokens.
---
CREATE TABLE IF NOT EXISTS access_tokens (
    webapp VARCHAR(64) NOT NULL,
    user_id UUID NOT NULL,
    token BYTEA NOT NULL,
    expires_at TIMESTAMP,
    refresh_token BYTEA,
    PRIMARY KEY (webapp, user_id)
);

---
--- A table for storing authorization request state information.
---
CREATE TABLE IF NOT EXISTS authorization_requests (
    id UUID NOT NULL,
    user_id UUID UNIQUE NOT NULL,
    state_info TEXT NOT NULL,
    PRIMARY KEY (id)
);

---
--- foreign keys
---

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY user_sessions
    ADD CONSTRAINT user_sessions_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY user_saved_searches
    ADD CONSTRAINT user_saved_searches_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY access_tokens
    ADD CONSTRAINT access_tokens_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE ONLY authorization_requests
    ADD CONSTRAINT authorization_requests_user_id_fkey
    FOREIGN KEY (user_id)
    REFERENCES users(id);

---
--- indices
---
CREATE INDEX IF NOT EXISTS user_preferences_user_id_idx ON user_preferences(user_id);

CREATE INDEX IF NOT EXISTS user_sessions_user_id_idx ON user_sessions(user_id);

CREATE INDEX IF NOT EXISTS user_saved_searches_user_id_idx ON user_sessions(user_id);
