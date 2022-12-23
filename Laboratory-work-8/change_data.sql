CREATE OR REPLACE FUNCTION change_data(name VARCHAR, bd DATE)
RETURNS DATE
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'UPDATE public.human AS h SET bd = ''' || bd || 
    ''' where name = ''' || name || '''';
	RAISE NOTICE 'Query=%', str;
    EXECUTE str;
	RETURN bd;
END;
$$ LANGUAGE plpgsql;
