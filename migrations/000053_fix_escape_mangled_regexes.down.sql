BEGIN;

--
-- Intentionally a no-op. The up migration repairs definitions that earlier
-- migrations (000021, 000048, 000050) always intended to create, and those
-- source migrations now produce the corrected definitions directly — so the
-- state after reverting this migration is identical to the state after
-- applying it. Restoring the escape-mangled definitions would reintroduce
-- the bug and is never desirable.
--

COMMIT;
