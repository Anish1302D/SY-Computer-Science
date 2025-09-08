CREATE DATABASE supplier_student_db;

-- Create Supplier table
CREATE TABLE Supplier (
    supplier_no INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    city CHAR(10),
    phone_no INT,
    amount FLOAT
);

-- 1. Add constraint city_check
ALTER TABLE Supplier
ADD CONSTRAINT city_check CHECK (city IN ('Pune', 'Mumbai', 'Nashik'));

-- 2. Drop column phone_no
ALTER TABLE Supplier DROP COLUMN phone_no;

-- 3. Update datatype of supplier_name to TEXT
ALTER TABLE Supplier ALTER COLUMN supplier_name TYPE TEXT;

-- 4. Remove constraint city_check
ALTER TABLE Supplier DROP CONSTRAINT city_check;

-- 5. Remove Supplier table
DROP TABLE Supplier;
