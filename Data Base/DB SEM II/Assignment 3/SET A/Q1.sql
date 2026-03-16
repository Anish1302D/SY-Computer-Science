CREATE TABLE bus(
bus_no INT PRIMARY KEY,
capacity INT,
depot_name VARCHAR(20)
);

CREATE TABLE route(
route_no INT PRIMARY KEY,
source VARCHAR(20),
destination VARCHAR(20),
no_of_stations INT
);

CREATE TABLE bus_route(
bus_no INT,
route_no INT,
PRIMARY KEY(bus_no,route_no),
FOREIGN KEY(bus_no) REFERENCES bus(bus_no),
FOREIGN KEY(route_no) REFERENCES route(route_no)
);

INSERT INTO bus VALUES
(108,50,'Swargate'),
(110,45,'Shivajinagar'),
(120,40,'Katraj'),
(130,55,'Pimpri');

INSERT INTO route VALUES
(1,'Station','Airport',10),
(2,'Swargate','University',8),
(3,'Station','Market',6),
(4,'Airport','Pimpri',12);

INSERT INTO bus_route VALUES
(108,1),
(108,2),
(110,3),
(120,1),
(130,4);

CREATE OR REPLACE FUNCTION routes_of_bus108()
RETURNS VOID AS $$

DECLARE
rec RECORD;
cur CURSOR FOR
SELECT r.route_no,r.source,r.destination
FROM route r
JOIN bus_route br ON r.route_no=br.route_no
WHERE br.bus_no=108;

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Route: %, Source: %, Destination: %',
rec.route_no,rec.source,rec.destination;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;

SELECT routes_of_bus108();

CREATE OR REPLACE FUNCTION buses_station_airport()
RETURNS VOID AS $$

DECLARE
rec RECORD;

cur CURSOR FOR
SELECT b.bus_no,b.capacity
FROM bus b
JOIN bus_route br ON b.bus_no=br.bus_no
JOIN route r ON r.route_no=br.route_no
WHERE r.source='Station' AND r.destination='Airport';

BEGIN

OPEN cur;

LOOP
FETCH cur INTO rec;
EXIT WHEN NOT FOUND;

RAISE NOTICE 'Bus: %, Capacity: %',rec.bus_no,rec.capacity;

END LOOP;

CLOSE cur;

END;
$$ LANGUAGE plpgsql;

SELECT buses_station_airport();