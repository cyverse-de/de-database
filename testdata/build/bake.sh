#!/usr/bin/env bash
#
# Build-time setup for the test database image. Initializes a PostgreSQL cluster,
# installs the required extensions, runs all migrations, and loads the synthetic
# test data. The resulting data directory is baked into the image so the
# container starts up already populated.
#
# Intended to run during `docker build` (see Dockerfile.testdb) as the postgres
# user. Not used at container runtime.

set -euo pipefail

: "${PGDATA:?PGDATA must be set}"
db_user="${POSTGRES_USER:-de}"
db_name="${POSTGRES_DB:-de}"
db_pass="${POSTGRES_PASSWORD:-de}"
sock_dir=/var/run/postgresql

# Initialize the cluster. The DE account is the bootstrap superuser, so it owns
# the database and every schema and can create extensions, satisfying the
# prerequisites documented in the repository README.
pwfile="$(mktemp)"
printf '%s' "$db_pass" > "$pwfile"
initdb --pgdata="$PGDATA" --username="$db_user" --pwfile="$pwfile" \
    --auth-local=trust --auth-host=scram-sha-256 --encoding=UTF8
rm -f "$pwfile"

# Allow service containers to connect over TCP. The baked pg_hba.conf/postgresql.conf
# govern runtime auth because the entrypoint skips initialization on a populated
# data directory.
echo "listen_addresses = '*'" >> "$PGDATA/postgresql.conf"
echo "host all all all scram-sha-256" >> "$PGDATA/pg_hba.conf"

# Bring up a temporary, socket-only server for the build steps.
pg_ctl --pgdata="$PGDATA" --wait \
    --options="-c listen_addresses='' -c unix_socket_directories=$sock_dir" start

createdb --host="$sock_dir" --username="$db_user" "$db_name"

psql --set=ON_ERROR_STOP=1 --host="$sock_dir" --username="$db_user" --dbname="$db_name" <<'SQL'
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS moddatetime;
CREATE EXTENSION IF NOT EXISTS btree_gist;
SQL

migrate -path /migrations \
    -database "postgres://$db_user@/$db_name?sslmode=disable&host=$sock_dir" up

for f in /testdata/sql/*.sql; do
    echo ">> loading ${f}"
    psql --set=ON_ERROR_STOP=1 --host="$sock_dir" --username="$db_user" --dbname="$db_name" --file="$f"
done

# Clean shutdown so the baked data directory is left consistent.
pg_ctl --pgdata="$PGDATA" --mode=fast --wait stop
