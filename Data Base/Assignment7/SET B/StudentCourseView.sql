CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Class VARCHAR(10),
    City VARCHAR(50)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    Enroll_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Students VALUES
(1, 'Amit', '10A', 'Mumbai'),
(2, 'Riya', '10B', 'Pune'),
(3, 'Kabir', '9A', 'Delhi');

INSERT INTO Courses VALUES
(101, 'Database Systems', 4),
(102, 'Operating Systems', 3),
(103, 'Data Structures', 4);

INSERT INTO Enrollments VALUES
(1, 1, 101),   -- Amit → Database Systems
(2, 1, 102),   -- Amit → Operating Systems
(3, 2, 103),   -- Riya → Data Structures
(4, 3, 101);   -- Kabir → Database Systems

CREATE VIEW Student_Course_View AS
SELECT 
    S.Student_Name,
    C.Course_Name
FROM Students S
JOIN Enrollments E ON S.Student_ID = E.Student_ID
JOIN Courses C ON E.Course_ID = C.Course_ID;

SELECT * FROM Student_Course_View;
