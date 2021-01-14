SET search_path = public, pg_catalog;

--
-- Foreign key constraint for the user_id field of the webhooks table.
--
ALTER TABLE ONLY webhooks
      ADD  CONSTRAINT webhooks_user_id_fkey
      FOREIGN KEY (user_id)
      REFERENCES users(id);

--
-- Foreign key constraint for the type_id field of the webhooks table.
--
ALTER TABLE ONLY webhooks
      ADD  CONSTRAINT webhooks_type_id_fkey
      FOREIGN KEY (type_id)
      REFERENCES webhooks_type(id);
