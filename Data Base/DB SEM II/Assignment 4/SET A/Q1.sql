CREATE TABLE project(
pno INT PRIMARY KEY,
pname CHAR(30),
ptype CHAR(20),
duration INT
);

CREATE TABLE employee(
empno INT PRIMARY KEY,
ename CHAR(20),
joining_date DATE
);

CREATE TABLE project_employee(
pno INT,
empno INT,
start_date DATE,
PRIMARY KEY(pno,empno),
FOREIGN KEY(pno) REFERENCES project(pno),
FOREIGN KEY(empno) REFERENCES employee(empno)
);

INSERT INTO project VALUES
(1,'Library System','Software',12),
(2,'Banking System','Software',18),
(3,'AI Chatbot','AI',10);

INSERT INTO employee VALUES
(101,'Rahul','2022-01-10'),
(102,'Sneha','2021-05-15'),
(103,'Amit','2023-02-12');

INSERT INTO project_employee VALUES
(1,101,'2023-01-01'),
(1,102,'2023-02-01'),
(2,101,'2023-03-01'),
(3,103,'2023-04-01');

CREATE OR REPLACE FUNCTION employees_in_project(pname_input CHAR)
RETURNS VOID AS $$

DECLARE
rec RECORD;
count_emp INT := 0;
proj_id INT;

BEGIN

SELECT pno INTO proj_id
FROM project
WHERE pname = pname_input;

IF proj_id IS NULL THEN
RAISE EXCEPTION 'Invalid Project Name: %',pname_input;
END IF;

FOR rec IN
SELECT e.ename
FROM employee e
JOIN project_employee pe ON e.empno=pe.empno
WHERE pe.pno = proj_id
LOOP

RAISE NOTICE 'Employee: %',rec.ename;
count_emp := count_emp + 1;

END LOOP;

RAISE NOTICE 'Total Employees = %',count_emp;

END;
$$ LANGUAGE plpgsql;

SELECT employees_in_project('Library System');

CREATE OR REPLACE FUNCTION count_projects(emp_no INT)
RETURNS INT AS $$

DECLARE
total INT;

BEGIN

IF NOT EXISTS (SELECT 1 FROM employee WHERE empno=emp_no) THEN
RAISE EXCEPTION 'Invalid Employee Number %',emp_no;
END IF;

SELECT COUNT(*) INTO total
FROM project_employee
WHERE empno = emp_no;

RETURN total;

END;
$$ LANGUAGE plpgsql;

SELECT count_projects(101);