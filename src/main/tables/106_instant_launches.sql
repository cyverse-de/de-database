SET search_path = public, pg_catalog;

CREATE TABLE IF NOT EXISTS instant_launches (
    id UUID UNIQUE NOT NULL DEFAULT uuid_generate_v1(),

    quick_launch_id UUID NOT NULL,

    added_by UUID NOT NULL,

    added_on TIMESTAMP NOT NULL DEFAULT now()
);