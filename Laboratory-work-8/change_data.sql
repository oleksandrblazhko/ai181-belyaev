CREATE OR REPLACE FUNCTION change_data(human_name VARCHAR, id INTEGER)
RETURNS VARCHAR
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'UPDATE public.human SET name = ''' || human_name || 
    ''' where p_id = ''' || id|| '''';
	RAISE NOTICE 'Query=%', str;
    EXECUTE str;
	RETURN human_name;
END;
$$ LANGUAGE plpgsql;