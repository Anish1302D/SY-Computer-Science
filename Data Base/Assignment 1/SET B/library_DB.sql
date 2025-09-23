CREATE DATABASE library_db2;

\c 

CREATE TABLE members(
	member_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	CHECK(member_id > 0)
);

SELECT * FROM members;

