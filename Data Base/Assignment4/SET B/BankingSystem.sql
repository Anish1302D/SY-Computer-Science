  CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(40),
    city VARCHAR(30)
);

CREATE TABLE Account (
    acc_id INT PRIMARY KEY,
    cust_id INT,
    acc_type VARCHAR(20),
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

CREATE TABLE Transaction (
    txn_id INT PRIMARY KEY,
    acc_id INT,
    amount INT,
    txn_type VARCHAR(10),   -- 'credit' or 'debit'
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id)
);

INSERT INTO Customer VALUES
(1, 'Amit', 'Pune'),
(2, 'Riya', 'Mumbai'),
(3, 'Sanjay', 'Pune'),
(4, 'Pooja', 'Delhi'),
(5, 'Neeraj', 'Mumbai');

INSERT INTO Account VALUES
(101, 1, 'Savings'),
(102, 1, 'Current'),
(103, 2, 'Savings'),
(104, 3, 'Savings'),
(105, 3, 'Current'),
(106, 4, 'Savings');

INSERT INTO Transaction VALUES
(1001, 101, 50000, 'credit'),
(1002, 102, 30000, 'debit'),
(1003, 103, 70000, 'credit'),
(1004, 101, 60000, 'credit'),
(1005, 104, 15000, 'debit'),
(1006, 105, 40000, 'credit'),
(1007, 106, 25000, 'credit'),
(1008, 103, 20000, 'debit'),
(1009, 105, 80000, 'credit');

SELECT c.cust_name, SUM(t.amount) AS total_credit
FROM Customer c
JOIN Account a ON c.cust_id = a.cust_id
JOIN Transaction t ON a.acc_id = t.acc_id
WHERE t.txn_type = 'credit'
GROUP BY c.cust_name;

SELECT c.cust_name, COUNT(a.acc_id) AS total_accounts
FROM Customer c
JOIN Account a ON c.cust_id = a.cust_id
GROUP BY c.cust_name;

SELECT acc_type, COUNT(*) AS total_accounts
FROM Account
GROUP BY acc_type
HAVING COUNT(*) > 2;

SELECT city, COUNT(*) AS total_customers
FROM Customer
GROUP BY city
HAVING COUNT(*) > 1;

SELECT a.acc_id, SUM(t.amount) AS total_txn_amount
FROM Account a
JOIN Transaction t ON a.acc_id = t.acc_id
GROUP BY a.acc_id
HAVING SUM(t.amount) > 100000;

SELECT c.cust_name, AVG(t.amount) AS avg_amount
FROM Customer c
JOIN Account a ON c.cust_id = a.cust_id
JOIN Transaction t ON a.acc_id = t.acc_id
GROUP BY c.cust_name
HAVING AVG(t.amount) > 10000;
