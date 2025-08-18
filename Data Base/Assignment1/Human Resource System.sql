CREATE DATABASE hr_system;
USE hr_system;

CREATE TABLE departments(
	dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) UNIQUE
);

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept_id INT REFERENCES departments(dept_id),
    salary NUMERIC(10,2) CHECK (salary >= 30000)
);

SELECT * FROM departments;
SELECT * FROM employees;

DROP TABLE employees CASCADE;
