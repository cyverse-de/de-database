SET search_path = public, pg_catalog;

--
-- Tracks warning and cancellation notifications for jobs.
--
CREATE TABLE IF NOT EXISTS notif_statuses (
	id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),
	analysis_id UUID UNIQUE NOT NULL,
	external_id UUID UNIQUE NOT NULL,
	hour_warning_sent BOOL NOT NULL DEFAULT false,
	day_warning_sent BOOL NOT NULL DEFAULT false,
	kill_warning_sent BOOL NOT NULL DEFAULT false,
	hour_warning_failure_count INT NOT NULL DEFAULT 0,
	day_warning_failure_count INT NOT NULL DEFAULT 0,
	kill_warning_failure_count INT NOT NULL DEFAULT 0
);
