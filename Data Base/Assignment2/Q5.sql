CREATE DATABASE sales_client_db;

USE sales_client_db;

-- Create Client table
CREATE TABLE Client (
    client_no VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

-- Create Sales_order table with foreign key
CREATE TABLE Sales_order (
    s_order_no INT PRIMARY KEY,
    s_order_date DATE,
    client_no VARCHAR(10),
    FOREIGN KEY (client_no) REFERENCES Client(client_no)
);

-- 1. Insert 2 client records
INSERT INTO Client VALUES
('C001', 'Ravi', 'Pune'),
('C004', 'Sita', 'Mumbai');

-- 2. Insert 3 sales records for each client
INSERT INTO Sales_order VALUES
(101, '2024-09-15', 'C001'),
(102, '2024-10-05', 'C001'),
(103, '2024-12-10', 'C001'),
(104, '2025-06-01', 'C004'),
(105, '2025-06-10', 'C004'),
(106, '2025-07-01', 'C004');

-- Change order date of client_no C004 to 12/6/2025
UPDATE Sales_order 
SET s_order_date = '2025-06-12' 
WHERE client_no = 'C004';

-- 3. Delete sales records before 10/09/2024
DELETE FROM Sales_order WHERE s_order_date < '2024-09-10';

-- 4. Delete client who lives in Mumbai
DELETE FROM Client WHERE address = 'Mumbai';
