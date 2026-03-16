CREATE TABLE teacher(
t_no INT PRIMARY KEY,
t_name VARCHAR(20),
age INT,
yr_experience INT
);

CREATE TABLE subject(
s_no INT PRIMARY KEY,
s_name VARCHAR(15)
);

CREATE TABLE teacher_subject(
t_no INT,
s_no INT,
PRIMARY KEY(t_no,s_no),
FOREIGN KEY(t_no) REFERENCES teacher,
FOREIGN KEY(s_no) REFERENCES subject
);

INSERT INTO teacher VALUES
(1,'Sharma',45,20),
(2,'Mehta',38,12),
(3,'Kulkarni',40,15),
(4,'Patil',35,10);

INSERT INTO subject VALUES
(101,'Computer'),
(102,'Mathematics'),
(103,'Physics');

INSERT INTO teacher_subject VALUES
(1,101),
(2,102),
(3,101),
(4,103);

CREATE OR REPLACE FUNCTION teachers_by_subject(sub_name VARCHAR)
RETURNS VOID AS $$

DECLARE
rec RECORD;

cur CURSOR FOR
SELECT t.t_name
FROM teacher t
JOIN teacher_subject ts ON t.t_no=ts.t_no
JOIN subject s ON s.s_no=ts.s_no
WHERE s.s_name=sub_name;

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Teacher: %',rec.t_name;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;

SELECT teachers_by_subject('Computer');