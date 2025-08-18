CREATE DATABASE grocery_store;
USE grocery_store;

CREATE TABLE items(
	item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50)
);

ALTER TABLE items
ADD Price FLOAT;
SELECT * FROM items;
DROP TABLE items;