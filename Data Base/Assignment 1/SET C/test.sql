CREATE DATABASE employees;

\c 

CREATE TABLE stream(
	stream_id SERIAL PRIMARY KEY,
	stream_name VARCHAR(100) NOT NULL
);

SELECT * FROM stream;

INSERT INTO stream(stream_id, stream_name)
VALUES(012, 'BCS');

SELECT * FROM stream;