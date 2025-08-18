CREATE DATABASE school_db;
USE school_db;

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

ALTER TABLE teachers
ADD subject VARCHAR(50) DEFAULT 'General';

SELECT * FROM teachers;