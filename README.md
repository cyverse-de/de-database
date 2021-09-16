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

[1]: https://github.com/cyverse-de/de-db
[2]: https://github.com/cyverse-de/metadata-db
[3]: https://github.com/cyverse-de/permissions-db
[4]: https://github.com/cyverse-de/notifications-db
[5]: https://github.com/golang-migrate/migrate
