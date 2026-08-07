# apps service test config

`apps.properties` is the configuration for running the `apps` service in the
docker-compose test stack (defined in the repo-root `docker-compose.yml`), pointed
at the `de-database` test image.

It is mounted into the container at `/etc/iplant/de/apps.properties`, which is the
default path the apps service reads (`apps.core` `--config` default).

## Scope: database-only (limited)

The apps service connects to the database eagerly at startup and boots fine with
only the database present. Its other service clients (metadata, permissions,
iplant-groups, jex, data-info, notification-agent) are lazy — only contacted on
first use — so the service starts, but **many endpoints still call those services
mid-request** and fail when they are absent.

Verified against this stack (apps + DB only):

- **Works now:** endpoints that read reference/DB data without resolving a user
  workspace or filtering by permission — e.g. `/apps/elements/*` (parameter
  types, info types, data formats, tool types, rule types, value types, data
  sources), `/tool-requests`, `/reference-genomes`. The status endpoint `/`.
- **Fails without iplant-groups:** anything that resolves or bootstraps a user's
  workspace. The app listing path (`GET /apps`, and the combined listing it uses)
  dereferences an iplant-groups lookup and returns
  `UnknownHostException: iplant-groups`.
- **Fails without permissions:** app listing/details and per-app permission
  filtering (`UnknownHostException: permissions`).
- **Fails without metadata:** communities, ontology hierarchies, app metadata
  AVUs, the Beta featured listing.

So to exercise the central app listing/details/version endpoints you need at
least **iplant-groups + permissions** (and **metadata** for the metadata-backed
ones) added to the stack — apps + DB alone covers only the reference/DB-only
endpoints above. See [`../COVERAGE.md`](../COVERAGE.md) for the per-endpoint
service tiers.

## Requests need a user

Most endpoints require a `user` query parameter. The service appends
`apps.uid.domain` to it, so `?user=testuser01` becomes `testuser01@example.org`,
matching the seeded fixture users. Example:

```sh
curl 'http://localhost:60000/apps?user=testuser01'
```

## Keep in sync with the fixtures

The workspace/category and Beta-AVU settings here must match the seeded data in
`../sql/` (root category `Workspace`, `Apps under development` at index 0,
`Favorite Apps` at index 1, beta attr `n2t.net/ark:/99152/h1459`). If you change
those in the fixtures, update them here too.
