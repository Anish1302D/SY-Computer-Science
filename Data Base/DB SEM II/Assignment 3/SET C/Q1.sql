CREATE TABLE area(
aid INT PRIMARY KEY,
aname VARCHAR(20),
area_type VARCHAR(5)
);

CREATE TABLE person(
pno INT PRIMARY KEY,
name VARCHAR(20),
birthdate DATE,
income MONEY,
aid INT,
FOREIGN KEY(aid) REFERENCES area(aid)
);

INSERT INTO area VALUES
(1,'Pune','urban'),
(2,'Mumbai','urban'),
(3,'Satara','rural');

INSERT INTO person VALUES
(1,'Rahul','1999-05-12',70000,1),
(2,'Sneha','2000-05-22',55000,2),
(3,'Amit','1998-07-10',45000,3),
(4,'Priya','1997-05-30',90000,1);

CREATE OR REPLACE FUNCTION birthday_month(m INT)
RETURNS VOID AS $$

DECLARE
rec RECORD;

cur CURSOR FOR
SELECT name,birthdate
FROM person
WHERE EXTRACT(MONTH FROM birthdate)=m;

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Name: %, Birthdate: %',rec.name,rec.birthdate;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;

SELECT birthday_month(5);

CREATE OR REPLACE FUNCTION persons_urban()
RETURNS VOID AS $$

DECLARE
rec RECORD;

cur CURSOR FOR
SELECT p.name
FROM person p
JOIN area a ON p.aid=a.aid
WHERE a.area_type='urban';

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Person: %',rec.name;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;

SELECT persons_urban();

CREATE OR REPLACE FUNCTION income_range()
RETURNS VOID AS $$

DECLARE
rec RECORD;

cur CURSOR FOR
SELECT name,income
FROM person
WHERE income BETWEEN 50000 AND 100000;

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Name: %, Income: %',rec.name,rec.income;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;

SELECT income_range();