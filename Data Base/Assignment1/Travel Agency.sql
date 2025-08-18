CREATE DATABASE travel_db;
USE travel_db;

CREATE TABLE destinations(
	dest_id SERIAL PRIMARY KEY,
    location VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

ALTER TABLE destinations
ADD price NUMERIC(8,2) NOT NULL;

SELECT * FROM destinations;
DROP TABLE destinations;