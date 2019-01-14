--
-- Taken from https://github.com/voxpelli/node-connect-pg-simple/blob/HEAD/table.sql
--
CREATE TABLE "session" (
  "sid" varchar NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);
