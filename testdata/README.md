# DE test database image

This directory holds everything needed to build a standalone PostgreSQL image
with the full DE schema migrated and a small, synthetic, **anonymized** dataset
preloaded. It is meant for functional/integration testing of DE services against
a real database.

It is intentionally separate from the production migration-runner image (the
repository root `Dockerfile`) and is **not** part of the production build/deploy
path. The migrations and the root `Dockerfile` are not modified by anything here.

## Layout

- `../Dockerfile.testdb` — builds the image. The schema and data are baked in at
  build time so the container starts up already populated.
- `build/bake.sh` — runs during `docker build`: initializes the cluster, installs
  the `uuid-ossp`, `moddatetime`, and `btree_gist` extensions, runs all
  migrations, then loads the data files below.
- `sql/*.sql` — the synthetic data, loaded in filename order. Each file is one
  domain; the numeric prefixes enforce referential ordering.

## Build and run

```sh
docker build -f Dockerfile.testdb -t de-database-testdb .
docker run -d --name detest -p 5432:5432 de-database-testdb

# Wait for readiness (data is baked, so this is quick):
until docker exec detest pg_isready -U de -d de; do sleep 1; done

# Connect:
psql 'postgres://de:de@localhost:5432/de?sslmode=disable'
```

Database `de`, user `de`, password `de`. The `de` account is the cluster
superuser and owns the database and all schemas.

## What's in the data

Reference/lookup tables (data formats, parameter types, tool types, job types,
permission levels, etc.) and the seeded `<public>` user, public workspace, and
fixture apps come from the migrations themselves (`migrations/000019_data_fixtures.up.sql`)
and are **not** duplicated here. The files in `sql/` add the user-content layer
on top:

- `00_users` — ~10 synthetic users (`testuserNN@example.org`).
- `10_integration_and_tools` — integration data, container images, tools, tasks.
- `20_apps` — apps, versions, steps, parameter groups/parameters/file params.
- `30_workspaces_categories` — per-user workspaces and app categories; a couple
  apps published to the public "Beta" category.
- `40_operators` — VICE operators (drive `job_listings.operator_base_url`).
- `50_jobs` — analyses across the common statuses, including a batch parent with
  children and interactive jobs tied to operators; job steps and status updates.
- `60_launches` — submissions, quick launches, instant launches.
- `70_metadata` — app ratings plus the `metadata` schema (AVUs, tags, comments,
  favorites, ratings).
- `80_permissions` — the `permissions` schema (subjects, resources, grants).

All values are invented. Nothing is copied from any real deployment.

## Conventions for adding data

- Use deterministic literal UUIDs for synthetic rows so cross-file references
  stay stable; reference migration-seeded rows by natural key (e.g.
  `(SELECT id FROM job_types WHERE name='DE' AND system_id='de')`), never by a
  hardcoded fixture UUID.
- Keep inserts idempotent with `ON CONFLICT DO NOTHING`.
- Anonymize everything; this image is public.
