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
- `COVERAGE.md` — maps apps-service read endpoints to the fixtures that exercise
  them (and flags endpoints that also need the metadata or permissions service).
- `verify/apps_smoke.sql` — sanity report + assertions for the apps fixtures.

## Build and run

```sh
docker build -f Dockerfile.testdb -t de-database-testdb .
docker run -d --name detest -p 5432:5432 de-database-testdb

# Wait for readiness (data is baked, so this is quick):
until docker exec detest pg_isready -U de -d de; do sleep 1; done

# Connect:
psql 'postgres://de:de@localhost:5432/de?sslmode=disable'
```

## What's in the data

Reference/lookup tables (data formats, parameter types, tool types, job types,
permission levels, reference genomes, tool architectures, status codes, etc.) and
the seeded `<public>` user, public workspace, and fixture apps come from the
migrations themselves (`migrations/000019_data_fixtures.up.sql`) and are **not**
duplicated here. The files in `sql/` add the user-content layer on top:

- `00_users` — ~10 synthetic users (`testuserNN@example.org`).
- `10_integration_and_tools` — integration data, container images, tools
  (executable / interactive / OSG), and tasks (incl. an external/Agave task).
- `15_container_settings` — container settings, devices, volumes, ports, and the
  interactive (VICE) proxy settings.
- `20_apps` — 10 apps: simple, a multi-version app (deleted + disabled versions),
  OSG, external, a 2-step pipeline, and a parameters-showcase app; plus versions
  and steps.
- `22_parameters` — every major parameter type, selection options
  (`parameter_values`, incl. a parent/child tree), file parameters, and
  validation rules.
- `25_pipelines` — `workflow_io_maps` + `input_output_mapping` for the pipeline.
- `28_app_docs_refs` — app documentation and references.
- `30_workspaces_categories` — per-user workspaces mirroring the apps bootstrap
  (root "Workspace" + "Apps under development" + "Favorite Apps"); public Beta and
  Bioinformatics categories; suggested groups.
- `35_tool_requests` — tool installation requests with status histories.
- `40_operators` — VICE operators (drive `job_listings.operator_base_url`).
- `45_publication_requests` — app publication requests + statuses; extra ratings.
- `50_jobs` — analyses across the common statuses, including a batch parent with
  children and interactive jobs tied to operators; job steps and status updates.
- `60_launches` — submissions, quick launches, instant launches.
- `70_metadata` — core `metadata` schema content (AVUs, tags, comments, favorites,
  ratings), including Beta/ontology/community AVUs for metadata-service-backed
  apps features.
- `72_metadata_templates` — the metadata template/attribute system: a template
  with attributes of several value types (incl. an Enum with values, a Grouping
  with nested sub-attributes, and a synonym pair), plus a deleted template.
  References the migration-seeded `value_types`.
- `74_metadata_ontologies` — a synthetic ontology with classes and a parent/child
  hierarchy.
- `76_metadata_pid_requests` — permanent-ID (DOI) requests with status histories
  (references the migration-seeded request types and status codes).
- `80_permissions` — the `permissions` schema (user + group subjects, resources,
  grants).
- `90_metadata_role` — a dedicated `metadata` DB login role (search_path
  `metadata, public`) for the metadata service; see `metadata/README.md`.

## Apps service coverage

The fixtures are sized to support **golden-master regression tests** for the
`apps` service (ahead of a Go rewrite). See `COVERAGE.md` for the endpoint →
fixture matrix. After building, run the smoke checks:

```sh
psql 'postgres://de:de@localhost:5432/de?sslmode=disable' -f testdata/verify/apps_smoke.sql
```

Some apps endpoints (communities, ontology hierarchies, app metadata AVUs, the
Beta category, sharing/permission listing) read through the **metadata** or
**permissions** services rather than the database directly. The supporting rows
are seeded here, but those endpoints are only testable once those services are
running against this same database.

## Conventions for adding data

- Use deterministic literal UUIDs for synthetic rows so cross-file references
  stay stable; reference migration-seeded rows by natural key (e.g.
  `(SELECT id FROM job_types WHERE name='DE' AND system_id='de' LIMIT 1)`), never
  by a hardcoded fixture UUID.
- Keep inserts idempotent with `ON CONFLICT DO NOTHING`.
- Anonymize everything; this image is public.
