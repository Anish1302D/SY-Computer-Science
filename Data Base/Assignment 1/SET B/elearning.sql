CREATE DATABASE elearning;

\c 

CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	duration INT CHECK(duration > 0)
);

ALTER TABLE destinations
ADD instructor_name VARCHAR(50) NOT NULL;

SELECT * FROM courses;
