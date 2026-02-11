BEGIN;

SET search_path = public, pg_catalog;

-- container_gpu_models
-- Associates tools (via container settings) with GPU models they are able to use
CREATE TABLE IF NOT EXISTS container_gpu_models (
  -- Foreign key into the container_settings table
  container_settings_id uuid NOT NULL,

  -- The name of the GPU model (e.g., "NVIDIA-A16")
  -- Allowed values are managed by configuration outside of this database.
  gpu_model text NOT NULL,

  FOREIGN KEY (container_settings_id) REFERENCES container_settings(id) ON DELETE CASCADE,
  PRIMARY KEY (container_settings_id, gpu_model)
);

COMMIT;
