CREATE OR REPLACE FUNCTION change_data_secure(human_name VARCHAR, id INTEGER)
RETURNS VARCHAR
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'UPDATE public.human SET name = $1 WHERE p_id = $2';
	RAISE NOTICE 'Query=%', str;
    EXECUTE str USING human_name, id;
	RETURN human_name;
END;
$$ LANGUAGE plpgsql;
