CREATE OR REPLACE PROCEDURE calc_operations(a INT, b INT, c INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Addition = %', (a + b + c);
    RAISE NOTICE 'Subtraction = %', (a - b - c);
    RAISE NOTICE 'Multiplication = %', (a * b * c);
END;
$$;

CALL calc_operations(10, 5, 2);