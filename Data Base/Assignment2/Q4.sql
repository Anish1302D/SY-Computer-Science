CREATE DATABASE company_mgmt_db;

USE company_mgmt_db;

-- Create Dept table
CREATE TABLE Dept (
    dno INT PRIMARY KEY,
    dname VARCHAR(50),
    dloc VARCHAR(50)
);

-- Create Emp table with foreign key
CREATE TABLE Emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(50),
    designation VARCHAR(50),
    sal FLOAT,
    dno INT,
    FOREIGN KEY (dno) REFERENCES Dept(dno)
);

-- 1. Insert 5 departments
INSERT INTO Dept VALUES
(10, 'Sales', 'Pune'),
(20, 'HR', 'Mumbai'),
(30, 'IT', 'Nashik'),
(40, 'Account', 'Delhi'),
(50, 'Marketing', 'Chennai');

-- 2. Insert 2 employees per dept
INSERT INTO Emp VALUES
(1, 'Amit', 'Manager', 60000, 10),
(2, 'Ravi', 'Clerk', 25000, 10),
(3, 'Sita', 'Manager', 65000, 20),
(4, 'Priya', 'Clerk', 27000, 20),
(5, 'Anil', 'Manager', 70000, 30),
(6, 'Kiran', 'Clerk', 26000, 30),
(7, 'Sunita', 'Manager', 72000, 40),
(8, 'Arjun', 'Clerk', 24000, 40),
(9, 'Vikas', 'Manager', 75000, 50),
(10, 'Neha', 'Clerk', 23000, 50);

-- 3. Increase salary of managers by 15%
UPDATE Emp SET sal = sal * 1.15 WHERE designation = 'Manager';

-- 4. Delete all employees of dept 30
DELETE FROM Emp WHERE dno = 30;

-- 5. Delete all employees who are clerks
DELETE FROM Emp WHERE designation = 'Clerk';

-- 6. Change location of Account dept to Nashik
UPDATE Dept SET dloc = 'Nashik' WHERE dname = 'Account';
