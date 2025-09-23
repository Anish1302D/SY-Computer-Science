CREATE DATABASE companymgmt_db;

\c 

CREATE TABLE Dept(
	dno INT PRIMARY KEY,
	dname VARCHAR(50),
	dloc VARCHAR(50)
);

CREATE TABLE Emp(
	eno INT PRIMARY KEY,
	ename VARCHAR(50),
	designation VARCHAR(50),
	sal FLOAT,
	dno INT,
	FOREIGN KEY (dno) REFERENCES Dept(dno)
);           

INSERT INTO Dept VALUES
(10, 'Sales', 'Pune'),
(20, 'HR', 'Mumbai'),
(30, 'IT', 'Nashik'),
(40, 'Account', 'Delhi'),
(50, 'Marketing', 'Chennai');

SELECT * FROM Dept;

INSERT INTO Emp VALUES
(1, 'Amit', 'Manager', 60000, 10),
(2, 'Ravi', 'Clerk', 23000,10),
(3, 'Sita', 'Manager', 10000, 20),
(4, 'Priya', 'Clerk', 65000,20),
(5, 'Anil', 'Manager', 42000, 30),
(6, 'Kiran', 'Clerk', 35000,30),
(7, 'Rohan', 'Manager', 70000, 40),
(8, 'Arjun', 'Clerk', 35000,40),
(9, 'Anish', 'Manager', 70000, 50),
(10, 'Krishna', 'Clerk', 15000,50);

SELECT * FROM Emp;

UPDATE Emp SET sal = sal * 1.15 WHERE designation = 'Manager';

DELETE FROM Emp WHERE dno = 30;

DELETE FROM  Emp WHERE designation = 'clerk';

UPDATE Dept SET dloc = 'Nashik' WHERE dname = 'Account';

SELECT * FROM Emp;
SELECT * FROM Dept;