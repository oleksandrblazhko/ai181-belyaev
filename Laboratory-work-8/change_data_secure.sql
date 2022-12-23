CREATE OR REPLACE FUNCTION change_data_secure(human_name VARCHAR, bd DATE)
RETURNS DATE
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'UPDATE public.human SET bd = $1 WHERE name = $2';
	RAISE NOTICE 'Query=%', str;
    EXECUTE str USING bd, human_name;
	RETURN bd;
END;
$$ LANGUAGE plpgsql;
