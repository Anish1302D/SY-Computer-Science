USE supplier_student_db;

-- Create Supplier table
CREATE TABLE Supplier (
    supplier_no INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    city CHAR(10),
    phone_no INT,
    bill_amount FLOAT,
    CONSTRAINT city_check CHECK (city IN ('Pune', 'Mumbai', 'Nashik')),
    CONSTRAINT bill_check CHECK (bill_amount > 0)
);

-- Create Student table
CREATE TABLE Student (
    stud_no INT PRIMARY KEY,
    stud_name VARCHAR(50),
    address CHAR(10),
    phone_no INT,
    percentage FLOAT,
    class VARCHAR(10),
    CONSTRAINT class_check CHECK (class IN ('FY', 'SY', 'TY'))
);

-- 1. Insert 5 Suppliers
INSERT INTO Supplier VALUES
(1, 'ABC Traders', 'Pune', 12345, 5000),
(2, 'XYZ Pvt Ltd', 'Mumbai', 23456, 7000),
(3, 'LMN Corp', 'Nashik', 34567, 6000),
(4, 'OPQ Ltd', 'Pune', 45678, 8000),
(5, 'RST Enterprises', 'Mumbai', 56789, 9000);

-- 2. Insert 5 Students
INSERT INTO Student VALUES
(101, 'Ravi', 'Pune', 11111, 45, 'FY'),
(102, 'Sita', 'Mumbai', 22222, 55, 'SY'),
(103, 'Amit', 'Nashik');
