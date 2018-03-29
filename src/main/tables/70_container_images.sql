SET search_path = public, pg_catalog;

--
-- Contains details about container images used as tools
--
CREATE TABLE container_images (
  id uuid UNIQUE  NOT NULL DEFAULT uuid_generate_v1(),   -- primary key
  name text NOT NULL, -- name used to indicate which image to pull down. Could be a UUID, but don't do that.
  tag text NOT NULL,  -- tag used to pull down an image. We'll default it to 'latest'
  url text,           -- URL containing more information about the image (ex: docker hub URL)
  deprecated boolean NOT NULL DEFAULT FALSE,  -- flag indicating if tools using this image should be used in new apps.
  osg_image_path text, -- the path to the Singularity image in OSG's CVM-FS repository if available.
  unique (name, tag, osg_image_path)
);
