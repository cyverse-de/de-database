# Database Schema for Discovery Environment Notifications

This repository contains the database migration files for the relational database used to by the CyVerse Discovery
Environment to store notifications and other related information. This repository uses [golang-migrate/migrate][1] to
perform migrations. This project allows us to write our migrations as simple SQL files. It also allows us to migrate in
both directions, so that we can revert to a previous version of a database if necessary.

# Migration Files

The migration files will be stored in the `/migrations` subdirectory and will follow the naming convention,
`{version}_{description}.sql` See the [documentation for golang-migrate/migrate][1] for more information.

[1]: https://github.com/golang-migrate/migrate
