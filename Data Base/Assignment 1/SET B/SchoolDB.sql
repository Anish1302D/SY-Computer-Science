CREATE DATABASE school_db;

\c 

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL
);

ALTER TABLE destinations
ADD subject VARCHAR(50) DEFAULT 'General';

SELECT * FROM teachers;

