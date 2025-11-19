CREATE TABLE Department (
    dept_no INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    birth_date DATE,
    designation VARCHAR(20) CHECK (designation IN ('manager', 'staff', 'worker')),
    salary DECIMAL(10,2),
    dept_no INT,
    FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Project (
    project_no INT PRIMARY KEY,
    project_name VARCHAR(50),
    status VARCHAR(20)
);

-- Many-to-Many between Employee and Project
CREATE TABLE Works_On (
    emp_no INT,
    project_no INT,
    FOREIGN KEY (emp_no) REFERENCES Employee(emp_no),
    FOREIGN KEY (project_no) REFERENCES Project(project_no)
);

INSERT INTO Department VALUES
(10, 'HR', 'Mumbai'),
(20, 'IT', 'Pune'),
(30, 'Finance', 'Delhi');

INSERT INTO Employee VALUES
(1, 'Amit', 'Street 1', 'Mumbai', '1990-05-10', 'manager', 90000, 10),
(2, 'Riya', 'Lane 5', 'Pune', '1992-07-12', 'staff', 55000, 20),
(3, 'Karan', 'Sector 9', 'Delhi', '1988-03-22', 'worker', 35000, 20),
(4, 'Meera', 'MG Road', 'Mumbai', '1995-01-17', 'staff', 60000, 30),
(5, 'Sahil', 'Park Ave', 'Pune', '1993-11-03', 'worker', 30000, 10);

INSERT INTO Project VALUES
(101, 'Payroll System', 'ongoing'),
(102, 'Mobile App', 'completed'),
(103, 'Website Upgrade', 'ongoing'),
(104, 'Audit Prep', 'pending'),
(105, 'AI Integration', 'ongoing');

INSERT INTO Works_On VALUES
(1, 101),
(2, 102),
(2, 103),
(3, 103),
(4, 104),
(5, 105);

SELECT *
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

DELETE FROM Employee
WHERE dept_no = 20;

SELECT emp_name, salary
FROM Employee
ORDER BY salary DESC;
