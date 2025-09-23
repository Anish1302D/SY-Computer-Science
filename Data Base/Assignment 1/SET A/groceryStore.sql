CREATE DATABASE Grocery_Store;

\c

CREATE TABLE items(
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR(100) NOT NULL,
	category VARCHAR(50)
);

ALTER TABLE items
ADD price NUMERIC(6,2) NOT NULL;

SELECT * FROM items;
