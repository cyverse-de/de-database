SET search_path = public, pg_catalog;

--
-- The statuses that have been applied to each tool request.
--
CREATE TABLE tool_request_statuses (
    id UUID NOT NULL DEFAULT uuid_generate_v1(),
    tool_request_id UUID NOT NULL,
    tool_request_status_code_id UUID NOT NULL,
    date_assigned TIMESTAMP DEFAULT now() NOT NULL,
    updater_id UUID NOT NULL,
    comments TEXT
);

--
-- Creates an index on the tool_request_id
--
CREATE INDEX tool_request_statuses_tool_request_id_index
    ON tool_request_statuses(tool_request_id);
