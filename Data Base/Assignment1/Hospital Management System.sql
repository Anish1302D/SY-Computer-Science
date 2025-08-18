CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE patients(
	patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK(age > 0)
);

CREATE TABLE appointments(
	appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    date DATE NOT NULL
);

SELECT * FROM patients;
SELECT * FROM appointments;