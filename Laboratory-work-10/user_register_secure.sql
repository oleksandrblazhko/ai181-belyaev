CREATE OR REPLACE FUNCTION user_register_secure(
    v_user_name VARCHAR, 
	v_password VARCHAR
)
	RETURNS INTEGER
AS $$
BEGIN
	IF EXISTS (SELECT FROM most_used_passwords
                  WHERE password = v_password) THEN
        RAISE 'Passname = % is bad passname',v_password;
		RETURN -1;
	END IF;

    IF (REGEXP_MATCH(v_password, 
        '(?=\S{9,})(?=.*[0-9]{2,})(?=.*[a-z]{2,})(?=.*[A-Z]{2,})(?=.*[!@#$%^&*]{2,})')
       ) IS NULL THEN
       RAISE 'Incorrect content of password';
	   RETURN -1;
    END IF;
    INSERT INTO users (user_name,password_hash) 
        VALUES (v_user_name,md5(v_password));
	RETURN 1;
END;
$$ LANGUAGE plpgsql;
