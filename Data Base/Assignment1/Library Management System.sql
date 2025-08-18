CREATE DATABASE library_db2;
USE library_db2;

CREATE TABLE members(
	member_id INT PRIMARY KEY,
    member_Name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    CHECK (member_id > 0)
);

SELECT * FROM members;

DROP TABLE members;