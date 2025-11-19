CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Credits INT
);

INSERT INTO Courses VALUES
(101, 'Database Systems', 4),
(102, 'Operating Systems', 3),
(103, 'Computer Networks', 3),
(104, 'Data Structures', 4),
(105, 'Artificial Intelligence', 3);

CREATE VIEW Course_View AS
SELECT Course_ID, Course_Name
FROM Courses;

SELECT * FROM Course_View;
