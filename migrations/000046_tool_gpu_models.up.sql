BEGIN;

SET search_path = public, pg_catalog;

-- tool_gpu_models
-- Associates tools with GPU models they are able to use
CREATE TABLE IF NOT EXISTS tool_gpu_models (
  -- Foreign key into the tools table
  tool_id uuid NOT NULL,

  -- The name of the GPU model (e.g., "NVIDIA-A16")
  -- Allowed values are managed by configuration outside of this database.
  gpu_model text NOT NULL,

  FOREIGN KEY (tool_id) REFERENCES tools(id) ON DELETE CASCADE,
  PRIMARY KEY (tool_id, gpu_model)
);

COMMIT;
