CREATE TABLE Employee(
    emp_id INT,
    emp_name VARCHAR(50),
    designation VARCHAR(50),
    salary INT,
    dept_id INT
);

CREATE TABLE Department(
    dept_id INT,
    dept_name VARCHAR(50)
);

CREATE TABLE Sales(
    sale_id INT,
    emp_id INT,
    product_name VARCHAR(50),
    quantity_sold INT,
    sale_amount INT
);

INSERT INTO Department VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Sales'),
(4, 'IT'),
(5, 'Marketing');

INSERT INTO Employee VALUES
(101, 'John', 'Manager', 90000, 3),
(102, 'Meera', 'Executive', 45000, 2),
(103, 'Rahul', 'Clerk', 30000, 2),
(104, 'Aisha', 'Developer', 60000, 4),
(105, 'Karan', 'Sales Executive', 35000, 3),
(106, 'Sara', 'Marketing Lead', 70000, 5),
(107, 'Vikram', 'HR Executive', 40000, 1);

INSERT INTO Sales VALUES
(1, 101, 'Laptop', 5, 250000),
(2, 105, 'Laptop', 2, 90000),
(3, 105, 'Mobile', 10, 150000),
(4, 106, 'Tablet', 3, 60000),
(5, 101, 'Mobile', 4, 80000),
(6, 102, 'Calculator', 20, 40000);

SELECT E.emp_name, D.dept_name
FROM Employee E
JOIN Department D ON E.dept_id = D.dept_id;

SELECT emp_name
FROM Employee E
WHERE EXISTS (
    SELECT 1
    FROM Sales S
    WHERE S.emp_id = E.emp_id
);

SELECT emp_name, salary
FROM Employee
WHERE salary > ANY (
    SELECT salary
    FROM Employee
    WHERE dept_id = 2
);

SELECT emp_name, salary
FROM Employee
WHERE salary > ALL (
    SELECT salary
    FROM Employee
    WHERE dept_id = 5
);

SELECT DISTINCT E.emp_name
FROM Employee E
JOIN Sales S ON E.emp_id = S.emp_id
WHERE S.product_name IN (
    SELECT product_name
    FROM Sales S2
    JOIN Employee E2 ON S2.emp_id = E2.emp_id
    WHERE E2.emp_name = 'John'
)
AND E.emp_name <> 'John';

SELECT E.emp_name
FROM Employee E
JOIN Sales S ON E.emp_id = S.emp_id
GROUP BY E.emp_name
HAVING COUNT(DISTINCT S.product_name) > 1;
