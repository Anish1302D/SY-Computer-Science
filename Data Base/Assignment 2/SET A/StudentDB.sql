--A Q1
CREATE DATABASE student_supplier_db;

\c

CREATE TABLE Supplier(
	supplier_no INT,
	supplier_name VARCHAR(50),
	city CHAR(10),
	phone_no INT,
	amount FLOAT,
	PRIMARY KEY (supplier_no)
);

SELECT * FROM Supplier;

ALTER TABLE Supplier
ADD CONSTRAINT city_check
CHECK (city IN ('Pune', 'Mumbai', 'Nashik'));

SELECT * FROM Supplier;

ALTER TABLE Supplier
DROP COLUMN phone_no;

SELECT * FROM Supplier;

ALTER TABLE Supplier
ALTER COLUMN supplier_name TYPE TEXT;

ALTER TABLE Supplier
DROP CONSTRAINT city_check;

DROP TABLE Supplier;

--A Q2

CREATE TABLE Student(
	stud_no INT,
	stud_name VARCHAR(50),
	address CHAR(10),
	phone_no INT,
	percentage FLOAT,
	class VARCHAR(10),
	PRIMARY KEY (stud_no)
);

SELECT * FROM Student;

ALTER TABLE Student
ADD CONSTRAINT per_check
CHECK (percentage > 35);

ALTER TABLE Student
RENAME COLUMN phone_no TO mobile_no;

SELECT * FROM Student;

ALTER TABLE Student
ALTER COLUMN stud_name TYPE TEXT;

ALTER TABLE Student
RENAME TO Student_Master;

SELECT * FROM Student_Master;

ALTER TABLE Student_Master
DROP COLUMN address;

DROP TABLE Student_Master;
DROP TABLE Student;

--BQ1

CREATE TABLE Supplier(
	supplier_no INT,
	supplier_name VARCHAR(50),
	city CHAR(10),
	phone_no INT,
	bill_amount FLOAT,
	PRIMARY KEY (supplier_no),
	CONSTRAINT city_check CHECK(city IN ('Mumbai', 'Pune', 'Nashik')),
	CONSTRAINT bill_check CHECK(bill_amount > 0)
);

CREATE TABLE Student(
	stud_no INT,
	stud_name VARCHAR(50),
	address CHAR(10),
	phone_no INT,
	percentage FLOAT,
	class VARCHAR(10),
	PRIMARY KEY (stud_no),
	CONSTRAINT class_check CHECK (class IN ('FY', 'SY', 'TY'))
);

INSERT INTO Supplier VALUES
(1, 'XYZ Traders', 'Pune', 256987, 67544),
(2, 'ABC Traders', 'Mumbai', 254789, 60000),
(3, 'PQR Traders', 'Nagpur', 2658974, 100000),
(4, 'STU Traders', 'Nashik', 2547896, 85000),
(5, 'GIF Traders', 'Pune', 2547896, 98000);

INSERT INTO Student VALUES
(101, 'Anish', 'Pune', 785964, 85, 'FY'),
(212, 'Rohan', 'Nashik', 587456, 92, 'SY'),
(314, 'Ganesh', 'Thane', 2658955, 68, 'FY'),
(805, 'Sarvesh', 'Mumbai', 254896, 88, 'TY'),
(606, 'Bhavesh', 'Pune', 2584589, 38, 'FY');

UPDATE Supplier SET bill_amount = bill_amount * 1.05;

UPDATE Supplier SET city = 'Nagpur' WHERE city = 'Nashik';

UPDATE Student SET percentage = percentage * 3 WHERE class = 'FY';

SELECT * FROM Supplier;

SELECT * FROM Student;

DELETE FROM Supplier WHERE city = 'Mumbai';
SELECT * FROM Supplier;

DELETE FROM Student WHERE percentage < 40;
SELECT * FROM Student;