CREATE DATABASE travel_db;

\c 

CREATE TABLE destinations(
	dest_id SERIAL PRIMARY KEY,
	location VARCHAR(100) NOT NULL,
	artist VARCHAR(100) NOT NULL
);

ALTER TABLE destinations
ADD price NUMERIC(8,2) NOT NULL;

SELECT * FROM destinations;

