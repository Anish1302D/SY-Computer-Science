CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(40),
    designation VARCHAR(30),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    product_name VARCHAR(40),
    quantity_sold INT,
    sale_amount INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

INSERT INTO Department VALUES
(10, 'HR'),
(20, 'Sales'),
(30, 'Finance'),
(40, 'IT');

INSERT INTO Employee VALUES
(1, 'Amit', 'Manager', 60000, 20),
(2, 'Riya', 'Executive', 35000, 20),
(3, 'Karan', 'Analyst', 40000, 30),
(4, 'Neha', 'Developer', 45000, 40),
(5, 'Sanjay', 'Executive', 30000, 20),
(6, 'Pooja', 'HR Assistant', 25000, 10);

INSERT INTO Sales VALUES
(101, 1, 'Laptop', 5, 250000),
(102, 2, 'Mouse', 20, 20000),
(103, 1, 'Monitor', 8, 80000),
(104, 5, 'Keyboard', 15, 30000),
(105, 2, 'Printer', 3, 45000),
(106, 3, 'Software', 12, 60000);

SELECT e.emp_name, SUM(s.sale_amount) AS total_sales
FROM Employee e
JOIN Sales s ON e.emp_id = s.emp_id
GROUP BY e.emp_name;

SELECT d.dept_name, SUM(s.sale_amount) AS dept_sales
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
JOIN Sales s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Department d
JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 3;

SELECT e.emp_name, s.product_name, s.quantity_sold
FROM Employee e
JOIN Sales s ON e.emp_id = s.emp_id
WHERE s.quantity_sold > 10;

SELECT designation, AVG(salary) AS avg_salary
FROM Employee
GROUP BY designation
HAVING AVG(salary) > 30000;

SELECT e.emp_name, SUM(s.sale_amount) AS total_sales
FROM Employee e
JOIN Sales s ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING SUM(s.sale_amount) > 50000;
