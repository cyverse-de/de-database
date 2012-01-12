CREATE SEQUENCE users_id_seq;
CREATE TABLE users (
       id          BIGINT PRIMARY KEY DEFAULT nextval('users_id_seq'),
       username    VARCHAR(512) NOT NULL
);

-- Migrate user ids from workspace -> users
INSERT INTO users (username) (SELECT user_id FROM workspace);
ALTER TABLE workspace RENAME COLUMN user_id TO username;
ALTER TABLE workspace ADD COLUMN user_id BIGINT;

UPDATE workspace
SET    user_id = users.id
FROM   users
WHERE  workspace.username = users.username;

ALTER TABLE workspace ADD CONSTRAINT workspace_users_fk FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE workspace DROP COLUMN username;

CREATE SEQUENCE ratings_id_seq;
CREATE TABLE ratings (
       id                         BIGINT PRIMARY KEY DEFAULT nextval('ratings_id_seq'),
       user_id                    BIGINT REFERENCES users(id),
       transformation_activity_id BIGINT REFERENCES transformation_activity(hid),
       rating                     INTEGER NOT NULL,

       CONSTRAINT votes_unique UNIQUE(user_id, transformation_activity_id)
);

