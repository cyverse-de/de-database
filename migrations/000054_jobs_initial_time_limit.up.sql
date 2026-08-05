BEGIN;

SET search_path = public, pg_catalog;

--
-- Add initial_time_limit_seconds to jobs to store the user-selected initial
-- duration (in seconds) at analysis launch time. NULL means no override was
-- provided and the tool-derived default will be used by timelord.
--
ALTER TABLE ONLY jobs
    ADD COLUMN initial_time_limit_seconds INTEGER;

COMMIT;
