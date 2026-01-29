CREATE TABLE Patient (
    p_no INT PRIMARY KEY,
    p_name VARCHAR(50),
    p_addr VARCHAR(100)
);

CREATE TABLE Doctor (
    d_no INT PRIMARY KEY,
    d_name VARCHAR(50),
    d_addr VARCHAR(100),
    city VARCHAR(30)
);

CREATE TABLE Patient_Doctor (
    p_no INT REFERENCES Patient(p_no),
    d_no INT REFERENCES Doctor(d_no),
    disease VARCHAR(30),
    no_of_visits INT
);

CREATE OR REPLACE PROCEDURE diabetes_patients(p_doctor_name VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT p.p_no, p.p_name, p.p_addr
        FROM Patient p
        JOIN Patient_Doctor pd ON p.p_no = pd.p_no
        JOIN Doctor d ON d.d_no = pd.d_no
        WHERE d.d_name = p_doctor_name
          AND pd.disease = 'Diabetes'
          AND pd.no_of_visits > 3
    LOOP
        RAISE NOTICE 'Patient No: %, Name: %, Address: %',
                     rec.p_no, rec.p_name, rec.p_addr;
    END LOOP;
END;
$$;

CALL diabetes_patients('Dr.Kumar');

CREATE OR REPLACE PROCEDURE total_visits_dr_kumar()
LANGUAGE plpgsql
AS $$
DECLARE
    total_visits INT;
BEGIN
    SELECT SUM(pd.no_of_visits)
    INTO total_visits
    FROM Patient_Doctor pd
    JOIN Doctor d ON d.d_no = pd.d_no
    WHERE d.d_name = 'Dr.Kumar';

    RAISE NOTICE 'Total number of visits of Dr.Kumar = %', total_visits;
END;
$$;

CALL total_visits_dr_kumar();
