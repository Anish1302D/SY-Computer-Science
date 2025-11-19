CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50)
);

CREATE TABLE Attendance (
    Attendance_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Attendance_Status VARCHAR(10),   -- 'Present' or 'Absent'
    Attendance_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

INSERT INTO Students VALUES
(1, 'Aarav'),
(2, 'Riya'),
(3, 'Kabir');

INSERT INTO Courses VALUES
(101, 'DBMS'),
(102, 'Python');

INSERT INTO Attendance VALUES
(1, 1, 101, 'Present', '2025-01-01'),
(2, 1, 101, 'Absent',  '2025-01-02'),
(3, 1, 101, 'Present', '2025-01-03'),

(4, 2, 102, 'Absent',  '2025-01-01'),
(5, 2, 102, 'Absent',  '2025-01-02'),
(6, 2, 102, 'Present', '2025-01-03'),

(7, 3, 101, 'Present', '2025-01-01'),
(8, 3, 101, 'Present', '2025-01-02'),
(9, 3, 101, 'Present', '2025-01-03');

CREATE VIEW Monthly_Attendance_View AS
SELECT 
    s.Student_Name,
    c.Course_Name,
    (SUM(CASE WHEN a.Attendance_Status = 'Present' THEN 1 ELSE 0 END) * 100.0 
     / COUNT(*)) AS Attendance_Percentage
FROM Attendance a
JOIN Students s 
    ON a.Student_ID = s.Student_ID
JOIN Courses c 
    ON a.Course_ID = c.Course_ID
GROUP BY s.Student_Name, c.Course_Name
HAVING 
    (SUM(CASE WHEN a.Attendance_Status = 'Present' THEN 1 ELSE 0 END) * 100.0 
     / COUNT(*)) < 75;
