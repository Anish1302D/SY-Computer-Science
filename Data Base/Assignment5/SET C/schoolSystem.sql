CREATE TABLE Student(
    stud_id INT PRIMARY KEY,
    stud_name VARCHAR(50),
    class VARCHAR(10),
    city VARCHAR(50)
);

CREATE TABLE Teacher(
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50),
    subject VARCHAR(30)
);

CREATE TABLE Marks(
    stud_id INT,
    subject VARCHAR(30),
    marks INT,
    FOREIGN KEY (stud_id) REFERENCES Student(stud_id)
);

INSERT INTO Student VALUES
(1, 'Amit', '10A', 'Mumbai'),
(2, 'Riya', '10A', 'Pune'),
(3, 'Kabir', '9B', 'Delhi'),
(4, 'Meera', '9A', 'Mumbai'),
(5, 'Sahil', '10B', 'Pune'),
(10, 'Ananya', '10A', 'Delhi');

INSERT INTO Teacher VALUES
(101, 'Mr. Sharma', 'Maths'),
(102, 'Mrs. Desai', 'Science'),
(103, 'Mr. Verma', 'English');

INSERT INTO Marks VALUES
(1, 'Maths', 85),
(1, 'Science', 78),
(2, 'Maths', 92),
(3, 'English', 67),
(5, 'Science', 45),
(10, 'Maths', 56);

SELECT s.stud_name, m.subject
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id;

SELECT s.stud_name
FROM Student s
WHERE EXISTS(
    SELECT 1 FROM Marks m 
    WHERE m.stud_id = s.stud_id
);

SELECT DISTINCT s.stud_name
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id
WHERE m.marks > ANY(
    SELECT marks FROM Marks WHERE stud_id = 10
);

SELECT DISTINCT s.stud_name
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id
WHERE m.marks > ALL(
    SELECT marks FROM Marks WHERE stud_id = 5
);

SELECT DISTINCT s.stud_name
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id
WHERE m.subject = (
    SELECT subject 
    FROM Teacher 
    WHERE teacher_name = 'Mr. Sharma'
);

SELECT s.stud_name
FROM Student s
JOIN Marks m ON s.stud_id = m.stud_id
GROUP BY s.stud_id, s.stud_name
HAVING COUNT(m.subject) > 1;
