BEGIN;

SET search_path = public, pg_catalog;

---
--- A table of tree urls associated with files.
---
CREATE TABLE IF NOT EXISTS tree_urls (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),
    sha1 VARCHAR(40) UNIQUE NOT NULL,
    tree_urls TEXT NOT NULL,

    PRIMARY KEY (id)
);

---
--- Creates an index on the id and sha1 columns
---
CREATE INDEX IF NOT EXISTS tree_urls_id
ON tree_urls(id);

CREATE INDEX IF NOT EXISTS tree_urls_sha1
ON tree_urls(sha1);

COMMIT;
