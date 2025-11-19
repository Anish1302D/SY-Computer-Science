CREATE TABLE competition (
    C_no INT PRIMARY KEY,
    Name CHAR(20),
    type CHAR(15),
    No_of_participants INT,
    cdate DATE,
    budget FLOAT
);


INSERT INTO competition 
(C_no, Name, type, No_of_participants, cdate, budget) 
VALUES
(1, 'Math Olympiad', 'academics', 120, '2024-01-15', 50000),
(2, 'Science Quiz', 'academics', 80, '2023-12-10', 35000),
(3, 'Football Tournament', 'sport', 150, '2024-02-20', 120000),
(4, 'Chess Championship', 'sport', 60, '2024-07-05', 20000),
(5, 'Dance Fiesta', 'cultural', 90, '2023-11-15', 45000),
(6, 'Art Exhibition', 'cultural', 70, '2024-03-18', 30000),
(7, 'Coding Hackathon', 'academics', 110, '2024-04-10', 80000),
(8, 'Cricket League', 'sport', 200, '2023-02-25', 150000),
(9, 'Debate Competition', 'academics', 55, '2024-08-12', 15000),
(10, 'Yoga Day Event', 'sport', 95, '2024-06-21', 25000);

SELECT * FROM competition;

SELECT Name FROM competition
WHERE EXTRACT(YEAR FROM cdate) = 2024;

SELECT COUNT(*) AS total_sport_competitions FROM competition
WHERE type = 'sport';

SELECT MAX(No_of_participants) AS max_participants FROM competition;

SELECT Name FROM competition
WHERE budget = (SELECT MIN(budget) FROM competition);

SELECT type, COUNT(*) AS total_competitions FROM competition
GROUP BY type;