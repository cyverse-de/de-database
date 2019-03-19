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
    ADD COLUMN is_creator_default boolean NOT NULL DEFAULT false,
    ADD COLUMN is_global_default boolean NOT NULL DEFAULT false,
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
   "ALTER TABLE ONLY badges
    ADD CONSTRAINT quick_launches_app_id_fkey FOREIGN KEY (app_id) REFERENCES apps(id),
    ADD CONSTRAINT quick_launches_app_id_creator_is_creator_default_unique UNIQUE (app_id, creator, is_creator_default),
    ADD CONSTRAINT quick_launches_app_id_is_global_default_unique UNIQUE (app_id, is_global_default);")
  (exec-sql-statement
   "ALTER TABLE IF EXISTS ONLY badges RENAME TO quick_launches;"))

(defn- add-quick-launch-favorites
  []
  (load-sql-file "tables/91_quick_launch_favorites.sql")
  (load-sql-file "constraints/00_91_quick_launch_favorites_pkey.sql")
  (load-sql-file "constraints/91_quick_launch_favorites.sql"))


(defn convert
  []
  (println "Performing the conversion to" version)
  (rename-badge-table)
  (add-quick-launch-favorites))
