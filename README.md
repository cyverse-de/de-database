
Discovery Environment Metadata Database Schema
==============================================

This is the relational database schema for the PostgreSQL instance of the metadata database used by
the Discovery Environment distributed system.

## Layout of Schema Source Directory

The relational database schema is defined in `*.sql` files under folders in the [src/main](src/main) directory.

See the [de-db documentation](https://github.com/cyverse-de/de-db) for a description of this directory layout.
Except this repository does not contain as many conversions as
[the de-db conversions directory](https://github.com/cyverse-de/de-db/blob/master/src/main/conversions),
so this repo's [conversions](src/main/conversions) only contains files and no subdirectories.
