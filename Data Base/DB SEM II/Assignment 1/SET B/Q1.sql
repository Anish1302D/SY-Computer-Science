CREATE TABLE Route (
    route_no INT PRIMARY KEY,
    source VARCHAR(30),
    destination VARCHAR(30),
    no_of_station INT
);

CREATE TABLE Bus (
    bus_no INT PRIMARY KEY,
    capacity INT,
    depot_name VARCHAR(30),
    route_no INT REFERENCES Route(route_no)
);

CREATE OR REPLACE PROCEDURE display_buses_by_route(p_route_no INT)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT bus_no, capacity, depot_name
        FROM Bus
        WHERE route_no = p_route_no
    LOOP
        RAISE NOTICE 'Bus No: %, Capacity: %, Depot: %',
                     rec.bus_no, rec.capacity, rec.depot_name;
    END LOOP;
END;
$$;

CALL display_buses_by_route(101);

CREATE OR REPLACE PROCEDURE update_route_source()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Route
    SET source = 'Pune'
    WHERE route_no = 101;

    RAISE NOTICE 'Source updated successfully for Route No 101';
END;
$$;

CALL update_route_source();
