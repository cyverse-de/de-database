# Apps service test-data coverage

This maps the `apps` service (`../apps`) read paths to the fixtures in `sql/` that
exercise them, for building golden-master regression tests ahead of a Go rewrite.

Legend: **DB** = fully exercisable with this image alone; **+meta** = also needs the
metadata service running against this DB; **+perms** = also needs the permissions
service; **ext** = data comes from an external system (Tapis/Agave) and is not in
this DB at all.

## Fixtures and what they add

| File | Domain |
|------|--------|
| `00_users.sql` | 10 synthetic users |
| `10_integration_and_tools.sql` | integration_data, container_images (incl. OSG image), tools (executable/interactive/OSG), tasks (incl. external/Agave task + pipeline + showcase tasks) |
| `15_container_settings.sql` | container_settings, devices, volumes, ports, interactive proxy settings |
| `20_apps.sql` | 10 apps: simple, multi-version (deleted/disabled), OSG, external, pipeline, parameters-showcase; app_versions; app_steps |
| `22_parameters.sql` | every parameter type, parameter_values (incl. tree parent/child), file_parameters, validation_rules + arguments |
| `25_pipelines.sql` | workflow_io_maps + input_output_mapping (2-step pipeline) |
| `28_app_docs_refs.sql` | app_documentation, app_references |
| `30_workspaces_categories.sql` | per-user workspace + Workspace/dev/favorites categories; Beta + Bioinformatics public categories; suggested_groups |
| `35_tool_requests.sql` | tool_requests + tool_request_statuses |
| `45_publication_requests.sql` | app_publication_requests + statuses; extra ratings |
| `70_metadata.sql` | metadata AVUs incl. Beta/ontology/community AVUs |
| `80_permissions.sql` | permissions subjects (user + group), resources, grants |

## Endpoint coverage

| Endpoint (read) | Tier | Fixtures |
|-----------------|------|----------|
| `GET /apps` (search/list, paging) | DB | 20, 22, 30, 45 (ratings), 80 (public set) |
| `GET /apps/:sys/:id/listing` | DB | 20, 45 |
| `GET /apps/:sys/:id` (job view) | DB | 20, 22, 15 |
| `GET /apps/:sys/:id/details` | DB | 20, 28, 45 |
| `GET /apps/:sys/:id/documentation` | DB | 28 |
| `GET /apps/:sys/:id/tasks` | DB | 10, 20 |
| `GET /apps/:sys/:id/tools` | DB | 10, 15 |
| `GET /apps/:sys/:id/versions/...` | DB | 20 (3-version app; deleted/disabled) |
| `GET /apps/categories` (+ counts) | DB | 30 |
| `GET /apps/categories/:sys/:cat` | DB | 30 |
| `GET /apps/categories/featured` (Beta) | +meta | 30, 70 (beta AVU) |
| `is_favorite` flag in listings | DB | 30 (favorites category) |
| `GET /apps/pipelines/:id/ui` | DB | 20, 22, 25 |
| `GET /tools`, `GET /tools/:id` | DB | 10, 15 |
| `GET /tools/:id/apps` | DB | 10, 20 |
| `GET /tool-requests`, `/status-codes` | DB | 35 |
| `GET /reference-genomes` | DB | migration-seeded `genome_reference` |
| `GET /admin/integration-data` | DB | 10 |
| `GET /admin/apps/publication-requests` | DB | 45 |
| `GET /apps/elements/*` (param/tool/value types, formats, info types, rule types, data sources) | DB | migration-seeded reference data |
| `GET /apps/:id/metadata` (AVUs) | +meta | 70 |
| `GET /apps/communities/...`, `/apps/hierarchies/...` | +meta | 70 (community/ontology AVUs) |
| `POST /apps/permission-lister`, `/apps/sharing` | +perms | 80 |
| `GET /apps/hpc/...` (Tapis apps) | ext | n/a (external system) |

## Notes for the rewrite

- The pipeline app (`Test Pipeline 1`, `66666666-…-609`) has `step_count = 2` /
  `task_count = 2` and an input→output mapping — use it for pipeline + multi-step
  listing assertions.
- The versioned app (`66666666-…-606`) has three versions; `1.0.0` is deleted and
  `2.0.0` is disabled, so default listings should show only `3.0.0`.
- `is_favorite` is true for `Test App 1` when listing as `testuser01` (it's in that
  user's "Favorite Apps" category, child_index 1 of the workspace root).
- `+meta`/`+perms` rows are seeded now but only become testable once those services
  are added to the harness; until then, assert those endpoints separately.
