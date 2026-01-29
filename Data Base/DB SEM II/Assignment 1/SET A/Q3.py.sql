CREATE TABLE Department (
    dno INT,
    dname VARCHAR(50),
    empname VARCHAR(50),
    city VARCHAR(30)
);

CREATE OR REPLACE PROCEDURE insert_department(
    p_dno INT,
    p_dname VARCHAR,
    p_empname VARCHAR,
    p_city VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Department
    VALUES (p_dno, p_dname, p_empname, p_city);

    RAISE NOTICE 'Record inserted successfully';
END;
$$;

CALL insert_department(1, 'IT', 'Anish', 'Pune');
CALL insert_department(2, 'HR', 'Rahul', 'Mumbai');
CALL insert_department(3, 'Finance', 'Sneha', 'Pune');

SELECT * FROM Department;

CREATE OR REPLACE PROCEDURE display_pune_employees()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT empname, dname
        FROM Department
        WHERE city = 'Pune'
    LOOP
        RAISE NOTICE 'Employee Name: %, Department: %',
                     rec.empname, rec.dname;
    END LOOP;
END;
$$;
