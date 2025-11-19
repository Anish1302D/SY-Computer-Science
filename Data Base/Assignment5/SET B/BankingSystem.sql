CREATE TABLE Customer(
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Account(
    acc_id INT PRIMARY KEY,
    cust_id INT,
    acc_type VARCHAR(20),
    FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

CREATE TABLE Transaction(
    txn_id INT PRIMARY KEY,
    acc_id INT,
    amount FLOAT,
    txn_type VARCHAR(20),
    FOREIGN KEY (acc_id) REFERENCES Account(acc_id)
);

INSERT INTO Customer VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Priya', 'Pune'),
(3, 'Rohan', 'Delhi'),
(4, 'Meera', 'Mumbai'),
(5, 'Kunal', 'Pune');

INSERT INTO Account VALUES
(101, 1, 'Savings'),
(102, 1, 'Current'),
(103, 2, 'Savings'),
(104, 3, 'Current'),
(105, 4, 'Savings');

INSERT INTO Transaction VALUES
(1, 101, 5000, 'Credit'),
(2, 101, 2000, 'Debit'),
(3, 102, 8000, 'Credit'),
(4, 103, 12000, 'Credit'),
(5, 104, 3000, 'Debit'),
(6, 105, 7000, 'Credit');

SELECT c.cust_name, a.acc_type
FROM Customer c
JOIN Account a ON c.cust_id = a.cust_id;

SELECT c.cust_name
FROM Customer c
WHERE EXISTS(
    SELECT 1 
    FROM Account a 
    JOIN Transaction t ON a.acc_id = t.acc_id
    WHERE a.cust_id = c.cust_id
);

SELECT a.acc_id
FROM Account a
JOIN Transaction t ON a.acc_id = t.acc_id
GROUP BY a.acc_id;

SELECT a.acc_id
FROM Account a
JOIN Transaction t ON a.acc_id = t.acc_id
GROUP BY a.acc_id
HAVING SUM(t.amount) > ANY(
    SELECT SUM(t.amount)
    FROM Account a2
    JOIN Transaction t ON a2.acc_id = t.acc_id
    WHERE a2.cust_id = (
        SELECT cust_id FROM Customer WHERE cust_name = 'Amit'
    )
    GROUP BY a2.acc_id
);

SELECT c.cust_name
FROM Customer c
WHERE (
    SELECT AVG(t.amount)
    FROM Account a 
    JOIN Transaction t ON a.acc_id = t.acc_id
    WHERE a.cust_id = c.cust_id
) > ALL (
    SELECT AVG(t.amount)
    FROM Account a2
    JOIN Transaction t ON a2.acc_id = t.acc_id
    WHERE a2.cust_id = (
        SELECT cust_id FROM Customer WHERE cust_name = 'Priya'
    )
    GROUP BY a2.cust_id
);

SELECT DISTINCT a.acc_id
FROM Account a
JOIN Transaction t ON a.acc_id = t.acc_id
WHERE t.txn_type IN (
    SELECT txn_type
    FROM Transaction
    WHERE acc_id = 101
);

SELECT c.cust_name
FROM Customer c
JOIN Account a ON c.cust_id = a.cust_id
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(a.acc_id) > 1;
