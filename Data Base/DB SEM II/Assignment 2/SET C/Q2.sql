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
(1,'Library Management','Software',12),
(2,'Banking System','Software',18),
(3,'AI Chatbot','AI',10),
(4,'E-Commerce Website','Web',14),
(5,'Network Monitoring','Networking',8);

INSERT INTO employee VALUES
(101,'Rahul Patil','2022-01-15'),
(102,'Sneha Joshi','2021-08-10'),
(103,'Amit Kulkarni','2023-02-12'),
(104,'Priya Deshmukh','2020-11-20'),
(105,'Rohan Shah','2022-06-05');

INSERT INTO project_employee VALUES
(1,101,'2023-01-01'),
(1,102,'2023-02-01'),
(2,103,'2023-03-15'),
(2,104,'2023-04-10'),
(3,101,'2023-05-01'),
(3,105,'2023-06-01'),
(4,102,'2023-07-01'),
(5,103,'2023-08-01');

SELECT 
e.ename,
p.pname,
p.ptype,
p.duration,
pe.start_date
FROM employee e
JOIN project_employee pe ON e.empno = pe.empno
JOIN project p ON p.pno = pe.pno;

CREATE OR REPLACE FUNCTION project_by_type(pt CHAR)
RETURNS TABLE(project_name CHAR) AS $$

BEGIN

RETURN QUERY
SELECT pname
FROM project
WHERE ptype = pt;

END;
$$ LANGUAGE plpgsql;

SELECT * FROM project_by_type('Software');

CREATE OR REPLACE FUNCTION employee_project_details(emp_name CHAR)
RETURNS TABLE(project_name CHAR,project_type CHAR,duration INT) AS $$

BEGIN

RETURN QUERY
SELECT p.pname,p.ptype,p.duration
FROM project p
JOIN project_employee pe ON p.pno = pe.pno
JOIN employee e ON e.empno = pe.empno
WHERE e.ename = emp_name;

END;
$$ LANGUAGE plpgsql;

SELECT * FROM employee_project_details('Rahul Patil');

CREATE OR REPLACE FUNCTION employees_in_project(project_name CHAR)
RETURNS INT AS $$

DECLARE
total INT;

BEGIN

SELECT COUNT(*) INTO total
FROM project p
JOIN project_employee pe ON p.pno = pe.pno
WHERE p.pname = project_name;

RETURN total;

END;
$$ LANGUAGE plpgsql;

SELECT employees_in_project('Library Management');