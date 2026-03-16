CREATE TABLE train(
train_no INT PRIMARY KEY,
train_name VARCHAR(20),
depart_time TIME,
arrival_time TIME,
source_stn VARCHAR(20),
dest_stn VARCHAR(20),
no_of_res_bogies INT,
bogie_capacity INT
);

CREATE TABLE passenger(
passenger_id INT PRIMARY KEY,
passenger_name VARCHAR(20),
address VARCHAR(30),
age INT,
gender CHAR
);

CREATE TABLE ticket(
train_no INT,
passenger_id INT,
ticket_no INT,
bogie_no INT,
no_of_berths INT,
tdate DATE,
ticket_amt DECIMAL(7,2),
status CHAR
);

INSERT INTO train VALUES
(101,'Deccan Express','08:00','12:00','Pune','Mumbai',5,72),
(102,'Intercity','09:30','14:30','Pune','Nashik',4,72);

INSERT INTO passenger VALUES
(1,'Rahul','Pune',25,'M'),
(2,'Sneha','Mumbai',23,'F');

INSERT INTO ticket VALUES
(101,1,5001,2,2,'2024-05-10',1500,'C'),
(101,2,5002,3,1,'2024-05-10',750,'W');

CREATE OR REPLACE FUNCTION confirmed_booking(date_input DATE)
RETURNS VOID AS $$

DECLARE
rec RECORD;

BEGIN

IF date_input IS NULL THEN
RAISE EXCEPTION 'Invalid Date';
END IF;

FOR rec IN
SELECT t.train_name,p.passenger_name
FROM train t
JOIN ticket tk ON t.train_no=tk.train_no
JOIN passenger p ON p.passenger_id=tk.passenger_id
WHERE tk.status='C' AND tk.tdate=date_input
LOOP

RAISE NOTICE 'Train: %, Passenger: %',
rec.train_name,rec.passenger_name;

END LOOP;

END;
$$ LANGUAGE plpgsql;

SELECT confirmed_booking('2024-05-10');

CREATE OR REPLACE FUNCTION passenger_ticket(pname VARCHAR,pdate DATE)
RETURNS VOID AS $$

DECLARE
rec RECORD;

BEGIN

SELECT no_of_berths,ticket_amt INTO rec
FROM ticket tk
JOIN passenger p ON tk.passenger_id=p.passenger_id
WHERE p.passenger_name=pname AND tk.tdate=pdate;

IF rec IS NULL THEN
RAISE EXCEPTION 'Invalid Passenger Name';
END IF;

RAISE NOTICE 'Berths: %, Amount: %',
rec.no_of_berths,rec.ticket_amt;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION train_ticket_details(tname VARCHAR)
RETURNS VOID AS $$

DECLARE
rec RECORD;

BEGIN

IF NOT EXISTS (SELECT 1 FROM train WHERE train_name=tname) THEN
RAISE EXCEPTION 'Invalid Train Name';
END IF;

FOR rec IN
SELECT ticket_no,passenger_id
FROM ticket tk
JOIN train t ON tk.train_no=t.train_no
WHERE t.train_name=tname
LOOP

RAISE NOTICE 'Ticket No: %, Passenger ID: %',
rec.ticket_no,rec.passenger_id;

END LOOP;

END;
$$ LANGUAGE plpgsql;