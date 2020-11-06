CREATE OR REPLACE FUNCTION public.trigger_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;