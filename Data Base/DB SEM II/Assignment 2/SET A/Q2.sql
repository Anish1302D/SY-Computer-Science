CREATE TABLE student(
roll_no INT PRIMARY KEY,
name VARCHAR(30),
address VARCHAR(50),
class VARCHAR(10)
);

CREATE TABLE subject(
scode VARCHAR(10) PRIMARY KEY,
subject_name VARCHAR(20)
);

CREATE TABLE student_subject(
roll_no INT,
scode VARCHAR(10),
marks_scored INT,
PRIMARY KEY(roll_no,scode),
FOREIGN KEY(roll_no) REFERENCES student,
FOREIGN KEY(scode) REFERENCES subject
);

INSERT INTO student VALUES
(1,'Rahul Patil','Pune','SYBSc'),
(2,'Sneha Joshi','Mumbai','SYBSc'),
(3,'Amit Kulkarni','Nashik','TYBSc'),
(4,'Priya Deshmukh','Pune','SYBSc'),
(5,'Rohan Shah','Nagpur','FYBSc'),
(6,'Anjali Mehta','Pune','TYBSc');

INSERT INTO subject VALUES
('CS101','Database'),
('CS102','Computer Networks'),
('CS103','Operating System'),
('CS104','Data Structures'),
('CS105','Software Engineering');

INSERT INTO student_subject VALUES
(1,'CS101',85),
(1,'CS102',78),
(2,'CS101',90),
(2,'CS103',88),
(3,'CS104',70),
(3,'CS105',75),
(4,'CS101',82),
(4,'CS104',79),
(5,'CS102',65),
(6,'CS105',92);

SELECT 
s.roll_no,
s.name,
s.class,
sub.subject_name,
ss.marks_scored
FROM student s
JOIN student_subject ss ON s.roll_no = ss.roll_no
JOIN subject sub ON sub.scode = ss.scode;

CREATE OR REPLACE FUNCTION student_by_name(sname VARCHAR)
RETURNS TABLE(roll INT,name VARCHAR,address VARCHAR,class VARCHAR) AS $$

BEGIN

RETURN QUERY
SELECT roll_no,name,address,class
FROM student
WHERE name = sname;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION student_by_roll(r INT)
RETURNS TABLE(roll INT,name VARCHAR,address VARCHAR,class VARCHAR) AS $$

BEGIN

RETURN QUERY
SELECT roll_no,name,address,class
FROM student
WHERE roll_no = r;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION students_of_class(c VARCHAR)
RETURNS VOID AS $$

DECLARE
rec RECORD;
cur CURSOR FOR SELECT * FROM student WHERE class = c;

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Roll: %, Name: %, Address: %, Class: %',
rec.roll_no,rec.name,rec.address,rec.class;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;