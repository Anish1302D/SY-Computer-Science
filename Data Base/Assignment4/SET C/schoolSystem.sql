CREATE TABLE Student (
    stud_id INT PRIMARY KEY,
    stud_name VARCHAR(40),
    class VARCHAR(10),
    city VARCHAR(30)
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(40),
    subject VARCHAR(30)
);

CREATE TABLE Marks (
    stud_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

INSERT INTO Student VALUES
(1, 'Amit', '10A', 'Pune'),
(2, 'Riya', '10A', 'Mumbai'),
(3, 'Sanjay', '10B', 'Pune'),
(4, 'Pooja', '10C', 'Delhi'),
(5, 'Neeraj', '10B', 'Pune'),
(6, 'Meera', '10A', 'Mumbai');

INSERT INTO Teacher VALUES
(101, 'Mr. Sharma', 'Math'),
(102, 'Ms. Rao', 'Science'),
(103, 'Mr. Khan', 'English');

INSERT INTO Marks VALUES
(1, 'Math', 80),
(1, 'Science', 75),
(1, 'English', 82),

(2, 'Math', 60),
(2, 'Science', 55),
(2, 'English', 72),

(3, 'Math', 90),
(3, 'Science', 88),
(3, 'English', 78),

(4, 'Math', 30),
(4, 'Science', 32),
(4, 'English', 28),

(5, 'Math', 70),
(5, 'Science', 65),
(5, 'English', 72),

(6, 'Math', 55),
(6, 'Science', 40),
(6, 'English', 60);

SELECT subject, AVG(marks) AS avg_marks
FROM Marks
GROUP BY subject;

SELECT subject, AVG(marks) AS avg_marks
FROM Marks
GROUP BY subject
HAVING AVG(marks) > 70;

SELECT city, COUNT(*) AS total_students
FROM Student
GROUP BY city
HAVING COUNT(*) > 2;

SELECT t.teacher_name, t.subject, COUNT(m.stud_id) AS total_students
FROM Teacher t
JOIN Marks m ON t.subject = m.subject
GROUP BY t.teacher_name, t.subject;

SELECT s.stud_name, SUM(m.marks) AS total_marks
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id
GROUP BY s.stud_name
HAVING SUM(m.marks) > 250;

SELECT s.class, AVG(m.marks) AS avg_marks
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id
GROUP BY s.class
HAVING AVG(m.marks) < 40;
