
Discovery Environment Database Schema
=====================================

This is the relational database schema for the PostgreSQL instance used for relational storage by
the Discovery Environment distributed system

## Layout of Schema Source Directory

The relational database schema is defined in `*.sql` files under folders in the [src/main](src/main) directory.

### Extensions

The [extensions](src/main/extensions) directory contains files defining PostgreSQL extensions required for this database.
These should only need to be defined once, when the database is initially setup, so these files should be loaded first.

### Tables

The [tables](src/main/tables) directory contains files defining all tables in this database.

Each file should be named the same as the table it defines.
These files used to also define constraints for each table, which is why existing files are prefixed by a number
(so that our [tool that creates a new database](https://github.com/cyverse-de/facepalm)
will load these files in the correct order).
Constraints are now defined in separate files under the [constraints folder](#constraints),
so these table files no longer require a number prefix.

### Constraints

The [constraints](src/main/constraints) directory contains files defining all constraints for each table in the database.

The main motivation for keeping constraints out of the [tables](#tables) files is so that,
should the need arise again,
all constraints can be dropped at once,
then all new or modified constraints can be loaded from these files,
and without dropping any existing tables or data.

Every constraint used to go into the [00_constraints.sql](src/main/constraints/00_constraints.sql) file,
but now constraints are defined in separate files prefixed with numbers to ensure the constraints are loaded in the correct order.
Not every constraint has been migrated out of the [00_constraints.sql](src/main/constraints/00_constraints.sql)
file and into a separate file yet.

Each file should define constraints for one table, so each constraints file should be named with its table name.
Each file name should be prefixed with a number so that our [database tool](https://github.com/cyverse-de/facepalm)
that loads these files will load them in the correct order.

Since primary keys should be defined before other constraints (such as foreign keys),
each primary key should go into a separate file prefixed with `00_`,
which allows these files to be loaded before other constraints.

For example, the [tools](src/main/tables/03_tools.sql) table constraints should be loaded 3rd,
so its primary key is defined in [00_03_tools_pkey.sql](src/main/constraints/00_03_tools_pkey.sql),
and its other constraints are defined in [03_tools.sql](src/main/constraints/03_tools.sql).
One of its constraints references the [container_images](src/main/tables/70_container_images.sql) table,
which is why that table's primary key is defined in
[00_70_container_images_pkey.sql](src/main/constraints/00_70_container_images_pkey.sql),
so that it will be loaded before [03_tools.sql](src/main/constraints/03_tools.sql).

### Data

The [data](src/main/data) directory contains files defining data required for certain tables,
when those tables are first added to the database,
or when a new database is initialized.

Each file should define data for one table, so each data file should be named with its table name.
Each file name should also be prefixed with a number so that our [database tool](https://github.com/cyverse-de/facepalm)
that loads these files will load them in the correct order,
since foreign keys are likely to already be defined for these tables before these data files are loaded.

### Functions

The [functions](src/main/functions) directory contains files defining functions required for certain queries used by our services.

Each file generally defines one function and its variants, so each function file should be named with its function name.
Each file name should also be prefixed with a number so that our [database tool](https://github.com/cyverse-de/facepalm)
that loads these files will load them in the correct order,
since some functions may use other functions defined in this directory.

### Views

The [views](src/main/views) directory contains files defining views required for certain queries used by our services.

Each file should define one view, so each file should be named the same as the view it defines.
Each file name should also be prefixed with a number so that our [database tool](https://github.com/cyverse-de/facepalm)
that loads these files will load them in the correct order,
since some views may reference other views defined in this directory.

### Conversions

The [conversions](src/main/conversions) directory contains files defining database conversions used by our
[database tool](https://github.com/cyverse-de/facepalm) to add, update, or remove
[tables](#tables), [constraints](#constraints), [data](#data), [functions](#functions), or [views](#views).

These conversion files are written in Clojure,
and can update the database by loading and running SQL from files in the directories listed above,
or with SQL queries defined directly in the conversion file.

The conversion files are grouped into subfolders named by the [DE version](https://github.com/cyverse-de/apps) they are updating,
and each conversion file is also named with a specific [database version](src/main/data/99_version.sql),
which allows our [database tool](https://github.com/cyverse-de/facepalm) to run these conversions in the correct order.

The [database tool](https://github.com/cyverse-de/facepalm) relies on versions added to the
[version table](src/main/data/99_version.sql) to determine which conversions have already been run,
so a conversion will not attempt to run against a database instance twice.
So when a new conversion file is added,
its version should also be added to the [version table](src/main/data/99_version.sql)
so that new database instances will have the latest version defined.
