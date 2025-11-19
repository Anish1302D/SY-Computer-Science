CREATE TABLE Emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    address VARCHAR(100),
    bdate DATE
);

CREATE TABLE Investor (
    inv_no INT PRIMARY KEY,
    inv_name VARCHAR(50),
    inv_date DATE,
    inv_amt DECIMAL(12,2)
);

-- Mapping table for employees who invest
CREATE TABLE Investor_Emp (
    inv_no INT,
    emp_id INT,
    FOREIGN KEY (inv_no) REFERENCES Investor(inv_no),
    FOREIGN KEY (emp_id) REFERENCES Emp(emp_id)
);

INSERT INTO Emp VALUES
(1, 'Amit', 'Mumbai', '1990-04-12'),
(2, 'Riya', 'Pune', '1988-09-21'),
(3, 'Karan', 'Delhi', '1993-01-05'),
(4, 'Meera', 'Mumbai', '1995-11-20');

INSERT INTO Investor VALUES
(101, 'Amit', '2024-01-15', 50000),
(102, 'Riya', '2024-02-10', 75000),
(103, 'Sanjay', '2024-03-05', 90000),
(104, 'Neha', '2024-03-22', 40000);

INSERT INTO Investor_Emp VALUES
(101, 1),  -- Amit is employee + investor
(102, 2);  -- Riya is employee + investor
-- Sanjay (103) & Neha (104) are not employees → NOT added

SELECT DISTINCT emp_name AS customer_name 
FROM Emp
UNION
SELECT DISTINCT inv_name 
FROM Investor;

SELECT emp_name 
FROM Emp
UNION ALL
SELECT inv_name
FROM Investor;

SELECT e.emp_name
FROM Emp e
JOIN Investor_Emp ie ON e.emp_id = ie.emp_id;

SELECT e.emp_name
FROM Emp e
WHERE e.emp_id NOT IN (
    SELECT emp_id FROM Investor_Emp
);
