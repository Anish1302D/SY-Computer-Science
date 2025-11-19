CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    m_name VARCHAR(100) NOT NULL,
    release_year INT,
    budget NUMERIC(12,2)
);

CREATE TABLE Actor (
    actor_id SERIAL PRIMARY KEY,
    a_name VARCHAR(100) NOT NULL,
    role VARCHAR(100),
    charges NUMERIC(12,2),
    a_address VARCHAR(100),
    age INT
);

CREATE TABLE Movie_Actor (
    movie_id INT REFERENCES Movies(movie_id) ON DELETE CASCADE,
    actor_id INT REFERENCES Actor(actor_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, actor_id)
);

INSERT INTO Movies (m_name, release_year, budget) VALUES
('Pathaan', 2023, 2500000000),     -- 250 cr
('Jawan', 2023, 3000000000),       -- 300 cr
('KGF Chapter 2', 2022, 1000000000),
('Dunki', 2023, 850000000),
('Kantara', 2022, 160000000),
('Vikram', 2022, 1200000000);

INSERT INTO Actor (a_name, role, charges, a_address, age) VALUES
('Shah Rukh Khan', 'Lead', 500000000, 'Mumbai', 58),
('Deepika Padukone', 'Lead Actress', 300000000, 'Bangalore', 37),
('John Abraham', 'Villain', 200000000, 'Mumbai', 50),
('Yash', 'Lead', 150000000, 'Bangalore', 37),
('Rishab Shetty', 'Lead', 80000000, 'Udupi', 40),
('Vijay Sethupathi', 'Villain', 120000000, 'Chennai', 46),
('Nayanthara', 'Lead Actress', 150000000, 'Chennai', 39);

INSERT INTO Movie_Actor VALUES
(1, 1), (1, 2), (1, 3),        -- Pathaan
(2, 1), (2, 7), (2, 6),        -- Jawan
(3, 4),                        -- KGF 2
(4, 1), (4, 2),                -- Dunki
(5, 5),                        -- Kantara
(6, 6), (6, 7);                -- Vikram

SELECT a_name FROM Actor
WHERE a_name LIKE '%n';

SELECT m_name FROM Movies
WHERE budget = (SELECT MAX(budget) FROM Movies);

SELECT a_name FROM Actor
WHERE charges > 200000;

SELECT m_name FROM Movies
WHERE release_year = 2023;

SELECT a_name FROM Actor
WHERE a_address NOT IN ('Mumbai', 'Pune');

SELECT m_name FROM Movies
WHERE budget BETWEEN 10000000 AND 50000000;
