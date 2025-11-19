CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department_ID INT
);

CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50)
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO Employees VALUES
(101, 'Aarav Mehta', 3),
(102, 'Riya Sharma', 1),
(103, 'Kabir Patel', 3),
(104, 'Neha Gupta', 2),
(105, 'Ishan Singh', 3);

CREATE VIEW Dept_Employee_View AS
SELECT 
    e.Employee_Name,
    d.Department_Name
FROM Employees e
JOIN Departments d
    ON e.Department_ID = d.Department_ID
WHERE d.Department_Name = 'IT';
