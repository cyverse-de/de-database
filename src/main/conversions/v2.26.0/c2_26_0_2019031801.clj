(ns facepalm.c2-26-0-2019031801
  (:use [kameleon.sql-reader :only [load-sql-file]]
        [kameleon.sql-reader :only [exec-sql-statement]]))

(def ^:private version
  "The destination database version"
  "2.26.0:20190318.01")

(defn- rename-badge-table
  []
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges RENAME COLUMN user_id TO creator;")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges
    ADD COLUMN description text,
    ADD COLUMN app_id uuid NOT NULL,
    ADD COLUMN is_public boolean NOT NULL DEFAULT false;")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges
    RENAME CONSTRAINT badges_id_pkey TO quick_launches_id_pkey;")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges
    RENAME CONSTRAINT badges_submission_id_fkey TO quick_launches_submission_id_fkey;")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges
    RENAME CONSTRAINT badges_user_id_fkey TO quick_launches_creator_fkey;")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges
    ADD CONSTRAINT quick_launches_app_id_fkey FOREIGN KEY (app_id) REFERENCES apps(id);")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges RENAME TO quick_launches;"))

(defn- add-quick-launch-favorites
  []
  (load-sql-file "tables/091_quick_launch_favorites.sql")
  (load-sql-file "constraints/00_91_quick_launch_favorites_pkey.sql")
  (load-sql-file "constraints/91_quick_launch_favorites.sql"))

(defn- add-quick-launch-user-defaults
  []
  (load-sql-file "tables/092_quick_launch_user_defaults.sql")
  (load-sql-file "constraints/00_92_quick_launch_user_defaults_pkey.sql")
  (load-sql-file "constraints/92_quick_launch_user_defaults.sql"))

(defn- add-quick-launch-global-defaults
  []
  (load-sql-file "tables/093_quick_launch_global_defaults.sql")
  (load-sql-file "constraints/00_93_quick_launch_global_defaults_pkey.sql")
  (load-sql-file "constraints/93_quick_launch_global_defaults.sql"))

(defn convert
  []
  (println "Performing the conversion to" version)
  (rename-badge-table)
  (add-quick-launch-favorites)
  (add-quick-launch-user-defaults)
  (add-quick-launch-global-defaults))
