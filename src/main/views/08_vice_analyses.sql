SET search_path = public, pg_catalog;

---
--- View containing info needed by VICE for its analysis listing.
---
CREATE OR REPLACE VIEW vice_analyses AS
      SELECT j.id,
             j.job_name,
             j.app_name,
             j.subdomain,
             j.start_date,
             j.end_date,
             j.status,
             u.id AS user_id,
             u.username,
             j.job_description,
             j.app_id,
             j.result_folder_path,
             j.planned_end_date,
             a.description AS app_description,
             a.edited_date AS app_edited_date,
             l.id AS tool_id,
             l.name AS tool_name,
             l.description AS tool_description,
             l.version AS tool_version,
             c.working_directory,
             c.entrypoint,
             c.uid,
             c.min_cpu_cores,
             c.max_cpu_cores,
             c.memory_limit,
             c.pids_limit,
             c.skip_tmp_mount,
             p.container_port,
             i.id AS image_id,
             i.name AS image_name,
             i.tag AS image_tag,
             i.url AS image_url,
             s.step
      FROM jobs j
      JOIN users u ON j.user_id = u.id
      JOIN apps a ON j.app_id = CAST(a.id as character varying)
      JOIN app_steps s ON a.id = s.app_id
      JOIN job_steps o ON j.id = o.job_id
       AND o.app_step_number = ( s.step + 1 )
      JOIN tasks k ON s.task_id = k.id
      JOIN tools l ON k.tool_id = l.id
      JOIN container_settings c ON l.id = c.tools_id
      JOIN container_images i ON l.container_images_id = i.id
      JOIN container_ports p ON c.id = p.container_settings_id
     WHERE j.deleted = false
       AND l.interactive = true
  ORDER BY s.step ASC;
