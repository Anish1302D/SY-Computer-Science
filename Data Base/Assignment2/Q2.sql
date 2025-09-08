USE supplier_student_db;

-- Create Student table
CREATE TABLE Student (
    stud_no INT PRIMARY KEY,
    stud_name VARCHAR(50),
    address CHAR(10),
    phone_no INT,
    percentage FLOAT,
    class VARCHAR(10)
);

-- 1. Add constraint per_check
ALTER TABLE Student
ADD CONSTRAINT per_check CHECK (percentage > 35);

-- 2. Change column phone_no → mobile_no
ALTER TABLE Student RENAME COLUMN phone_no TO mobile_no;

-- 3. Update datatype of stud_name to TEXT
ALTER TABLE Student ALTER COLUMN stud_name TYPE TEXT;

-- 4. Rename table Student → Student_Master
ALTER TABLE Student RENAME TO Student_Master;

-- 5. Remove column address
ALTER TABLE Student_Master DROP COLUMN address;

-- 6. Drop Student_Master table
DROP TABLE Student_Master;

-- 7. Drop Employee table (if exists)
DROP TABLE IF EXISTS Employee;
