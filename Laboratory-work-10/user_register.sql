CREATE OR REPLACE FUNCTION user_register(
    v_user_name VARCHAR, 
	v_password VARCHAR
)
	RETURNS INTEGER
AS $$
BEGIN
	IF NOT EXISTS (SELECT FROM most_used_passwords
                  WHERE password = v_password) THEN
                  INSERT INTO users (user_name,password_hash) 
                  VALUES (v_user_name,md5(v_password));
    ELSE
        RAISE NOTICE 'Passname = % is bad passname',v_password;
		RETURN -1;
	END IF;
	RETURN 1;
END;
$$ LANGUAGE plpgsql;
