CREATE DATABASE university;

\c 

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE
);

CREATE TABLE enrollments(
	student_id INT,
 	course_code VARCHAR(10),
 	PRIMARY KEY(student_id, course_code),
 	FOREIGN KEY (student_id) REFERENCES students(student_id)
);       

ALTER TABLE enrollments
ADD grade NUMERIC(3,2) CHECK(grade BETWEEN 0 AND 10);

SELECT * FROM students;
SELECT * FROM enrollments;																																														