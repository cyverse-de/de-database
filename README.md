# Database Schema for Discovery Environment Notifications

This repository contains the database migration files for the relational database used to by the CyVerse Discovery
Environment to store notifications and other related information. This repository uses [golang-migrate/migrate][1] to
perform migrations. This project allows us to write our migrations as simple SQL files. It also allows us to migrate in
both directions, so that we can revert to a previous version of a database if necessary.

## Prerequisites

Before running migrations, the following conditions need to be met:

- The database being used to store notifications must exist.
- The account that we're using to access the database must be the owner of the notifications database.
- The account that we're using to access the database must be the owner of the default schema.
- The `uuid-ossp` extension must be installed in the notifications database.

## Migration Files

The migration files will be stored in the `/migrations` subdirectory and will follow the naming convention,
`{version}_{description}.sql` See the [documentation for golang-migrate/migrate][1] for more information.

## Database URLs

The `migrate` command requires a database URL to be able to connect to the database. The URL is in the format,

```
postgres://user:password@host:port/database-name?query-params
```

The password component of the URL is optional, so if you have a correctly configured `.pgpass` file available then it
can be omitted. Also, we haven't implemented SSL for any of our PostgreSQL instances, so the `sslmode` parameter should
always be set to `disable` at this time. Here's an example of a database URL that we might use in one of our deployments
(with a bogus host name).

```
postgres://de@postgres.example.org/notifications?sslmode=disable.
```

## Common Examples

These examples use the environment variable, `DBURL`, to indicate where the URL should be specified on the command line.

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

[1]: https://github.com/golang-migrate/migrate
