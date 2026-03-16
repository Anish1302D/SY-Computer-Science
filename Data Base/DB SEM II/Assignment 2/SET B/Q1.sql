CREATE TABLE branch(
bid INT PRIMARY KEY,
brname CHAR(30),
brcity CHAR(10)
);

CREATE TABLE customer(
cno INT PRIMARY KEY,
cname CHAR(20),
caddr CHAR(35),
city CHAR(20)
);

CREATE TABLE loan_application(
lno INT PRIMARY KEY,
lamtrequired MONEY,
lamtapproved MONEY,
l_date DATE
);

CREATE TABLE ternary(
bid INT,
cno INT,
lno INT,
PRIMARY KEY(bid,cno,lno),
FOREIGN KEY(bid) REFERENCES branch(bid),
FOREIGN KEY(cno) REFERENCES customer(cno),
FOREIGN KEY(lno) REFERENCES loan_application(lno)
);

INSERT INTO branch VALUES
(1,'SBI Pune','Pune'),
(2,'HDFC Mumbai','Mumbai'),
(3,'ICICI Nashik','Nashik');

INSERT INTO customer VALUES
(101,'Rahul Patil','Karve Nagar Pune','Pune'),
(102,'Sneha Joshi','Dadar Mumbai','Mumbai'),
(103,'Amit Kulkarni','College Road Nashik','Nashik'),
(104,'Priya Deshmukh','Kothrud Pune','Pune'),
(105,'Rohan Shah','Andheri Mumbai','Mumbai');

INSERT INTO loan_application VALUES
(201,300000,250000,'2024-01-10'),
(202,150000,140000,'2024-02-15'),
(203,500000,450000,'2024-03-20'),
(204,200000,180000,'2024-04-12'),
(205,350000,300000,'2024-05-05');

INSERT INTO ternary VALUES
(1,101,201),
(1,104,204),
(2,102,202),
(2,105,205),
(3,103,203);

SELECT 
b.brname,
c.cname,
l.lamtrequired,
l.lamtapproved,
l.l_date
FROM ternary t
JOIN branch b ON t.bid=b.bid
JOIN customer c ON t.cno=c.cno
JOIN loan_application l ON t.lno=l.lno;

CREATE OR REPLACE FUNCTION total_customers_branch(bname CHAR)
RETURNS INT AS $$

DECLARE
total INT;

BEGIN

SELECT COUNT(*) INTO total
FROM ternary t
JOIN branch b ON t.bid=b.bid
WHERE b.brname=bname;

RETURN total;

END;
$$ LANGUAGE plpgsql;

SELECT total_customers_branch('SBI Pune');

CREATE OR REPLACE FUNCTION min_loan_approved()
RETURNS MONEY AS $$

DECLARE
min_amt MONEY;

BEGIN

SELECT MIN(lamtapproved) INTO min_amt
FROM loan_application;

RETURN min_amt;

END;
$$ LANGUAGE plpgsql;

SELECT min_loan_approved();

CREATE OR REPLACE FUNCTION loan_above(amount MONEY)
RETURNS INT AS $$

DECLARE
count_val INT;

BEGIN

SELECT COUNT(*) INTO count_val
FROM loan_application
WHERE lamtrequired > amount;

RETURN count_val;

END;
$$ LANGUAGE plpgsql;

SELECT loan_above(200000);