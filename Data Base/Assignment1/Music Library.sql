CREATE DATABASE  music_db;
USE music_db;

CREATE TABLE albums(
	album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL
);

ALTER TABLE albums
ADD release_year INT;

SELECT * FROM albums;
DROP TABLE albums;