CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50)
);

CREATE TABLE Marks (
    Mark_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Marks INT,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Students VALUES
(1, 'Aarav'),
(2, 'Riya'),
(3, 'Kabir'),
(4, 'Neha');

INSERT INTO Courses VALUES
(101, 'DBMS'),
(102, 'Python'),
(103, 'Networking');

INSERT INTO Marks VALUES
(1, 1, 101, 95),
(2, 2, 102, 88),
(3, 3, 103, 92),
(4, 4, 101, 76),
(5, 1, 102, 91);

CREATE VIEW Top_Scorers_View AS
SELECT 
    s.Student_Name,
    c.Course_Name,
    m.Marks
FROM Marks m
JOIN Students s 
    ON m.Student_ID = s.Student_ID
JOIN Courses c
    ON m.Course_ID = c.Course_ID
WHERE m.Marks > 90;
