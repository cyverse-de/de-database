# Database Schema for the Discovery Environment

This repository contains the database migration files for the relational
database used by the CyVerse Discovery Environment. This is the successor to the
former four databases for assorted Discovery Environment services ([de][1],
[metadata][2], [permissions][3], and [notifications][4]), now in schemas within
one database. For reference, these older DB schemas and migrations are available
in the `old-databases` folder. `notifications-db-v2` refers to the `v2` branch
of the old notifications DB schema; all others refer to the primary branch of
their respective databases.

The migrations use the [golang-migrate/migrate][5] system and are stored within
the `migrations` folder. They're written as pairs of simple SQL files, one each
for applying and reverting each migration.

## Prerequisites

Before migrations can be run, the following need to be met:

- The database must exist.
- The account being used to access must be the owner of the database and
  relevant schemas.
- The `uuid-ossp` extension must already be installed in the database by a
  superuser.
- The `moddatetime` extension must already be installed in the database by a
  superuser.
- The `btree_gist` extension must already be installed in the database by a
  superuser.

## Database URLs

The `migrate` command requires a database URL to be able to connect to the
database. The URL is in the format,

```
postgres://user:password@host:port/database-name?query-params
```

The password component of the URL is optional, so if you have a correctly
configured `.pgpass` file available then it can be omitted. Also, we haven't
implemented SSL for any of our PostgreSQL instances, so the `sslmode` parameter
should always be set to `disable` at this time. Here's an example of a database
URL that we might use in one of our deployments (with a bogus host name).

```
postgres://de@postgres.example.org/de?sslmode=disable.
```

## Common Examples

These examples use the environment variable, `DBURL`, to indicate where the URL
should be specified on the command line.

Update the database to the latest version:

```
$ migrate -database "$DBURL" -path migrations up
```

Remove all database migrations, effectively clearing the database:

```
$ migrate -database "$DBURL" -path migrations down
```

Delete everything in the database schema (extensions are unaffected by this):

```
$ migrate -database "$DBURL" -path migrations drop
```

Remove the most recent migration from the database:

```
$ migrate -database "$DBURL" -path migrations down 1
```

## Test database container image

For functional and integration testing of DE services, this repository also
builds a standalone PostgreSQL image that comes up with the DE schema already
migrated and a small set of synthetic, anonymized test data preloaded. It is
separate from the production migration-runner image described above (the root
`Dockerfile`) and is **not** part of the production build/deploy path.

The schema and data are baked into the image at build time, so a container starts
up ready to use. The image, its build script, and the test data live alongside
the migrations:

- `Dockerfile.testdb` — builds the image.
- `testdata/` — the build script and the synthetic data files (see
  [`testdata/README.md`](testdata/README.md) for details and conventions).
- `docker-compose.yml` — convenience wrapper for running it.

### Using Docker Compose

```
$ docker compose up -d            # build (first run) and start
$ docker compose up -d --build    # force a rebuild after editing testdata/
$ docker compose down -v          # stop and drop the volume
```

The database listens on host port `5432` by default. If that port is already in
use locally, override it:

```
$ DE_DB_PORT=5440 docker compose up -d
```

Other compose stacks can wait for a ready database with:

```yaml
depends_on:
  de-database:
    condition: service_healthy
```

### Using Docker directly

```
$ docker build -f Dockerfile.testdb -t de-database-testdb .
$ docker run -d --name de-database-testdb -p 5432:5432 de-database-testdb
```

### Connecting

The database name, user, and password are all `de`, and the `de` account owns the
database and all schemas:

```
postgres://de:de@localhost:5432/de?sslmode=disable
```

The container exposes a `pg_isready` health check, so you can wait for it to
finish coming up before pointing tests at it:

```
$ until docker exec de-database-testdb pg_isready -U de -d de; do sleep 1; done
```

The preloaded data is sized to support functional/regression testing of DE
services. For the apps service in particular, `testdata/COVERAGE.md` maps read
endpoints to the fixtures that exercise them, and `testdata/verify/apps_smoke.sql`
provides a sanity report plus assertions. See `testdata/README.md` for the full
contents and conventions.

[1]: https://github.com/cyverse-de/de-db
[2]: https://github.com/cyverse-de/metadata-db
[3]: https://github.com/cyverse-de/permissions-db
[4]: https://github.com/cyverse-de/notifications-db
[5]: https://github.com/golang-migrate/migrate
