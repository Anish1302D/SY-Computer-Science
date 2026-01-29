CREATE OR REPLACE PROCEDURE divide_numbers(a NUMERIC, b NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    IF b = 0 THEN
        RAISE EXCEPTION 'Error: Division by zero is not allowed';
    ELSE
        RAISE NOTICE 'Division Result = %', (a / b);
    END IF;
END;
$$;

CALL divide_numbers(10, 2);
