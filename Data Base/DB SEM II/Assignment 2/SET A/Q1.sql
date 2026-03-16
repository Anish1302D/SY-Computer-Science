--1
CREATE OR REPLACE FUNCTION min_max_two(a INT, b INT)
RETURNS TEXT AS $$
DECLARE
    min_val INT;
    max_val INT;
BEGIN
    IF a > b THEN
        max_val := a;
        min_val := b;
    ELSE
        max_val := b;
        min_val := a;
    END IF;

    RETURN 'Minimum = ' || min_val || ', Maximum = ' || max_val;
END;
$$ LANGUAGE plpgsql;

SELECT min_max_two(10,20);


--2
CREATE OR REPLACE FUNCTION check_number(n INT)
RETURNS TEXT AS $$
BEGIN
    IF n > 0 THEN
        RETURN 'Positive Number';
    ELSIF n < 0 THEN
        RETURN 'Negative Number';
    ELSE
        RETURN 'Zero';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT check_number(-1);

--3
CREATE OR REPLACE FUNCTION max_min_three(a INT,b INT,c INT)
RETURNS TEXT AS $$
DECLARE
max_val INT;
min_val INT;
BEGIN

max_val := GREATEST(a,b,c);
min_val := LEAST(a,b,c);

RETURN 'Maximum = '||max_val||' Minimum = '||min_val;

END;
$$ LANGUAGE plpgsql;

SELECT max_min_three(10,20,5);


--4
CREATE OR REPLACE FUNCTION even_odd(n INT)
RETURNS TEXT AS $$
BEGIN
    IF n % 2 = 0 THEN
        RETURN 'Even Number';
    ELSE
        RETURN 'Odd Number';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT even_odd(11);


--5
CREATE OR REPLACE FUNCTION sum_20()
RETURNS INT AS $$
DECLARE
    i INT := 1;
    s INT := 0;
BEGIN
    LOOP
        s := s + i;
        i := i + 1;

        EXIT WHEN i > 20;
    END LOOP;

    RETURN s;
END;
$$ LANGUAGE plpgsql;

SELECT sum_20();


--6
CREATE OR REPLACE FUNCTION even_1_50()
RETURNS TEXT AS $$
DECLARE
    i INT;
    result TEXT := '';
BEGIN
    FOR i IN 1..50 LOOP
        IF i % 2 = 0 THEN
            result := result || i || ' ';
        END IF;
    END LOOP;

    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT even_1_50();

--7
CREATE OR REPLACE FUNCTION sum_avg(n INT)
RETURNS TEXT AS $$
DECLARE
i INT := 1;
s INT := 0;
avg_val NUMERIC;
BEGIN

WHILE i <= n LOOP
    s := s + i;
    i := i + 1;
END LOOP;

avg_val := s::NUMERIC / n;

RETURN 'Sum='||s||' Average='||avg_val;

END;
$$ LANGUAGE plpgsql;

SELECT sum_avg(10);

--8
CREATE OR REPLACE FUNCTION count_odd(m INT,n INT)
RETURNS INT AS $$
DECLARE
i INT;
count_val INT :=0;

BEGIN

FOR i IN m..n LOOP
    IF i % 2 <> 0 THEN
        count_val := count_val + 1;
    END IF;
END LOOP;

RETURN count_val;

END;
$$ LANGUAGE plpgsql;

SELECT min_max_two(5,3);

--9
CREATE OR REPLACE FUNCTION search_range(num INT,start_val INT,end_val INT)
RETURNS TEXT AS $$

BEGIN

IF num BETWEEN start_val AND end_val THEN
    RETURN 'Number is in range';
ELSE
    RETURN 'Number is not in range';
END IF;

END;
$$ LANGUAGE plpgsql;

SELECT min_max_two(10,1,20);

--10
CREATE OR REPLACE FUNCTION number_word(n INT)
RETURNS TEXT AS $$
DECLARE
result TEXT;

BEGIN

CASE n
WHEN 1 THEN result := 'One';
WHEN 2 THEN result := 'Two';
WHEN 3 THEN result := 'Three';
WHEN 4 THEN result := 'Four';
WHEN 5 THEN result := 'Five';
ELSE result := 'Number not in range';
END CASE;

RETURN result;

END;
$$ LANGUAGE plpgsql;

SELECT min_max_two(4);