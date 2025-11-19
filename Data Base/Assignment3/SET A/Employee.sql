CREATE TABLE Employee (
    empno INTEGER PRIMARY KEY,
    name VARCHAR(50),
    age INTEGER,
    address VARCHAR(100),
    salary NUMERIC(10,2),
    deptno INTEGER
);

INSERT INTO Employee (empno, name, age, address, salary, deptno) VALUES
(101, 'Sanjay Patil', 28, 'Pune', 52000, 5),
(102, 'Amit Nitre', 32, 'Mumbai', 48000, 3),
(103, 'Sunita More', 26, 'Pune', 60000, 5),
(104, 'Rohit Nitin', 30, 'Nashik', 45000, 2),
(105, 'Sneha Kulkarni', 29, 'Pune', 70000, 4),
(106, 'Nikita Sharma', 24, 'Nagpur', 39000, 5),
(107, 'Suresh Pawar', 36, 'Pune', 51000, 3),
(108, 'Anita Joshi', 33, 'Thane', 55000, 4),
(109, 'Sagar Deshmukh', 27, 'Pune', 47000, 2),
(110, 'Pranit Wagh', 31, 'Mumbai', 64000, 5);

SELECT * FROM Employee;

SELECT * FROM Employee
WHERE deptno = 5;

SELECT * FROM Employee
WHERE address = 'Pune'
  AND salary > 50000;

SELECT * FROM Employee
WHERE age BETWEEN 25 AND 35;

SELECT empno, name FROM Employee
WHERE name LIKE 'S%';

SELECT * FROM Employee
WHERE name LIKE '%nit%';

SELECT MAX(salary) AS max_salary FROM Employee;

SELECT AVG(salary) AS avg_salary FROM Employee;
