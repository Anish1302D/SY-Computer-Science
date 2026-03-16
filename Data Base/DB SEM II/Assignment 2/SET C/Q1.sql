CREATE TABLE student(
sno INT PRIMARY KEY,
s_name CHAR(30),
s_class CHAR(10),
s_addr CHAR(50)
);

CREATE TABLE teacher(
tno INT PRIMARY KEY,
t_name CHAR(20),
qualification CHAR(15),
experience INT
);

CREATE TABLE student_teacher(
sno INT,
tno INT,
subject CHAR(20),
PRIMARY KEY(sno,tno),
FOREIGN KEY(sno) REFERENCES student(sno),
FOREIGN KEY(tno) REFERENCES teacher(tno)
);

INSERT INTO student VALUES
(1,'Rahul Patil','10A','Pune'),
(2,'Sneha Joshi','10B','Mumbai'),
(3,'Amit Kulkarni','9A','Nashik'),
(4,'Priya Deshmukh','9B','Pune'),
(5,'Rohan Shah','10A','Nagpur');

INSERT INTO teacher VALUES
(101,'Dr. Sharma','NET',12),
(102,'Prof. Mehta','PhD',8),
(103,'Mrs. Kulkarni','NET',10),
(104,'Mr. Patil','MSc',6),
(105,'Mrs. Shah','NET',15);

INSERT INTO student_teacher VALUES
(1,101,'Computer'),
(2,101,'Computer'),
(3,102,'Mathematics'),
(4,103,'Computer'),
(5,104,'Science'),
(1,105,'Computer'),
(2,105,'Computer'),
(3,105,'Computer');

SELECT 
s.s_name,
t.t_name,
st.subject
FROM student s
JOIN student_teacher st ON s.sno=st.sno
JOIN teacher t ON t.tno=st.tno;

CREATE OR REPLACE FUNCTION experienced_teacher_computer()
RETURNS TEXT AS $$

DECLARE
tname TEXT;

BEGIN

SELECT t_name INTO tname
FROM teacher t
JOIN student_teacher st ON t.tno = st.tno
WHERE st.subject='Computer'
ORDER BY experience DESC
LIMIT 1;

RETURN tname;

END;
$$ LANGUAGE plpgsql;

SELECT experienced_teacher_computer();

CREATE OR REPLACE FUNCTION teacher_max_subject()
RETURNS TEXT AS $$

DECLARE
tname TEXT;

BEGIN

SELECT t.t_name INTO tname
FROM teacher t
JOIN student_teacher st ON t.tno=st.tno
GROUP BY t.t_name
ORDER BY COUNT(st.subject) DESC
LIMIT 1;

RETURN tname;

END;
$$ LANGUAGE plpgsql;

SELECT teacher_max_subject();

CREATE OR REPLACE FUNCTION count_net_teachers()
RETURNS INT AS $$

DECLARE
total INT;

BEGIN

SELECT COUNT(*) INTO total
FROM teacher
WHERE qualification='NET';

RETURN total;

END;
$$ LANGUAGE plpgsql;

SELECT count_net_teachers();