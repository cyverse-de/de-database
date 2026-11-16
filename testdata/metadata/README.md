# metadata service test config

`metadata.properties` configures the `metadata` service for the docker-compose
test stack, against the `de-database` test image. It is mounted into the container
at `/etc/iplant/de/metadata.properties` (the default config path).

## Database access

The metadata service references its tables unqualified (`avus`, `tags`,
`comments`, `ratings`, …) and has no schema/search_path setting — it only picks a
database name. In the consolidated DE schema those tables live in the `metadata`
schema of the `de` database, and some names (`ratings`, `comments`) also exist in
`public`. So the service connects as a dedicated **`metadata` login role** (created
by [`../sql/90_metadata_role.sql`](../sql/90_metadata_role.sql)) whose
`search_path` is `metadata, public, pg_catalog`. That resolves each unqualified
name to the metadata schema first. The `apps` service keeps using the `de` role
(public-first), so the two never collide.

## AMQP / RabbitMQ

Unlike apps, the metadata service opens an AMQP connection **at startup** and fails
fast if the broker is unreachable, so the compose stack includes a `rabbitmq`
service. RabbitMQ's built-in `guest` user only works over localhost, so the stack
defines a `de` user (`RABBITMQ_DEFAULT_USER/PASS`) and the config points at
`amqp://de:de@rabbitmq:5672`.

## Test data

The `metadata` schema is preloaded with synthetic data for exercising (and
eventually regression-testing a rewrite of) the metadata service. See the
fixtures in `../sql/`:

- `70_metadata.sql` — AVUs, tags + attached tags, comments, favorites, ratings.
- `72_metadata_templates.sql` — `value_types` reference data plus a metadata
  template whose attributes cover several value types, including an Enum attribute
  with values, an attribute group with nested sub-attributes, and a synonym pair.
- `74_metadata_ontologies.sql` — an ontology with classes and a parent/child
  hierarchy.
- `76_metadata_pid_requests.sql` — permanent-ID (DOI) requests with status
  histories and the `permanent_id_request_status_codes` reference data.

`value_types` and `permanent_id_request_status_codes` are reference data the
service expects to exist; production has them but the consolidated de-database
migrations do not seed them, so the fixtures do. Verified end-to-end against the
running service, e.g. `GET /templates?user=testuser01` returns the active template
and `GET /templates/<id>?user=testuser01` returns its full attribute list.

## Working with apps

The apps service reaches metadata at `http://metadata:60000` (its
`apps.metadata.base-url` default). With metadata up, apps's metadata-backed
features (app metadata AVUs, communities, ontology hierarchies, the Beta featured
listing) can talk to a live metadata service. Note the central app
listing/details endpoints additionally need the **iplant-groups** and
**permissions** services, which are not yet in the stack — see
[`../apps/README.md`](../apps/README.md) and [`../COVERAGE.md`](../COVERAGE.md).
