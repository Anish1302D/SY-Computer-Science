CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Class VARCHAR(10),
    City VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Amit', '10A', 'Mumbai'),
(2, 'Riya', '10B', 'Pune'),
(3, 'Sahil', '9A', 'Delhi'),
(4, 'Meera', '9B', 'Mumbai'),
(5, 'Kabir', '10A', 'Pune');

CREATE VIEW Student_View AS
SELECT Student_ID, Student_Name
FROM Students;

SELECT * FROM Student_View;
