CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    rate INT,
    age INT
);

CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(30),
    color VARCHAR(15)
);

CREATE TABLE Reserves (
    sid INT,
    bid INT,
    rdate DATE,
    PRIMARY KEY (sid, bid, rdate),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

INSERT INTO Sailors VALUES
(1, 'Peter', 9, 25),
(2, 'Pallavi', 7, 23),
(3, 'Pratap', 8, 27),
(4, 'Pooja', 6, 22),
(5, 'Pritam', 9, 24);

INSERT INTO Boats VALUES
(101, 'Speedster', 'Red'),
(102, 'WaveRider', 'Green'),
(103, 'BlueFin', 'Blue'),
(104, 'Storm', 'Red'),
(105, 'SeaLion', 'Green');

INSERT INTO Reserves VALUES
(1, 101, '2024-01-05'),
(1, 102, '2024-01-10'),
(2, 103, '2024-02-01'),
(5, 104, '2024-02-15'),
(5, 105, '2024-02-20');

SELECT sname, rate
FROM Sailors
WHERE rate > 8;

SELECT sname, age
FROM Sailors
WHERE sname LIKE 'P%P';

SELECT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'Red'
INTERSECT
SELECT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'Green';

