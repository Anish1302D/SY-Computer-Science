CREATE DATABASE University;
USE University;

CREATE TABLE students(
	student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE enrollments(
	student_id INT,
    course_code VARCHAR(10),
    grade NUMERIC(3,2) CHECK(grade BETWEEN 0 AND 10),
    PRIMARY KEY(student_id, course_code),
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

SELECT * FROM students;
SELECT * FROM enrollments;

DROP TABLE enrollments;
DROP TABLE students;