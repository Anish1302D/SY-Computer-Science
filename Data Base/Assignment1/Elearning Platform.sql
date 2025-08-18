CREATE DATABASE elearning;
USE elearning;

CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration INT CHECK(duration > 0)
);

ALTER TABLE courses
ADD instructor_name VARCHAR(100) NOT NULL;

SELECT * FROM courses;
DROP TABLE courses;