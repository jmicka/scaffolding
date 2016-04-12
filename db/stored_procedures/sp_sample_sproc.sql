CREATE OR REPLACE FUNCTION sp_sample_sproc(
    IN _auth_token UUID NULL
)

RETURNS SETOF type_sample AS $$

<< outerblock >>
DECLARE
BEGIN
    IF(_auth_token IS NULL) THEN
        RAISE EXCEPTION 'auth_token cannot be null' USING ERRCODE = '20000';
    END IF;

    RETURN QUERY SELECT 'Hello World' AS string;

END
$$ LANGUAGE PLPGSQL SECURITY DEFINER;

