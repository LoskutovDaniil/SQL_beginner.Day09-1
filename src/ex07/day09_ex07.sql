CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr float[])
RETURNS float AS
$$
BEGIN
    RETURN (SELECT min(value) FROM unnest(arr) AS value);
END;
$$
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);



